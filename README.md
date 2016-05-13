#Death files
For feeling at home everywhere.
Probably not of use to anyone except for me, syncing my many computers.

##Usage

1. Clone this repository into a folder somewhere on your computer, f.e. `~/death-files`
2. Run the script `./install.sh`. This will

    - add a line to your .bash_profile that sources all the files in `~/death-files/bash_profile`
    - copy all the dot-files in the root of `~/death-files` to `~/`

Should you run the script again (f.e. after an update of the repo), then existing files will be overwritten but the line in the .bash_profile will not be added again. In other words, if you make changes to the dot-files, the changes will be lost.