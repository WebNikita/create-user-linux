#!/usr/bin/expect

set user_name ""
set user_password ""
set admin_name ""
set admin_password ""
set servers {"192.168.232.11" "192.168.232.11"}

foreach server $servers {
    spawn ssh $admin_name@$server "sudo useradd -G sudo -s /bin/bash $user_name && sudo passwd -q $user_name"
    expect "$admin_name@$server's password:"
    send "$admin_password\r"
    expect "Enter new UNIX password:"
    send "$user_password\r"
    expect "Retype new UNIX password:"
    send "$user_password\r"
    expect "#"
}