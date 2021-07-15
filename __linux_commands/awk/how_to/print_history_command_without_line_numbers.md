* Draft:2021-05-13 (Thu)

# How to Print History Command Without Line Numbers



> Google search: linux output command without index
>
> * [Linux Print History Command Without Line Numbers](https://www.poftut.com/linux-history-command-without-line-numbers/), 2016-09-15, İsmail Baydan
>
> Option 1. Print `.bash_history`
>
> ```bash
> $ cat ~/.bash_history
> ```
>
> Option 2. Use the `awk` command
>
> ```bash
> $ history | awk '{$1=""; print substr($0,2)}'
> ```
>
> Option 3. Using the `sed` command
>
> ```bash
> $ history | sed 's/^[ ]*[0-9]\+[ ]*//'
> ```
>
> Option 4. Using the `cut` command
>
> ```bash
> $ history | cut -d ' ' -f 4-
> ```
>
> Note there exists a space in `-d ' '`.

