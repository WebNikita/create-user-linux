#!/usr/bin/expect

set user_name ""
set user_password ""
set admin_name ""
set admin_password ""
set servers {"" ""}

foreach server $servers {
    spawn ssh $admin_name@$server "sudo useradd -g users -G sudo -s /bin/bash -d /home/$user_name -m $user_name && sudo passwd -q $user_name"
    expect {
        "Are you sure you want to continue connecting" {send -- "yes\r"; exp_continue} 
        "$admin_name@$server's password:" {send -- "$admin_password\r"; exp_continue}
        "Enter new UNIX password:" {send -- "$user_password\r"; exp_continue}
        "Retype new UNIX password:" {send -- "$user_password\r"; exp_continue}
        "#"
    }
}
