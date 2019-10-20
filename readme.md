### About

Containerized environments generally only contain the bare minimum packages required to make whatever service
they are running work. This can be inconvenient when you need to debug something in a containerized or VM based
ephemeral environment.
Some examples include:

- Build script failing in a CI job. You may be able to get a shell into the build environment, but
debugging network related issues is inconvenient because it probably doesn't have basic utilities installed.
So let's say you install them by hand, debug your problem and then relaunch your build. 
Your job will invariably fail more than once which means you have to manually re-install your tools
to debug the problem again.


### How to use automated installer

`curl https://raw.githubusercontent.com/pydo/container-debug-script/master/main.sh | sh`

or

`curl -L https://dbgutils.devon.ninja | sh`

The script will automatically detect your distro and install the correct network/OS related utilities

