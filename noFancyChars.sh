#!/bin/bash

# Function to rename files with "fancy" characters
fancy() {
	characters=(
		"—" "-"
		"–" "-"
		"：" "_"
		"｜" "I"
		"│" "I"
		"？" "_"
		"¿" "_"
		"‘" "_"
		"’" "_"
		"”" "_"
		"“" "_"
		"＂" "_"
		"＊" "_"
		"!" "_"
		"‼" "_"
		"⧸" "_"
		"…" "..."
		"🧠" "_"
		"💡" "_"
		"⬆" "_"
		"🇬🇧" "_"
		"📚" "_"
		"🤔" "_"
		"🎯" "_"
		"✨" "_"
		"💵" "_"
		"⚡" "_"
		"✏" "_"
		"🙊" "_"
		"💰" "_"
		"😏" "_"
	)

	# Replace characters with their corresponding replacements
	for ((i = 0; i < ${#characters[@]}; i += 2)); do
		find . -name "*${characters[i]}*" -exec bash -c 'mv "$0" "${0//'"${characters[i]}"'/'"${characters[i + 1]}"'}"' {} \;
	done

	# Replace single quotes with underscore
	find . -name "*'*" -print0 | while IFS= read -r -d '' file; do
		mv "$file" "${file//\'/_}"
	done

	# Replace pipe character with capital letter I
	find . -name "*|*" -print0 | while IFS= read -r -d '' file; do
		mv "$file" "${file//\|/I}"
	done
}

# Directories to process
directories=(
	"/sdcard/Download/yt-dlp2/"
	"/sdcard/yt-dlp/"
	"/sdcard/yt-dlp3/"
)

# Process directories and their subdirectories
for directory in "${directories[@]}"; do
	cd "$directory"
	fancy
	for subdirectory in */; do
		(cd "$subdirectory" && fancy)
	done
done
