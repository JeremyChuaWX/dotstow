# Github link
[GCM](https://github.com/GitCredentialManager/git-credential-manager)

# MacOs (homebrew)
- `brew tap microsoft/git`
- `brew install --cask git-credential-manager-core`

# Linux (tarball)
- download tarball from the [link](https://github.com/GitCredentialManager/git-credential-manager)
- install
    - `tar -xvf <path-to-tarball> -C /usr/local/bin`
    - `git-credential-manager-core configure`
- uninstall
    - `git-credential-manager-core unconfigure`
    - `rm $(command -v git-credential-manager-core)`
## Setup credential store for Linux (gpg/pass)
    - create a new gpg key pair: `gpg --gen-key` (follow the prompts)
    - initialise the pass utility: `pass init <gpg-id>`
        - `<gpg-id>` is user id of the gpg key pair
