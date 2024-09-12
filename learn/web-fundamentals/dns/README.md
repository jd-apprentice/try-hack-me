# What is DNS?

![dns](dns.png)

## What does DNS stand for?

Domain Name System

# Domain Hierarchy

![DH](hierarchy.png)

## What is the maximum length of a subdomain?

63 characters

## Which of the following characters cannot be used in a subdomain ( 3 b _ - )?

_

## What is the maximum length of a domain name?

253 characters

## What kinf of TLD is .co.uk?

ccTLD

# Record Types

DNS isn't just for websites though, and multiple types of DNS record exist. We'll go over some of the most common ones that you're likely to come across.

A Record

These records resolve to IPv4 addresses, for example 104.26.10.229

AAAA Record

These records resolve to IPv6 addresses, for example 2606:4700:20::681a:be5

CNAME Record

These records resolve to another domain name, for example, TryHackMe's online shop has the subdomain name store.tryhackme.com which returns a CNAME record shops.shopify.com. Another DNS request would then be made to shops.shopify.com to work out the IP address.

MX Record

These records resolve to the address of the servers that handle the email for the domain you are querying, for example an MX record response for tryhackme.com would look something like alt1.aspmx.l.google.com. These records also come with a priority flag. This tells the client in which order to try the servers, this is perfect for if the main server goes down and email needs to be sent to a backup server.

TXT Record
TXT records are free text fields where any text-based data can be stored. TXT records have multiple uses, but some common ones can be to list servers that have the authority to send an email on behalf of the domain (this can help in the battle against spam and spoofed email). They can also be used to verify ownership of the domain name when signing up for third party services.

## What type of record would be used to advise where to send email?

MX

## What type of record handles IPv6 addresses?

AAAA

# Making a Request

![MR](request.png)

## What field specifies how long a DNS record should be cached for?

TTL

## What type of DNS Server is usually provided by your ISP?

Recursive DNS

## What type of server holds all the records for a domain?

Authoritative