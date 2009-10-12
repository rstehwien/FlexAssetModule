# INTRODUCTION
Embedding assets in a Flex project can take the compiler a while.  If
you embed assets in a library to share across multiple projects, each
one of those projects must recompress the assets once more and this
can add up to make for a mind-numbing long compile.

This set of Flex projects shows how to create an asset module that
will be the only one who needs to compile the embedded assets and an
interface that can be used by the application to use those assets.

# PROJECTS
* FamLibrary - Asset interface (and module loading) library shared
between the FamModule and FamApplication.
* FamModule - The asset module.
* FamApplication - The application that makes use of the shared assets.

# DEMO
1. Download the project
2. Open demo/index.html in the browser

# USING
1. Open all the projects in Flex Builder
2. Build

# IMAGES
Images Public Domain From:

* <http://commons.wikimedia.org/wiki/File:Face-monkey.svg>
* <http://commons.wikimedia.org/wiki/File:Hamsa_hand.svg>
