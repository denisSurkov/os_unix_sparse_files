#include <unistd.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>

#include "main.h"
#include "sparse_file_processor.h"

int main(int argc, char * argv[]) {
    int argsCountBeforeOptional = getCountArgumentsBeforeOptional(argc, argv);
    if (argc <= 1 || argsCountBeforeOptional == 0 || argsCountBeforeOptional > 2) {
        fprintf(stderr, "usage: %s [input_filename] outputfilename [-b block_size]\n", argv[0]);
        return  -1;
    }

    bool hasTwoFilesInput = argsCountBeforeOptional == 2;

    char * inputFilename = hasTwoFilesInput ? argv[1] : NULL;
    char * outputFilename = hasTwoFilesInput ? argv[2] : argv[1];
    int blockSize = getBlockSize(argc, argv);

    return process_sparse_file_creation(inputFilename, outputFilename, blockSize);
}

int getCountArgumentsBeforeOptional(int argc, char * argv[]) {
    int countBeforeOptional = 0;
    for (int i = 1; i < argc; ++i) {
        if (argv[i][0] == '-') break;
        countBeforeOptional++;
    }
    return countBeforeOptional;
}


int getBlockSize(int argc, char * argv[]) {
    int blockSize = 4096;

    int blockSizeArgument = getopt(argc, argv, "b:");
    if (blockSizeArgument == 'b') {
        blockSize = (int) strtol(optarg, NULL, 10);
    }

    return blockSize;
}
