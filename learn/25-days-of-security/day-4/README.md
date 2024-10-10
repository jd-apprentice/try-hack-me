# Day 4

##  Santa's watching

Given the URL "http://shibes.xyz/api.php", what would the entire wfuzz command look like to query the "breed" parameter using the wordlist "big.txt" (assume that "big.txt" is in your current directory)

```shell
wfuzz -c -z /usr/share/seclists/Discovery/Web-Content/big.txt http://shibes.xyz/api.php?breed=FUZZ
```

Use GoBuster (against the target you deployed -- not the shibes.xyz domain) to find the API directory. What file is there?

```shell
gobuster dir -u http://10.10.231.164/ -w /usr/share/seclists/Discovery/Web-Content/big.txt -t 50 -x php,txt,html | tee GobusterOutput.txt
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.10.231.164/
[+] Method:                  GET
[+] Threads:                 50
[+] Wordlist:                /usr/share/seclists/Discovery/Web-Content/big.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Extensions:              php,txt,html
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.htaccess            (Status: 403) [Size: 278]
/.htaccess.html       (Status: 403) [Size: 278]
/.htaccess.php        (Status: 403) [Size: 278]
/.htaccess.txt        (Status: 403) [Size: 278]
/.htpasswd            (Status: 403) [Size: 278]
/.htpasswd.php        (Status: 403) [Size: 278]
/.htpasswd.txt        (Status: 403) [Size: 278]
/.htpasswd.html       (Status: 403) [Size: 278]
/LICENSE              (Status: 200) [Size: 1086]
/api                  (Status: 301) [Size: 312] [--> http://10.10.231.164/api/]
/index.html           (Status: 200) [Size: 467]
/server-status        (Status: 403) [Size: 278]
Progress: 81904 / 81908 (100.00%)
```

Fuzz the date parameter on the file you found in the API directory. What is the flag displayed in the correct post?

```shell
wfuzz -c -w /usr/share/seclists/Discovery/Web-Content/big.txt --hh 0 http://MACHINE-IP/api/site-log.php?date=FUZZ
curl "http://10.10.231.164/api/site-log.php?date=20201125"
```

THM{D4t3_AP1}