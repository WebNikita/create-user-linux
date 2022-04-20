#!/bin/bash
user_name="test_user"
password="12345"
servers=(
    "192.168.4.145"
)

useradd -G sudo -s /bin/bash $user_name
echo -e "$password\n$password" | passwd -q $user_name 
