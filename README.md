# bash-git-env
Files to set up my bash/git env just how I'd like (currently specific to macOS/Homebrew). These files come with absolutely no warranty. :P

To get these settings sourced in each new shell, I currently have:

`~/.bash_profile`:
```bash
if [ -f "${HOME}/.bashrc" ]; then
  source "${HOME}/.bashrc"
fi
```

`~/.bashrc`:
```bash
BASH_GIT_ENV_HOME="${HOME}/w/bash-git-env"
source "${BASH_GIT_ENV_HOME}/setupenv.sh"
```
