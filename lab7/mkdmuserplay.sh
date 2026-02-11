#!/bin/bash

passwd_file="/etc/passwd"
shadow_file="/etc/shadow"
group_file="/etc/group"
playbook_file="./dmusers.yaml"

echo "---" > "$playbook_file"
chown oldo5582 "$playbook_file"
# shellcheck disable=SC2129
echo "- name: Lab7 User Setup" >> "$playbook_file"
echo "  hosts: saclass" >> "$playbook_file"
echo "  become: true" >> "$playbook_file"
echo "  remote_user: oldo5582" >> "$playbook_file"
echo "  tasks:" >> "$playbook_file"

while IFS=: read -r user _ uid gid gecos home shell; do
    if [[ gid -ge 3000 && gid -le 4000 ]]; then
      hash=$(awk -F: -v user="$user" '$1 == user {print $2}' "$shadow_file")
      groups=$(awk -F: -v user="$user" '$0 ~ user {print $1}' "$group_file" | tr '\n' ',' | sed 's/,$//')
      # shellcheck disable=SC2129
      echo "  - name: Set parameters for user $user" >> "$playbook_file"
      echo "    user:" >> "$playbook_file"
      echo "      name: $user" >> "$playbook_file"
      echo "      uid: $uid" >> "$playbook_file"
      echo "      group: $gid" >> "$playbook_file"
      echo "      comment: '$gecos'" >> "$playbook_file"
      echo "      home: '$home'" >> "$playbook_file"
      echo "      shell: $shell" >> "$playbook_file"
      if [[ -n "$hash" ]]; then
          echo "      password: '$hash'" >> "$playbook_file"
      fi
      if [[ -n "$groups" ]]; then
          echo "      groups: $groups" >> "$playbook_file"
      fi
      echo "" >> "$playbook_file"
    fi
done < "$passwd_file"