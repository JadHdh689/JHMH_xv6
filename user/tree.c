#include "types.h"
#include "stat.h"
#include "fs.h"
#include "user.h"

void tree(char *path, int level) {
    char buf[512], *p;
    int fd;
    struct dirent de;
    struct stat st;

    if ((fd = open(path, 0)) < 0) {
        printf(1, "tree: cannot open %s\n", path);
        return;
    }

    if (fstat(fd, &st) < 0) {
        printf(1, "tree: cannot stat %s\n", path);
        close(fd);
        return;
    }

    if (st.type == T_FILE) {
        for (int i = 0; i < level; i++)
            printf(1, "  ");
        printf(1, "%s\n", path);
        close(fd);
        return;
    }

    for (int i = 0; i < level; i++)
        printf(1, "  ");
    printf(1, "%s/\n", path);

    while (read(fd, &de, sizeof(de)) == sizeof(de)) {
        if (de.inum == 0)
            continue;
        if (!strcmp(de.name, ".") || !strcmp(de.name, ".."))
            continue;

        memmove(p = buf, path, strlen(path));
        p[strlen(path)] = '/';
        strcpy(p + strlen(path) + 1, de.name);

        if (stat(buf, &st) >= 0) {
            if (st.type == T_DIR)
                tree(buf, level + 1);
            else {
                for (int i = 0; i < level + 1; i++)
                    printf(1, "  ");
                printf(1, "%s\n", de.name);
            }
        }
    }
    close(fd);
}

int main(int argc, char *argv[]) {
    if (argc < 2)
        tree(".", 0);
    else
        tree(argv[1], 0);

    exit();
}
