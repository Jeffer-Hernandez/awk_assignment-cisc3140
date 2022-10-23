#!/usr/bin/awk -f
BEGIN { FS="," }
BEGIN {

#show question as output
print "What activity are squirrels most likely and least likely to be doing when sighted?"

#initialize a counters
running = 0
chasing = 0
climbing = 0
eating = 0
foraging = 0

#loop until EOF
do {
    #counting up each respective value
    if ($17 ~ /true/) running++;
    if ($18 ~ /true/) chasing++;
    if ($19 ~ /true/) climbing++;
    if ($20 ~ /true/) eating++;
    if ($21 ~ /true/) foraging++;
}while(getline != 0)

#create an array with the activity values
activity_val[0] = running
activity_val[1] = chasing
activity_val[2] = climbing
activity_val[3] = eating
activity_val[4] = foraging

#create a parallel array that keeps activity names
acitivity_name[0] = "running"
acitivity_name[1] = "chasing"
acitivity_name[2] = "climbing"
acitivity_name[3] = "eating"
acitivity_name[4] = "foraging"

#initialize most and least starting variables
most = 0
least = 10000

#loop to find largest value
for (x in activity_val){
    if (activity_val[x] > most){
        most = activity_val[x];
    }
}

#loop to find smallest value
for (x in activity_val){
    if (activity_val[x]<least){
        least = activity_val[x];
    }
}

#loop to scan array for largest and smallest value and display a message with the activity name
for (i = 0; i<=4; i++){
    if(activity_val[i] == most)
        printf( "The MOST common activity displayed by squirrels in central park is %s .\n", acitivity_name[i]);
    else if (activity_val[i] == least)
        printf( "The LEAST common activity displayed by squirrels in central park is %s .\n", acitivity_name[i]);
}

}