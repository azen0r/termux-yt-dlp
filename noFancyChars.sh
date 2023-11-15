#!/bin/bash
RUNDIR=${0%/*}
cd "$RUNDIR"

fancy() {
	for f in *\—*; do mv "$f" "${f//—/-}"; done
	for f in *\–*; do mv "$f" "${f//—/-}"; done
	for f in *\：*; do mv "$f" "${f//：/_}"; done
	for f in \｜; do mv "$f" "${f//｜/I}"; done
	for f in \│; do mv "$f" "${f//│/I}"; done

	for f in *\？*; do mv "$f" "${f//？/_}"; done
	for f in *\¿*; do mv "$f" "${f//¿/_}"; done

	for f in *\‘*; do mv "$f" "${f//‘/_}"; done
	for f in *\’*; do mv "$f" "${f//’/_}"; done
	for f in *\”*; do mv "$f" "${f//”/_}"; done
	for f in *\“*; do mv "$f" "${f//“/_}"; done
	for f in *\＂*; do mv "$f" "${f//＂/_}"; done

	for f in *\＊*; do mv "$f" "${f//＊/_}"; done

	for f in *\!*; do mv "$f" "${f//!/_}"; done
	for f in *\‼*; do mv "$f" "${f//‼/_}"; done
	for f in \⧸; do mv "$f" "${f//⧸/_}"; done

	for f in *\🧠*; do mv "$f" "${f//🧠/_}"; done
	for f in *\💡*; do mv "$f" "${f//💡/_}"; done
	for f in *\⬆*; do mv "$f" "${f//⬆/_}"; done
	for f in *\🇬🇧*; do mv "$f" "${f//🇬🇧/_}"; done
	for f in *\📚*; do mv "$f" "${f//📚/_}"; done
	for f in *\🤔*; do mv "$f" "${f//🤔/_}"; done
	for f in *\🎯*; do mv "$f" "${f//🎯/_}"; done
	for f in *\✨*; do mv "$f" "${f//✨/_}"; done
	for f in *\💵*; do mv "$f" "${f//💵/_}"; done
	for f in *\⚡*; do mv "$f" "${f//⚡/_}"; done
	for f in *\✏*; do mv "$f" "${f//✏/_}"; done
	for f in *\🙊*; do mv "$f" "${f//🙊/_}"; done
	for f in *\💰*; do mv "$f" "${f//💰/_}"; done
	for f in *\😏*; do mv "$f" "${f//😏/_}"; done

	# 🤔✨🎯📚💵⚡✏

	find . -name "*'*" -print0 | while IFS= read -r -d '' file; do mv "$file" "${file//\'/_}"; done
	find . -name "*|*" -print0 | while IFS= read -r -d '' file; do mv "$file" "${file//\|/I}"; done
}

cd /sdcard/Download/yt-dlp2/
fancy
for d in /sdcard/yt-dlp2/*/; do (cd "$d" && fancy); done
for d in /sdcard/yt-dlp2/*/*/; do (cd "$d" && fancy); done

cd /sdcard/yt-dlp/
fancy
for d in /sdcard/yt-dlp/*/; do (cd "$d" && fancy); done
for d in /sdcard/yt-dlp/*/*/; do (cd "$d" && fancy); done

cd /sdcard/yt-dlp3/
fancy
for d in /sdcard/yt-dlp3/*/; do (cd "$d" && fancy); done
for d in /sdcard/yt-dlp3/*/*/; do (cd "$d" && fancy); done
