#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

#define SIZE 1024

/* Snippet to demonstrate the snprintf() pointer accumulation bug */
int main(int argc, char** argv) {
    char* buf = malloc(SIZE);
    char* text = NULL;
    char* q = text; //indexing ptr into text
    size_t len = 0; //of bytes written to buf 
    size_t tlen = 0; //length on source text

    text = malloc(SIZE);
    strcpy(text, "the quick brown fox jumped over the lazy dog");
    q = text;
    tlen = strlen(text);
    bool islast = false;
    printf("Input String = \"%s\"", text);
    while (!islast && ((q-text) < tlen) && (len < SIZE)) {
	char* t = index(q, ' '); //find the space
	if (t == NULL) {
		islast = true; //means we are at the last word
		t = text + tlen; //point at the end of the string 
	}
	size_t bytes = (t-q); //bytes to write
	*t = '\0'; //re-write the space so we can use the word
	//BUG: Unsafe pointer accummulation using snprintf()
        len += snprintf(buf+len, 100, "%7s: %3zu\n", q, bytes);
	q = t + 1; //next word
    }
    printf("Output: \n");
    printf("%s\n", buf);
    return 0;
}
