# dotfiles
dotfiles for configuration

## Reminders about dotfiles

- Dotfiles allow you to customize configurations
- Use this repo to transfer dotfiles across systems

## Examples
- Examples available at https://dotfiles.github.io
- Search Github with _filename:.RProfile_

# Environment variables

For example:

R_HISTSIZE=100000
GITHUB_PAT=abc123 
R_LIBS_USER=~/R/%p/%v
- p = platform
- v = version number

```r
usethis::browse_github_pat()
usethis::edit_r_environ()
# Then restart R
Sys.getenv("GITHUB_PAT")
```
