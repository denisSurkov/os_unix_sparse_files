#include <unistd.h>
#include <fcntl.h>
#include <stdbool.h>
#include "sparse_file_processor.h"


#define OUTPUT_FILE_OPEN_MODE (O_CREAT | O_WRONLY)
#define OUTPUT_FILE_RIGHTS (S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH)

#define INPUT_FILE_OPEN_MODE O_RDONLY

void process_sparse_creation(int inputFd, int outputFd, size_t blockSize) {
    char * readBuffer[blockSize];
    for (int i = 0; i < blockSize; ++i) {
        readBuffer[i] = 0;
    }

    size_t totalFileSize = 0;

    while (true) {
        size_t readSize = read(inputFd, readBuffer, blockSize);
        if (readSize == 0) break;
        if (readSize == -1) {
            // todo:
            return;
        }
        totalFileSize += readSize;

        bool hasNonZero = false;
        for (int i = 0; i < readSize; ++i) {
            if (readBuffer[i] != 0) {
                hasNonZero = true;
                break;
            }
        }

        if (hasNonZero) {
            write(outputFd, readBuffer, readSize);
            continue;
        }

        lseek(outputFd, readSize, SEEK_CUR);
    }

    ftruncate(outputFd, totalFileSize);
}

void process_sparse_file_creation(char * inputFilename, char * outputFilename, int blockSize) {
    // todo: add error handling for open() call
    int outputFd = open(outputFilename, OUTPUT_FILE_OPEN_MODE, OUTPUT_FILE_RIGHTS);
    int inputFd = STDIN_FILENO;
    if (inputFilename != NULL) {
        inputFd = open(inputFilename, INPUT_FILE_OPEN_MODE);
    }

    process_sparse_creation(inputFd, outputFd, blockSize);

    close(outputFd);
    if (inputFd != STDIN_FILENO) {
        close(inputFd);
    }
}

