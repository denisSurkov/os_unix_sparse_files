#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include "main.h"
#include "sparse_file_processor.h"

int main(int argc, char * argv[]) {
    if (argc <= 1) {
        fprintf(stderr, "usage: %s [input_filename] outputfilename [-b block_size]\n", argv[0]);
        return  -1;
    }

    char * inputFilename = getInputFilename(argc, argv);
    char * outputFilename = getOutputFilename(argc, argv);
    if (outputFilename == NULL) {
        return -1;
    }
    int blockSize = getBlockSize(argc, argv);

    fprintf(stdout, "%s %s %d\n", inputFilename, outputFilename, blockSize);
    process_sparse_file_creation(inputFilename, outputFilename, blockSize);

    return 0;
}


char * getInputFilename(int argc, char * argv[]) {
    return "A";
}

char * getOutputFilename(int argc, char * argv[]) {
    if (argc == 2) {
        if (argv[1][0] == '-') {
            fprintf(stderr, "usage: %s [input_filename] outputfilename [-b block_size]\n", argv[0]);
            return NULL;
        }
        return argv[1];
    }

    if (argc >= 6) {
        fprintf(stderr, "usage: %s [input_filename] outputfilename [-b block_size]\n", argv[0]);
        return NULL;
    }

    if (argc == 4) {
        return argv[1];
    }

    return argv[2];
}

int getBlockSize(int argc, char * argv[]) {
    int blockSize = 4096;

    int blockSizeArgument = getopt(argc, argv, "b:");
    if (blockSizeArgument == 'b') {
        blockSize = atoi(optarg);
    }

    return blockSize;
}
