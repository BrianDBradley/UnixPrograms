# Name: Brian Bradley and Karyn Remsing CS4350 - Unix Systems Programming
# Serial Numbers: 3 and X
# Assignment Number: 3
# Due Date: 9 / 29 / 2023 No later than 10:00 a.m.
echo "Shell programming by Brian Bradley and Karyn Remsing" 
echo ""
echo "  1. Creating new file zNew.txt."
echo "Fall 2023" > zNew.txt
echo "CS4350" >> zNew.txt
echo "Section #" >> zNew.txt
echo "001" >> zNew.txt
echo "scripts and shell programming using" >> zNew.txt
echo "zeus ide" >> zNew.txt
echo "@ TEXAS STATE UNIVERSITY" >> zNew.txt

echo ""
echo ""
echo "  2. The content of the created file is: "

cat zNew.txt

echo ""
echo "  3. All lines with alphabet characters: "
grep [[:alpha:]] zNew.txt

echo ""
echo "  4. All lines with digits:"
grep [[:digit:]] zNew.txt

echo ""
echo "  5. All lines with lowercase characters:"
grep [[:lower:]] zNew.txt

echo ""
echo "  6. All lines with uppercase characters: "
grep [[:upper:]] zNew.txt

echo ""
echo "  7. All lines with alphanumeric characters: "
grep [[:alnum:]] zNew.txt

echo "" 
echo "  8. All lines with punctuation characters: "
grep [[:punct:]] zNew.txt

echo "" 
echo "  9. All the lines with the letter s followed by space: "
grep s[[:space:]] zNew.txt

echo "" 
echo "  10. All the lines with the word zeus followed by space: "
grep zeus[[:space:]] zNew.txt

echo "" 
echo "  11. All the line that the word programming appears at the end of the line : "
grep programming$ zNew.txt

echo "" 
echo "  12. All the lines that the word Fall appears at the beginning of the sentence : "
grep ^Fall zNew.txt

echo "" 
echo "  13. All lines that has a word that starts with C and ends with 0 : "
grep ^C.*0$ zNew.txt

echo "" 
echo " 14.  All lines that contain a word that starts with s and end with l :"
grep -E s.*l zNew.txt

echo "" 
echo " 15.  Deleting the existing File zNew.txt :"
rm zNew.txt

echo "" 
echo " 16.  Display the content of zNew.txt :"
if [ -f "zNew.txt" ]
then
	cat zNew.txt
else
	echo "zNew.txt Does Not Exist"
fi

echo "" 
echo "" 
echo "Prepared by Brian Bradley and Karyn Remsing"
echo "" 
echo "9 - 29 - 23"
