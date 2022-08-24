# Batch_Scripts

Random batch scripts I made to workaround problems and annoyances.

///// No HDD Sleep.cmd \\\\\

When using HDD as a secondary drive it would
constantly go to sleep mode (completely stop spinning)
after about 20 seconds of no activity, and then when any
read/write action was required from it, the programs would
freeze as the HDD audibly started to spin up again and
would respond after few seconds, while the programs
were still frozen. Super annoying and super simple solution.

This script writes a new file "A.txt" to the root of any
disk you choose and immediately deletes it, this
is repeated indefinitely every 15 seconds
(feel free to change the values). This very effectively
took care of the problem I described above.

I also made a shortcut of the script where I set it to
open minimized, so it would just silently open on taskbar.

\\\\\\\\\\\\\\//////////////

|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\

///// Spotify Post Update Mod.bat \\\\\

This script is complementary to the Adless Spotify repo:
https://github.com/mrpond/BlockTheSpot

During the Spotify update, the modified .dll file gets replaced,
and so you don't have to manually play around with the files
after every update in the "%APPDATA%\Spotify" folder, you can
just run this script and it will do the work for you.
There is a tiny bit of addition preparation for this to work,
(making another copy of the .dll) which is described
in the script itself.

\\\\\\\\\\\\\\\\\\\///////////////////
