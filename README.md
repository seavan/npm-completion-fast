# npm-completion-fast

I have written a small script which completes npm verbs (like run/install, etc) and completes tasks for "npm run" (taken from scripts section of package.json in the current dir) and "npm update" (taken from dependencies and devDependencies of same file). it works much faster than the completion which can be found on npm index, so there's that.

installation is simple -
`cd && git clone https://github.com/seavan/npm-completion-fast.git && echo "source ~/npm-completion-fast/npm-completion-fast.bash" >> .profile`
