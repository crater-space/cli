# crater-cli

[![js-myterminal-style](https://img.shields.io/badge/code%20style-myterminal-blue.svg)](https://www.npmjs.com/package/eslint-config-myterminal)
[![License](https://img.shields.io/github/license/crater-space/cli.svg)](https://opensource.org/licenses/MIT)  
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/Y8Y5E5GL7)

A super-lightweight, universal, "meta" package manager for UNIX-like platforms

## Major commands

1. `search` for packages matching a specified term across all available known package sources
2. `list` all available packages through known package sources
3. `install` packages through available known package sources
4. `uninstall` packages
5. `update` all (or specified) packages through the appropriate available package sources

For more information about the available commands, refer to the manpage.

    man crater

## Installation

There are at least two ways to install *crater*.

### Compile from source

    # Clone project to the local workspace
    git clone https://github.com/crater-space/cli.git crater-cli

    # Switch to the project directory
    cd crater-cli

    # Install with `make`
    make install

### Automatic installation

Simply execute the below command in a terminal and the rest should be automatic.

    /bin/bash -c "$(curl https://raw.githubusercontent.com/crater-space/cli/main/install)"

OR, the shorter one shown below:

    /bin/bash -c "$(curl https://crater.myterminal.me/cli)"

## Dependencies

*Crater* has been written entirely as a shell script, and that helps keep it as lightweight as possible with almost no external dependency except [curl](https://curl.se) and also makes it available on almost all UNIX-like platforms.

More documentation coming soon...
