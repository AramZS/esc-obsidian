

echo "Start List Processing"

strings List.md | awk 'NF' | perl -pe 's/^-//' | perl -pe 's/^\s+//' | perl -pe 's/"[^"]*"/""/g' | perl -pe 's/\([^)]*\)//g' | perl -pe 's/[()]//g' | perl -pe 's/\s+$//' | perl -pe 's/\./-/g' | perl -pe 's/\\/-/g' | perl -pe 's/#.*$//' | perl -pe 's/:.*$//' | perl -pe 's/\[.*$//' | perl -pe 's/\*//g' | perl -pe 's/^\s+//' | \
while read -r line; do
	echo "line: |$line|"
    title=$(echo "$line" | perl -pe 's/\s+/ /g' | perl -pe 's/ by .*//I; s/^\s+//; s/\s+$//' | tr ' ' '_')
    title=$(echo "$title" | perl -pe 's/^_//; s/_$//') # Remove leading and trailing underscores

    echo "title: $title |"
    
	author=$(echo "$line" | perl -pe 's/.* by (.*)/\1/I')

	echo "author: |$author|"

    filepath="$title/$title.md"
    if [ ! -e "$filepath" ]; then
        mkdir -p "$title"
        cp ~/Dev/OBSESC/esc-obsidian/__templates/media-item.md "$filepath"
        perl -i -pe "s/{{title}}/$title/g" "$filepath"
        perl -i -pe "s/author:/author: $author/" "$filepath"
    fi
done


export LC_ALL=C

cat List.md | awk 'NF' | sed 's/^-//' | sed 's/^ *//g' | sed 's/\"[^\"]*\"/\"\"/g' | sed 's/([^)]*)//g' | sed 's/[()]//g' | sed 's/\s*$//' | sed 's/\\./-/g' | sed 's/\\/-/g' | sed 's/#.*$//' | sed 's/:.*$//' | sed 's/\[.*$//' | sed 's/\*//g' | sed 's/^ *//' | sed 's/\s\+/ /g'  | sed 's/:/ /g' | \
while read -r line; do
    line=$(echo "$line" | perl -pe 's/[^[:ascii:]]//g')
    echo "line: |$line|"
    title=$(echo "$line" | tr '[:space:]' ' ' | tr ':' ' ' | sed 's/\:/ /g'  | sed 's/\s\+/ /g' | sed 's/ by .*//I; s/^ *//; s/ *$//' | tr ' ' '_' | sed 's/^_//; s/_$//')
    echo "title: |$title|"
    author=$(echo "$line" | perl -pe 's/.* by (.*)/\1/i')
    echo "author: |$author|"

    filepath="$title/$title.md"
    if [ ! -e "$filepath" ]; then
        mkdir -p "$title"
        cp ~/Dev/OBSESC/esc-obsidian/__templates/media-item.md "$filepath"
        sed -i '' "s/{{title}}/$title/g" "$filepath"
        sed -i '' -e "s/author:/author: $author/" "$filepath"
    fi
done