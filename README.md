## .emacs.d
My .emacs configuration, in a state of constant flux.

## Fixing wierd characters in multi-term:
It seems that emacsforosx doesn't automatically create/install a ~/.terminfo file, which should contain
info about the terminal type declaration (not sure on the terminology for that), like TERM='xterm-256color'.
Emacs needs eterm-color, but you'll need to create the necessary files using the following command:

	tic -o ~/.terminfo /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti



## Packages to look at:
 * robe - code navigation, doc and completion, for rails?



## Need to document how to use with [cask](https://github.com/cask/cask)
  * Need to make sure the to the cask.el file is correct. <path-to-cask> will vary depending on how you installed Cask: if you installed via the curl method, it is likely to be ~/.cask; if you installed via Homebrew, it is likely to be /usr/local/Cellar/cask/<version>.
