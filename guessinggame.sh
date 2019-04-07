#!/bin/bash

echo "Welocome to the guessing game"

echo "Would you like to exclude the hidden files(.*) Enter yes(YES) or y(Y)"

read exclude_hiddenfiles

[[ $exclude_hiddenfiles == [yY] || $exclude_hiddenfiles == [yY][eE][sS] ]] || exclude_hiddenfiles="No"

[[ $exclude_hiddenfiles == No ]] || exclude_hiddenfiles="Yes"

echo "Value entered is $exclude_hiddenfiles"

[[ $exclude_hiddenfiles == "Yes" ]] && actualNoOfFiles=$(find . -maxdepth 1 -type f -not -path '*/\.*' | wc -l)
[[ $exclude_hiddenfiles == "No" ]] && actualNoOfFiles=$(find . -maxdepth 1 -type f | wc -l)

while (( noOfFiles != actualNoOfFiles )); do
        echo "Please provide many files are there in the currect directory ?"
        read noOfFiles
	if ! [[ "$noOfFiles" =~ ^[0-9]+$ ]]; then
	echo "Please enter positive integer number only"
	noOfFiles=-1
	continue
	fi
        noOfFiles=$(echo "ibase=10; $noOfFiles" | bc)
	if (( noOfFiles < actualNoOfFiles )); then
	echo "Guess is too low"
	elif (( noOfFiles > actualNoOfFiles )); then
	echo "Guess is too high"
	fi
done

[[ noOfFiles -eq actualNoOfFiles ]] && echo "Congratulations!! you have guessed correct number of files"
