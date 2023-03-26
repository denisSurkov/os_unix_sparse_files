#include <unistd.h>
#include <fcntl.h>

#include <sys/stat.h>
#include <stdio.h>

#define TEST_FILENAME "A"
#define TEST_FILE_MODE (S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH)
#define TEST_FILE_OPEN_MODE (O_CREAT | O_WRONLY)

const unsigned int G_BUFFER_SIZE = 4 * 1024 * 1024 + 1;

int main(void)
{
    unsigned char zeroBuffer[G_BUFFER_SIZE];
    for (int i = 0; i < G_BUFFER_SIZE; ++i) {
        zeroBuffer[i] = 0;
    }
    unsigned char one[1] = { 1 };

    int file = open(TEST_FILENAME, TEST_FILE_OPEN_MODE, TEST_FILE_MODE);
    if (file == -1) {
        perror("Failed to create test file: ");
        return -1;
    }

    write(file, zeroBuffer, G_BUFFER_SIZE);

    lseek(file, 0, SEEK_SET);
    write(file, one, 1);

    lseek(file, 10000, SEEK_SET);
    write(file, one, 1);

    lseek(file, -1, SEEK_END);
    write(file, one, 1);

    close(file);
    return 0;
}
