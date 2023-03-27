#include <unistd.h>
#include <fcntl.h>
#include <stdbool.h>
#include <stdio.h>
#include "sparse_file_processor.h"


#define OUTPUT_FILE_OPEN_MODE (O_CREAT | O_WRONLY)
#define OUTPUT_FILE_RIGHTS (S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH)

#define INPUT_FILE_OPEN_MODE O_RDONLY

int check_error_and_write_msg(int errorMarker, char * msg) {
    if (errorMarker == -1) {
        perror(msg);
        return errorMarker;
    }
    return 0;
}

int process_sparse_creation(int inputFd, int outputFd, size_t blockSize) {
    char readBuffer[blockSize];
    for (int i = 0; i < blockSize; ++i) {
        readBuffer[i] = 0;
    }

    int errorMarker;

    size_t totalFileSize = 0;
    while (true) {
        size_t readSize = read(inputFd, readBuffer, blockSize);
        if (readSize == 0) break;

        if (check_error_and_write_msg(readSize, "failed to read from input") == -1) return -1;

        totalFileSize += readSize;

        bool hasNonZero = false;
        for (int i = 0; i < readSize; ++i) {
            if (readBuffer[i] != 0) {
                hasNonZero = true;
                break;
            }
        }

        if (hasNonZero) {
            errorMarker = write(outputFd, readBuffer, readSize);

            if (check_error_and_write_msg(errorMarker, "failed to write output") == -1) return -1;
            continue;
        }

        errorMarker = lseek(outputFd, readSize, SEEK_CUR);
        if (check_error_and_write_msg(errorMarker, "failed to lseek in output file") == -1) return -1;
    }

    errorMarker = ftruncate(outputFd, totalFileSize);
    if (check_error_and_write_msg(errorMarker, "failed to ftruncate output file") == -1) return -1;

    return 0;
}

int process_sparse_file_creation(char * inputFilename, char * outputFilename, int blockSize) {
    int outputFd = open(outputFilename, OUTPUT_FILE_OPEN_MODE, OUTPUT_FILE_RIGHTS);
    if (check_error_and_write_msg(outputFd, "failed to open output file") == -1) return -1;

    int inputFd = STDIN_FILENO;
    if (inputFilename != NULL) {
        inputFd = open(inputFilename, INPUT_FILE_OPEN_MODE);
        if (check_error_and_write_msg(inputFd, "failed to open input file") == -1) return -1;
    }

    int errorMarker;

    errorMarker = process_sparse_creation(inputFd, outputFd, blockSize);
    if (check_error_and_write_msg(errorMarker, "failed to create sparse failed") == -1) return -1;

    errorMarker = close(outputFd);
    if (check_error_and_write_msg(errorMarker, "failed to close output file") == -1) return -1;

    if (inputFd != STDIN_FILENO) {
        errorMarker = close(inputFd);
        if (check_error_and_write_msg(errorMarker, "failed to close input file") == -1) return -1;
    }

    return 0;
}

