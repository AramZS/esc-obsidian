export LC_ALL=C

iconv -c -f utf-8 -t ascii List.md | awk 'NF' | sed 's/\*/ /g' | sed 's/\_/ /g' | sed 's/^-//' | sed 's/\*//g' | sed 's/_//g' | sed 's/^ *//g' | sed 's/\"[^\"]*\"/\"\"/g' | sed 's/([^)]*)//g' | sed 's/[()]//g' | sed 's/\s*$//' | sed 's/\\./-/g' | sed 's/\\/-/g' | sed 's/#.*$//' | sed '/:.*by /!s/:.*$//i' | sed 's/\[.*$//' | sed 's/^ *//' | sed 's/\s+/ /g' | sed 's/://g' | \
while read -r line; do
    line=$(echo "$line" | perl -pe 's/[^[:ascii:]]/ /g')
    echo "\n\nline: |$line|"
    title=$(echo "$line" | tr '[:space:]' ' ' | sed 's/\s+/ /g' | sed 's/ by .*//i; s/^ *//; s/ *$//' | tr ' ' '_' | sed 's/^_//; s/_$//')
    echo "title: |$title|"
    author=$(echo "$line" | perl -pe 's/.* by (.*)/\1/i')
    echo "author: |$author|"

	inlinetitle=$(echo "$title" | sed 's/_/ /g')
	echo "inline title: |$inlinetitle|"

    filepath="$title/$title.md"
    if [ ! -e "$filepath" ]; then
        mkdir -p "$title"
        cp ~/Dev/OBSESC/esc-obsidian/__templates/media-item.md "$filepath"
        sed -i '' "s/{{title}}/$inlinetitle/g" "$filepath"
        sed -i '' -e "s/author:/author: $author/" "$filepath"
    fi
done