This script should process a List file in a directory into a set of useful folders and files 

Pulls in Tools template

```sh
cat List.md | awk 'NF' | sed 's/^- //' | sed 's/"[^"]*"/""/g' | sed 's/([^)]*)//g' | sed 's/[()]//g' | sed 's/[[:space:]]*$//' | sed 's/\./-/g' | sed 's/\//-/g' | sed 's/#.*$//' | sed 's/\:.*$//' | sed 's/\[.*$//' | \
while read -r line; do
    newfile="$(echo "$line" | tr ' ' '_')"
    filepath="$newfile/$newfile.md"
    if [ ! -e "$filepath" ]; then
        mkdir -p "$newfile"
        cp ~/Dev/OBSESC/esc-obsidian/__templates/tool.md "$filepath"
        sed -i '' "s/{{title}}/$newfile/g" "$filepath"
    fi
done
```

Clean up titles in each new file 

```sh
LC_ALL=C find . -type f -exec sed -i '' '/^#/s/_/ /g' {} +
```

Clean up alias in each new file 

```sh
LC_ALL=C find . -type f -exec sed -i '' '/^  - /s/_/ /g' {} +
```