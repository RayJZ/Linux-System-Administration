#!/bin/bash
userfile=./logins
usernames=($(awk -F',' '{print $1}' $userfile))
names=($(awk -F',' '{print $2}' $userfile))
roles=$(awk -F',' '{print $3}' $userfile)

for index in "${!usernames[@]}";
do
  echo "${usernames[$index]}"
done

index=2
echo "${names[index*2]} ${names[index*2+1]}"
#readarray -t <<<"$names"
#echo "${MAPFILE[0]}"