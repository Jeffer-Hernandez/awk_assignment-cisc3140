#!/usr/bin/awk -f
BEGIN { FS="," }
BEGIN {

#show question as output
print "What is the most common primary color for squirrels in Central Park? What is the ratio of Gray to Cinnamon squirrels like?"

#initialize hectare population variables
gray_counter = 0
cin_counter = 0

#loop until EOF
do {
    #assigning the 5 largest values in the population column and their corresponding hectare name
    if ($9 ~ /Gray/) gray_counter++;
    else if ($9 ~ /Cinnamon/) cin_counter++;
}while(getline != 0)

#get ratio of gray squirrels to cinnamon
r = gray_counter/cin_counter

#print all values
if (gray_counter> cin_counter)
    printf( "The most common primary color for squirrels in Central Park is Gray.\n");
else
    printf( "The most common primary color for squirrels in Central Park is Cinnamon.\n");
printf("The ratio of Gray squirrels to Cinnamon colored squirrels is %.2f \n", r)
}