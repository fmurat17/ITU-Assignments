/**
 *  Istanbul Technical University
 *  assignment4.c
 *  Objective: Finding a hidden sentence in a book.
 *  
 *  @author Fatih MURAT(150170039)
 *  @compile --> gcc -std=c99 -Wall -Werror assignment4.c -o assignment
 */

#include <stdio.h>
#include <stdlib.h> // malloc() free()
#include <string.h> // strcat()

#define MAX_LINE 10000
#define MAX_LINE_LENGTH 200

/**
 *  @function ispunct1
 *  @brief Checks if the parameter c is punctuation or not.
 *
 *  @param c A character to be checked.
 *  @return 1 or 0.
 */
int ispunct1(char c){
    if((c >= 33 && c <= 47) || (c >= 58 && c <= 64) || (c >= 91 && c <= 96) || (c >= 123 && c <= 126)){
        return 1;
    }else{
        return 0;
    }
} //! " # $ % & ' ( ) * + , - . / : ; < = > ? @ [ \ ] ^ _ ` { | } ~

/**
 *  @struct instruction_s
 *  @brief Stores the instructions that will come from text file.
 *
 *  @var step Line index of the book to be processed.
 *  @var index Word index of the line which is determined by the step.
 */
struct instruction_s{
    int step;
    int index;
};

/**
 *  @function get_word
 *  @brief Extracts thw wanted word from the given line of the book.
 *
 *  @param s Line.
 *  @param n Index of the wanted word.
 *  @param word Wanted word to be returned.
 *  @return Character array wanted word.
 */
char* get_word(char* s, int n, char* word){
    int i = 0, j = 0;
    int index_counter = 0;
    
    while(s[i] != '\0'){
        if(n - 1 == index_counter){
            while((s[i] != ' ') && (s[i] != '\n') && (s[i] != '\0')){
                word[j] = s[i]; // Extractes wanted word from line to word.
                j++;
                i++;
            }
            return word;
        }else if(s[i] == ' '){
            index_counter++;
            if(s[i] == ' '){
                while(s[i+1] == ' '){ // Overlaps the subsequent space characters if they exist.
                    i++;
                }
            }
        }
        i++;
    }
    return word;
};

/**
 *  @function adjust_line
 *  @brief Adjust the lines of the book according to the given rules in the assignment pdf.
 *
 *  @param line A line of the book to be adjusted.
 *  @return Does not return anything. Only adjusts the parameter line.
 */
void adjust_line(char* line){
    int i = 0;
    while(line[i] != '\0'){
        if (line[i] >= 65 && line[i] <= 90) { // Checks if the letter is uppercase.
            line[i] += 32; // Makes it lowercase.
        }else if(ispunct1(line[i])){
            line[i] = 'X'; // If character is punctuation, it is marked with 'X'. 
        }else if(line[i] == '\n'){
            line[i] = ' ';
        }
        i++;
    }
    
    int j = 0;
    i = 0;
    while(line[i] != '\0'){ // This while loop removes the punctuations which are marked in line 92.
        if(line[i] != 'X'){
            line[j] = line[i];
            j++;
        }
        i++;
    }
    line[j] = '\0';
}

/**
 *  @function get_sentence
 *  @brief Finds the hidden sentence according to given parameters.
 *  
 *  @param lines All lines of the book which is already adjusted with the function adjust_line(char*).
 *  @param instructions instruction_s array that stores the instructions.
 *  @param n_instructions Number of instructions.
 *  @param sentence Character array that hidden sentence is stored.
 *  @return Does not return anything. Adds determined words to the parameter sentence.
 */
void get_sentence(char** lines, struct instruction_s* instructions, int n_instructions, char* sentence){
    int current_line = 0;
    char* word = (char*) malloc(sizeof(char) * MAX_LINE_LENGTH);
    for(int i = 0; i < n_instructions; i++){
        for(int j = 0; j < MAX_LINE_LENGTH; j++){
            word[j] = '\0';
        }
        current_line += instructions[i].step;
        strcat(sentence, get_word(lines[current_line-1], instructions[i].index, word));
        strcat(sentence, " ");
    }
    free(word);
}

int main(int argc, char* argv[]){

    char** book = (char**) malloc(sizeof(char*) * MAX_LINE); // Memory allocation for number of lines of the book
    for(int i = 0; i < MAX_LINE; i++){ // Memory allocation for length of each lines of the book
        book[i] = (char*) malloc(sizeof(char) * MAX_LINE_LENGTH);
    }

    FILE* read_from_book = fopen(argv[1], "r");
    if(!(read_from_book)){ // Checks if the file can not be opened
        printf("alice.txt can not be opened!!!");
        return 0;
    }

    int i = 0;
    while(fgets(book[i], MAX_LINE_LENGTH, read_from_book) != NULL){
        adjust_line(book[i]);
        i++;
    }
    
    FILE* read_from_instructions = fopen(argv[2], "r");
    if(!(read_from_instructions)){ // Checks if the file can not be opened
        printf("instruction file can not be opened!!!");
        return 0;
    }
        
    struct instruction_s* instructions = (struct instruction_s*) malloc(sizeof(struct instruction_s) * 300);
    i = 0;
    int number = 0;
    while(!feof(read_from_instructions)){
        if(fscanf(read_from_instructions, "%d %d", &instructions[i].step, &instructions[i].index) == 2){
            number++;
        }
        i++;
    }

    char* sentence = (char*) malloc(sizeof(char) * MAX_LINE);
    get_sentence(book, instructions, number, sentence);
    printf("%s\n", sentence);

    // Allocated memories are freed in the following lines in order to prevent memory leaks.
    for(i = 0; i < MAX_LINE; i++){
        free(book[i]);
    }
    free(book);
    free(instructions);
    free(sentence);

    // Opened files are closed in the following lines.
    fclose(read_from_instructions);
    fclose(read_from_book);

    return 0;
}