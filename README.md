# dotfiles
dotfiles for configuration

## Reminders about dotfiles

- Dotfiles allow you to customize configurations
- Use this repo to transfer dotfiles across systems

## Examples
- Examples available at https://dotfiles.github.io
- Search Github with _filename:.RProfile_

## .RProfile
- Include helpers you use interactively, not for scripts - otherwise the script will become dependent on the RProfile


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
# Now, you can use the gh package to write a gist and it will automatically look in .Renviron for GITHUB_PAT. If it's there, you can post the gist without typing in your PAT! e.g.
gh::gh("POST /gists",
    description = "my solution",
    public = TRUE,
    files = list(
        "12-startup-jims.R" = list(content = readr::read_file("activities/12-startup-02-solution.R"))
    )
)
```
