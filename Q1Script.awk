#!/usr/bin/awk -f
BEGIN { FS="," }
BEGIN {

#show question as output
print "What is the ratio of adult to juvenile squirrels?"

#initialize a counters
a=0
j=0

#loop until EOF
do {
    if ($8 ~ /Adult/) a++;
    if ($8 ~ /Juvenile/) j++;
}
while(getline != 0)

#get ratio
r = a/j

#print result as output
printf( "The ratio of adult to juvenile squirrels is %.2f .\n", r)
}




