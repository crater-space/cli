# crater-cli

[![js-myterminal-style](https://img.shields.io/badge/code%20style-myterminal-blue.svg)](https://www.npmjs.com/package/eslint-config-myterminal)
[![License](https://img.shields.io/github/license/crater-space/cli.svg)](https://opensource.org/licenses/MIT)  
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/Y8Y5E5GL7)

The CLI interface for *crater*

## Commands

### 1. `search`

Searches for packages matching a specified term across all available known package sources

    crater search emacs

### 2. `list`

Lists all available packages through known package sources

    crater list

### 3. `install`

installs specified packages through available known package sources

    crater install git emacs steam

### 4. `uninstall` (not implemented)

Uninstalls specified packages through the appropriate package sources

    crater uninstall btop steam

### 5. `update` (not implemented)

Updates all (or specified) packages through the appropriate available package sources

    crater update emacs steam

OR

    crater update

## Help

For a list of supported commands, use one of the following:

    crater help
    crater --help
    crater -h

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

## Quick-Usage

*crater* can be used to "fetch" (install) packages with a single command, without even installing *crater*. The only requirement for this is [curl](https://curl.se).

    /bin/bash -c "$(curl https://raw.githubusercontent.com/crater-space/cli/master/fetch)" _ btop

OR, you can use the shorter version:

    /bin/bash -c "$(curl https://crater.myterminal.me/fetch)" _ btop

The above example would install "btop" without installing *crater* on the system.


## Dependencies

*Crater* has been written entirely as a shell script, and that helps keep it as lightweight as possible with almost no external dependency except [curl](https://curl.se) and also makes it available on almost all UNIX-like platforms.

More documentation coming soon...
