# SFX Creation Support Tool


## Overview
Script-based SFX creation tool


## Setup

Please download and put the following files:

- \tools\7-Zip:
  - 7za.dll / 7zr.exe: [Downloading File /64455/7z920_extra.7z - 7-Zip - OSDN](https://osdn.net/projects/sevenzip/downloads/64455/7z920_extra.7z/)
  - 7zsd_All.sfx: [7z SFX Builder / Code / [d8a8b9] /3rdParty](https://sourceforge.net/p/s-zipsfxbuilder/code/ci/master/tree/3rdParty/)
- \tools\Resource Hacker:
  - ResourceHacker.exe: [Resource Hacker](http://www.angusj.com/resourcehacker/)


## Usage

- Put your program in \setup and edit \setup\Setup.bat
- Run \Runme!.bat, then generate a .exe file


## Optional Tools

### RunAsAdmin.vbs
It realizes any command can be executed by any user. So that means non-admin user can execute any command with the administrator privilege.

Preparations:

- Download  [PsTools](https://technet.microsoft.com/ja-jp/sysinternals/pstools.aspx) and put PsExec.exe at the same directory.
- Write a valid username and password in this script.

Usage:

```
RunAsAdmin.vbs <command> [arguments]
```

Reference:

- [ドメイン管理下で標準ユーザから管理者権限が必要なプログラムの実行:真城あきらのブロマガ - ブロマガ](http://ch.nicovideo.jp/mashiroakira/blomaga/ar986577)

---

### VBScriptEncoder.vbs
It makes a .vbe file from your .vbs file.

Usage:

```
VBScriptEncoder.vbs <input.vbs> <output.vbe>
```

Reference:

- [TechNet Encode and Decode a VB script](https://gallery.technet.microsoft.com/Encode-and-Decode-a-VB-a480d74c)


## Author

tag (Web: [とりとめもないはなし。](https://karat5i.blogspot.jp) / Twitter: [@tag_ism](https://twitter.com/tag_ism))
