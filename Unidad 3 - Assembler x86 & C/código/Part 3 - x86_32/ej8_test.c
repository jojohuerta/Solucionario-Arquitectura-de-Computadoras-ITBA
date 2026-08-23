extern int file_open(const char* path, int flags, int mode);
extern int fd_read(int fd, char* buf, int count);
extern int fd_write(int fd, const char* buf, int count);
extern int file_close(int fd);

//print a single char
void print_char(char c) {
    fd_write(1, &c, 1); // 1 = STDOUT
}

void print_string(const char* str) {
    int len = 0;
    while (str[len] != '\0') {
        len++;
    }
    fd_write(1, str, len);
}

// num2str and then prints it
void print_number(int num) {
    if (num == 0) {
        print_char('0');
        return;
    }
    
    char buffer[12];
    int i = 11;
    
    while (num > 0) {
        buffer[i] = (num % 10) + '0'; // ASCII Conversion
        num = num / 10;
        i--;
    }
    
    fd_write(1, &buffer[i + 1], 11 - i);
}

int main() {
    // 0 is the O_RDONLY flag (Read only)
    int fd = file_open("test.txt", 0, 0); 
    
    if (fd < 0) {
        print_string("Error opening file\n");
        return 1;
    }

    char c;
    int line_num = 1;

    // byte reading until fd_read returns 0
    while (fd_read(fd, &c, 1) > 0) {
        if (c == '\n') {
            // If LF, we print the line number
            print_string(" | Line: ");
            print_number(line_num);
            print_char('\n');
            line_num++;
        } else {
            print_char(c);
        }
    }

    file_close(fd);
    exit(0);
}