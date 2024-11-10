# Friday Night Funkin C.U.E.

This is the repository for Friday Night Funkin C.U.E. (Continuous Updates Engine) (pronounced Queue), a engine based of Funkin v0.2.7.1

## PLAY OG FNF
PLAY IT
WE GOT DIS GAME

Play the Ludum Dare prototype here: https://ninja-muffin24.itch.io/friday-night-funkin
Play the Newgrounds one here: https://www.newgrounds.com/portal/view/770371
Support the project on the itch.io page: https://ninja-muffin24.itch.io/funkin

## Engine Credits / shoutouts

- [sinco (me!)](https://www.youtube.com/@idealistcat) - Programmer

This game was made with love to Newgrounds and it's community. Extra love to Tom Fulp.

## Build instructions

THESE INSTRUCTIONS ARE FOR COMPILING THE SOURCE CODE!!!

IF YOU WANT TO COMPILE THE GAME YOURSELF, CONTINUE READING!!!

OTHERWISE GO TO THE DAMN GAMEBANANA

### Installing shit

First you need to install Haxe and HaxeFlixel. I'm too lazy to write and keep updated with that setup (which is pretty simple). 
The link to that is on the [HaxeFlixel website](https://haxeflixel.com/documentation/getting-started/)

Other installations you'd need is the additional libraries, a fully updated list will be in `Project.xml` in the project root, but why not

```
flixel
flixel-addons
flixel-ui
hscript
```

So for each of those type `haxelib install [library]` so shit like `haxelib install newgrounds`

You'll also need to install some other stuff, copy these into your terminal

```
haxelib git polymod https://github.com/larsiusprime/polymod.git
haxelib git crashdumper http://github.com/larsiusprime/crashdumper
```

and you should be good to go there.

### Compiling game

Once you have all those installed, it's pretty easy to compile the game. You just need to run 'lime test html5 -debug' in the root of the project to build and run the HTML5 version. (command prompt navigation guide can be found here: [https://ninjamuffin99.newgrounds.com/news/post/1090480](https://ninjamuffin99.newgrounds.com/news/post/1090480))

To run it from your desktop (Windows, Mac, Linux) it can be a bit more involved. For Linux, you only need to open a terminal in the project directory and run 'lime test linux -debug' and then run the executible file in export/release/linux/bin. For Windows, you need to install Visual Studio Community 2019. While installing VSC, don't click on any of the options to install workloads. Instead, go to the individual components tab and choose the following:
* MSVC v142 - VS 2019 C++ x64/x86 build tools
* Windows SDK (10.0.17763.0)
* C++ Profiling tools
* C++ CMake tools for windows
* C++ ATL for v142 build tools (x86 & x64)
* C++ MFC for v142 build tools (x86 & x64)
* C++/CLI support for v142 build tools (14.21)
* C++ Modules for v142 build tools (x64/x86)
* Clang Compiler for Windows
* Windows 10 SDK (10.0.17134.0)
* Windows 10 SDK (10.0.16299.0)
* MSVC v141 - VS 2017 C++ x64/x86 build tools
* MSVC v140 - VS 2015 C++ build tools (v14.00)

This will install about 22GB of crap, but once that is done you can open up a command line in the project's directory and run `lime test windows -debug`. Once that command finishes (it takes forever even on a higher end PC), you can run FNF from the .exe file under export\release\windows\bin
As for Mac, 'lime test mac -debug' should work, if not the internet surely has a guide on how to compile Haxe stuff for Mac.

### Additional guides

- [Command line basics](https://ninjamuffin99.newgrounds.com/news/post/1090480)

PLEASE REPORT ANY BUGS
PLEASE

## Known Bugs

### Bug #1 - Missing Mod Stuff
```
source/engine/Version.hx:3: characters 8-30 : Type not found : engine.modding.ModInit
source/engine/Version.hx:11: characters 21-38 : Type not found : ModInit
```
just remove any and all instances of ModInit