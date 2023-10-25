#! /bin/bash

# Create United States folder if it does not exit
mkdir -p 'United States'

# Set field separator to new line
IFS=$'\n'

# Run a while loop that takes in all the United States Category lines
# Grab the lines that are: Music, Entertainment, Gaming, and Comedy
# Output those lines in their specific text file in the United States folder
while read -r category
do
	if [ "$category" = 'Music' ] || [ "$category" = 'Entertainment' ] || [ "$category" = 'Gaming' ] || [ "$category" = 'Comedy' ]
	then
		echo "$category" >> "United States/$category.txt"
	fi
done < <(grep -i 'United States,US' $1 | awk -F , '{print $5}')

# For each category text file in the United States Directory
# Count the number of entries and output the results into ws5.txt
for FILE in United\ States/*.txt
do
	entries=$(wc -l $FILE)
	echo "$entries entries" >> ws5.txt
done
