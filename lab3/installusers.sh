#!/bin/bash

touch /etc/profile.d/set-umask-for-all-users.sh
echo 'umask 007' > /etc/profile.d/set-umask-for-all-users.sh

#groups
groupadd --gid 4001 managers
groupadd --gid 4002 sales
groupadd --gid 4003 accounting

#Each user should have a username and user private group of the form
#first-initial last-name, password, unique uid, unique gid, /path/to/login/shell, and /path/to/home/directory/.

userfile=./logins
usernames=($(awk -F',' '{print $1}' $userfile))
names=($(awk -F',' '{print $2}' $userfile))
roles=($(awk -F',' '{print $3}' $userfile))

for index in "${!usernames[@]}";
do
  role="${roles[$index]}"
  name="${names[index*2]} ${names[index*2+1]}"
  #use adduser for correct shell copy. useradd defaults to 'sh' instead of 'bash'
  useradd -m "${usernames[$index]}" -p "goodpasswd" --create-home --user-group --uid $(("3000+$index")) -c "$name"
  if [ -n "$role" ]
    then
      usermod -a -G "$role" "${usernames[$index]}"
    fi
done

usermod -aG wheel oldo5582

#useradd -m mscott -p "goodpasswd" --create-home --user-group --uid $(("3000+3")) -c "Michael Scott"
#userdel -r mscott