# Day 2

##  The Elf Strikes Back!

### What string of text needs adding to the URL to get access to the upload page?

For Elf McEager:
You have been assigned an ID number for your audit of the system: ODIzODI5MTNiYmYw . Use this to gain access to the upload section of the site.
Good luck!

The answer is `id?=ODIzODI5MTNiYmYw`

### What type of file is accepted by the site?

Reading the source code we can see the following

```html
<main>
			<h1>Protect the Factory!</h1>
			<h2>If you see any suspicious people near the factory, take a picture and upload it here!</h2>
			<input type=file id="chooseFile" accept=".jpeg,.jpg,.png">
			<button tabindex=0 id=coverFile>Select</button>
			<button tabindex=1 id=uploadFile>Submit</button>
			<p id=fileText>No file selected</p>
		</main>
```

So the answer is `IMAGE`

### In which directory are the uploaded files stored?

The answer is `/uploads/`

### What is the flag in /var/www/flag.txt?

```shell
cat /var/www/flag.txt


==============================================================


You've reached the end of the Advent of Cyber, Day 2 -- hopefully you're enjoying yourself so far, and are learning lots!
This is all from me, so I'm going to take the chance to thank the awesome @Vargnaar for his invaluable design lessons, without which the theming of the past two websites simply would not be the same.


Have a flag -- you deserve it!
THM{MGU3Y2UyMGUwNjExYTY4NTAxOWJhMzhh}


Good luck on your mission (and maybe I'll see y'all again on Christmas Eve)!
 --Muiri (@MuirlandOracle)


==============================================================


sh-4.4
```

### Links

- https://medium.com/@ashishoscp/bypass-file-extension-validation-to-upload-files-on-server-b3f76e7f2e4d
