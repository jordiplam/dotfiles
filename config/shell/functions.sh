#!/bin/sh

# Navigation / Bookmarks
cdi() {
	DIR="${PWD}"
	while :; do
		FOLDERS="$(ls -d -1 -- ${DIR}/*/ 2> /dev/null \
			| sed -e "s|${DIR}/||g" -e 's|/$||g')"
		FOLDER="$(printf -- '..\n%s' "${FOLDERS}" \
			| fzf +m --header="${DIR}" --reverse --color=bw)"
		if [ "${?}" -eq 130 ]; then
			cd ${DIR}
			return 0
		fi
		case "${FOLDER}" in
			'..') DIR="${DIR%/*}";;
			'') ;; # Do not add '/' if nothing is selected.
			*) DIR="${DIR}/${FOLDER}";;
		esac
	done
}

bkdl() {
	cd "${HOME}"/Downloads/"${1}" || echo 'Directory not found.' >&2
}

bkmusic() {
	cd "${HOME}"/Music/"${1}" || echo 'Directory not found.' >&2
}

bkconfig() {
	cd "${HOME}"/.config/"${1}" || echo 'Directory not found.' >&2
}

bkcsl() {
	cd "${HOME}"/Workspace/CSL/"${1}" || echo 'Directory not found.' >&2
}

bkpapers() {
	cd "${HOME}"/Workspace/Papers/"${1}" || echo 'Directory not found.' >&2
}

# Misc

emoji() {
	EMOJI_FILE="${HOME}/.local/share/pla/emoji.txt"
	fzf +m --reverse <"${EMOJI_FILE}" | cut -d $'\t' -f 1 | xclip -i
}

optimizepdf() {
	gs -sDEVICE=pdfwrite \
		-dCompatibilityLevel=1.4 \
		-dPDFSETTINGS=/prepress \
		-dNOPAUSE -dQUIET -dBATCH \
		-sOutputFile="$2" "$1"
}
