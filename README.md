# Sonic CD Disassembly (Test Branch)

This is an experimental test branch that contains disassemblies of ever stage MMD, but is being tested for organization, data splitting, and code style. As such, a lot of things are subject to change. Feel free to take a look if you'd like, but it'd be best not to use this for anything for now.

Currently, the code builds bit-perfect with the PAL version (since that was the one with documented addresses on the wiki). Standalone Genesis ROMs can be built by setting "STANDALONE" to 1 in "make.bat". You can also set debug mode with "DEBUG", and also the target region with "REGION" (which currently does nothing).
