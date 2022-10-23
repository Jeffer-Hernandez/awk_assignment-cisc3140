#!/usr/bin/awk -f
BEGIN { FS="," }
BEGIN {

#show question as output
print "Are you more likely to see a squirrel on the ground or above?"

#initialize a counters
g=0
a=0

#loop until EOF
do {
    if ($15 ~ /Above Ground/) a++;
    if ($15 ~ /Ground Plane/) g++;
}while(getline != 0)



#get ratio
# abov_freq = a/NR 
# ground_freq = g/NR 
print a
print g
#print result as output
printf( "The probability of seeing a squirrel on the ground is about %.3f \n", g)
printf( "The probability of seeing a squirrel on the ground is about %.3f \n", a)

}