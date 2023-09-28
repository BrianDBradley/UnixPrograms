# Name: Brian Bradley and Karyn Remsing CS4350 - Unix Systems Programming
# Serial Numbers: 3 and X
# Assignment Number: 3
# Due Date: 9 / 29 / 2023 No later than 10:00 a.m.
echo "Shell programming by Brian Bradley and Karyn Remsing" 
echo ""
echo "	1. Creating new file zNew.txt."
echo "Fall 2023" > zNew.txt
echo "CS4350" >> zNew.txt
echo "Section #" >> zNew.txt
echo "001" >> zNew.txt
echo "scripts and shell programming using" >> zNew.txt
echo "zeus ide" >> zNew.txt
echo "@ TEXAS STATE UNIVERSITY" >> zNew.txt

echo""
echo""
echo"	2. The content of the created file is: "

cat zNew.txt

echo ""
echo "All lines with alphabet characters: "
grep [[:alpha:]] zNew.txt

echo ""
echo "All lines with digiits:"
grep [[:digit:]] zNew.txt

echo ""
echo "All lines with lowercase letters:"
grep [[:lower:]] zNew.txt

echo ""
echo "All lines with uppercase letters: "
grep [[:upper:]] zNew.txt

echo ""
echo "All lines with alphanumeric characters: "
grep [[:alnum:]] zNew.txt

echo "" 
echo "All lines with punctuation characters: "
grep [[:punct:]] zNew.txt

# Wow turns out this is stupid easy. I'm gonna go ahead and stop here so I don't take all the easy ones. Go to slide 133 in his 3rd set of slides and just
# replace [[::]] with whatever you're looking for from that slide. I'll check back in on this later
