# Windows_Scripts

Random Windows scripts I made to workaround and automatize problems and annoyances.

## Copying AD user groups to new user.ps1

### The Problem
When adding a new user to the local Microsoft Active Directory, few things need to be configured in tabs like Organization, that's all quick and easy to do in 1 minute, but then when you want to add all the group memberships to control to which SMB shares and folders the user has what rights for access, which there can be like 50 of, doing it manually sucks big time. Marking the groups' names, copy-pasting them one-by-one is not an enjoyable task to do.

### The Solution
I made this script that automatizes the addition of group memberships from a chosen source AD user to a destination AD user, there is also error handling in case you input the wrong username (you can just try inputting it again), every command and line is commented to make it easy to understand and even when the script is running, the output is nicely colored and divided so it's comprehensible.

## No HDD Sleep.cmd

### The Problem
When using HDD as a secondary drive it would constantly go to sleep mode (completely stop spinning) after about 20 seconds of no activity, and then when any read/write action was required from it, the programs would freeze as the HDD audibly started to spin up again and would respond after few seconds, while the programs were still frozen. Super annoying and super simple solution.

### The Solution
This script writes a new file "A.txt" to the root of any disk you choose and immediately deletes it, this is repeated indefinitely every 15 seconds (feel free to change the values). This very effectively took care of the problem I described above.

I also made a shortcut of the script where I set it to open minimized, so it would just silently open on taskbar.

## Spotify After Update.bat

### The What
This script is complementary to the Manual Installation of BlockTheSpot for Spotify: https://github.com/mrpond/BlockTheSpot

### The Problem
During the Spotify update, the modified .dll file gets replaced, and you would have to manually go to the Spotify installation directory and rename the original .dll and put the modded .dll in its place, and that is if you remembered to make a copy of the modded .dll and won't have to go download it again.

### The Solution
You don't have to manually play around with the files after every update in the "%APPDATA%\Spotify" folder anymore, you can just run this script and it will do the work for you. There is a tiny bit of addition preparation for this to work, (making another copy of the .dll) which is described in the script itself.
