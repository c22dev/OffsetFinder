# OffsetFinder
A sh script that finds offsets for you from an IPSW link :)
This can also generate offsets for betas.

Please note that this can only work with arm64e iOS 16 IPSWs.

<img src="https://i.ibb.co/w422yZ9/Pasted-Graphic.png" width=50%>

## Use
```
./run.sh [IPSW URL / Txt file contanining IPSW URLs (one per line)]
```
You can run the script without any argument but it will ask you for the IPSW URL or the txt file in the process. You won't be able to do anything without installing dependencies. See next section.

## Dependencies
If you want to install all the dependencies (building them from source, you can use my [installer script](https://github.com/c22dev/OffsetFinder/blob/main/lpfinstaller.sh)

If you don't trust it (even if it's fully open sourced), you can attempt to get everything manually :


- [libpatchfinder](https://github.com/tihmstar/libpatchfinder) from [tihmstar](https://github.com/tihmstar) installed but MakeFile have to be configured with this command : 
```./configure --with-offsetexporter```
- [partialZipBrowser](https://github.com/tihmstar/partialZipBrowser) installed to PATH (aka pzb)
- [Python 3](https://formulae.brew.sh/formula/python@3.11) and [PyIMG4](https://github.com/m1stadev/PyIMG4) installed (```brew install python && pip3 install pyimg4```)
- An IPSW (iOS/iPadOS 16.0->16.6b1, arm64e) URL (it can be obtained from [ipsw.me](https://ipsw.me/) or [appledv.dev](https://appledb.dev/)) OR a txt file containing one IPSW URL by line
- An Internet Connection

Note : 
This was only tested on macOS Sonoma and macOS Ventura; you may not be able to run this script on Linux or older versions of macOS (like really old, Monterey and Big Sur should run it fine)


## Distribution and license
Despite the lack of a license on the project, if you plan to use the offsets for distribution purposes, a credit is always verry appreciated :) Simply putting my name (c22dev) in your project credits allows me to continue the project as I can see it's being helpful ! Thanks if you do so !

Don't pull request those offsets in an app without editing them (see [this notice](https://github.com/c22dev/OffsetFinder#offsets)). Please also verify those offsets weren't already submited/aren't already existing as this could increase the work for the reviewer without being useful.

## Offsets
Some offsets (based off thimstar’s template, which is the issue) are wrong. You need to change a few manually. 
These are the wrong ones:
```
._vm_map__hdr__links__prev
._vm_map__hdr__links__next
._vm_map__hdr__links__start
._vm_map__hdr__links__end
```
It should be + 0x10 instead of + 0x8. 

I won’t generate all offsets again but some little patching can be done easily.


I'm planning to add even more beta offsets in the upcomming days !
If you want to help me, try running the script and create a PR.

The offsets names are in this format `iDevice-Identifier iOS-Version iOS-Build-ID.h` e.g. `iPhone11,8 16.3 20D47.h`
## Credits
[AppInstallerIOS](https://github.com/BenjaminHornbeck6) - [Base Script](https://www.reddit.com/r/jailbreak/comments/15b0u0b/comment/jtqbzj1/)

[tihmstar](https://github.com/tihmstar) - [libpatchfinder](https://github.com/tihmstar/libpatchfinder)

[diyar2137237243](https://github.com/diyar2137237243) - [iPads IPSW URLs for iPadOS 16.6b1](https://cdn.discordapp.com/attachments/1074788546306658365/1135343869492473916/message.txt)
