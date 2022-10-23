#!/usr/bin/awk -f
BEGIN { FS="," }
BEGIN {

#show question as output
print "What are the codes for the top 5 most squirrel-populated hectares in central park?"

#initialize hectare population variables
hec1_pop = 0
hec2_pop = 0
hec3_pop = 0
hec4_pop = 0
hec5_pop = 0

#initialize string variables to hold hectare names
hec1_name = ""
hec2_name = ""
hec3_name = ""
hec4_name = ""
hec5_name = ""

#loop until EOF
do {
    #assigning the 5 largest values in the population column and their corresponding hectare name
    if ($7 ~ /^[0-9]+$/ && $7 >= hec1_pop){ hec1_pop = $7; hec1_name = $3}
    else if($7 ~ /^[0-9]+$/ && $7 < hec1_pop && $7 >= hec2_pop){ hec2_pop = $7; hec2_name = $3}
    else if($7 ~ /^[0-9]+$/ && $7 < hec1_pop && $7 < hec2_pop && $7 >= hec3_pop){ hec3_pop = $7; hec3_name = $3}
    else if($7 ~ /^[0-9]+$/ && $7 < hec1_pop && $7 < hec2_pop && $7 < hec3_pop && $7 >= hec4_pop){ hec4_pop = $7; hec4_name = $3}
    else if($7 ~ /^[0-9]+$/ && $7 < hec1_pop && $7 < hec2_pop && $7 < hec3_pop && $7 < hec4_pop && $7 >= hec5_pop){ hec5_pop = $7; hec5_name = $3}
}while(getline != 0)

#print all values
printf( "The top 5 MOST populated Hectares in Central Park are: \n1. %s with a population of %d \n", hec1_name, hec1_pop);
printf("2. %s with a population of %d \n", hec2_name, hec2_pop);
printf("3. %s with a population of %d \n", hec3_name, hec3_pop);
printf("4. %s with a population of %d \n", hec4_name, hec4_pop);
printf("5. %s with a population of %d \n", hec5_name, hec5_pop);
}