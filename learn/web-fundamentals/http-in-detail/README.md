# What is HTTP(S)?

What is HTTP? (HyperText Transfer Protocol)

HTTP is what's used whenever you view a website, developed by Tim Berners-Lee and his team between 1989-1991. HTTP is the set of rules used for communicating with web servers for the transmitting of webpage data, whether that is HTML, Images, Videos, etc.

What is HTTPS? (HyperText Transfer Protocol Secure)
HTTPS is the secure version of HTTP. HTTPS data is encrypted so it not only stops people from seeing the data you are receiving and sending, but it also gives you assurances that you're talking to the correct web server and not something impersonating it.

## What does HTTP stand for?

HyperText Transfer Protocol

## What does the S in HTTPS stand for?

Secure

## On the mock webpage on the right there is an issue, once you've found it, click on it. What is the challenge flag?

THM{INVALID_HTTP_CERT}

# Request and Responses

What is a URL? (Uniform Resource Locator)

![request](request.png)

```shell
HTTP/1.1 200 OK
Server: nginx/1.15.8
Date: Fri, 09 Apr 2021 13:34:03 GMT
Content-Type: text/html
Content-Length: 98

<html>
<head>
    <title>TryHackMe</title>
</head>
<body>
    Welcome To TryHackMe.com
</body>
</html>
```

## What HTTP protocol is being used in the above example?

HTTP/1.1

## What response header tells the browser how much data to expect?

Content-Length