#!/usr/bin/expect

set user_name "test_user"
set user_password "test"
set admin_name "n_shvora"
set admin_password "fmapna7-s"
set servers {"192.168.232.11" "192.168.232.12"}

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