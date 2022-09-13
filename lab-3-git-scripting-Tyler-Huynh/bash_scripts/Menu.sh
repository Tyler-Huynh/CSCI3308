#!/bin/sh
echo "Current file name:"
echo $0

echo "What command line argument would you like to use:"
echo $1

function find_words(){ 
    echo "
          Here are the lines for the word 'Linux': 
                                                 "
    grep -in 'Linux' lab3_sample.txt 

    echo "
          Here are the lines for the word 'functions': 
                                                     "
    grep -in 'functions' lab3_sample.txt 

    echo "
          Here are the lines for the word 'Bash': 
                                                "
    grep -in 'Bash' lab3_sample.txt 

    echo "
          Here are the lines for the word 'runs': 
                                                "
    grep -in 'runs' lab3_sample.txt 
}

function add_text(){
    echo "Enter the sentence you would like to add here (This will add it to the end of the text file): "
    read user_sentence
    echo $user_sentence >> lab3_sample.txt
}

function delete_word(){
    echo "Please enter the word that you would like deleted: "
    read delete
    sed -ie "s/$delete//g" lab3_sample.txt
    
}

function replace_first_occurence(){
    echo "Please enter in the word that would like replaced: "
    read old_word

    echo "Please enter in the new word to replace the old one: "
    read new_word

    sed -ie "s/$old_word/$new_word/1" lab3_sample.txt
}



if [ -f "$1" ];
    then  
        while true;
            do

                echo "Select from the following options: 
                      1 - Finding a word(s) from the text file
                      2 - Adding text to the selected file
                      3 - Deleting a word from the selected file
                      4 - Replacing words within the selected file
                      5 - Copying the contents of this file to a new one to be created
                      6 - Exit the program" 
                echo "Please select what you would like to do, by entering a number (1-6):"
                    read number
                    case $number in
                        1)
                            find_words
                            ;;
                        2)
                            add_text
                            ;;
                        3)
                            delete_word
                            ;;    
                        4)
                            replace_first_occurence
                            ;;
                        5)
                            ;;
                        6)
                            echo "Goodbye."
                            exit 0;
                            ;;
                        *)
                            echo "Please enter in a valid number."
                            exit 0;
                            ;;
                    esac
        done
    else   
        echo "$1 does not exist."
        exit 0;
fi

