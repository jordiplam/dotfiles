#!/bin/sh

_PS1_exit() {
	_PS1_EXIT="${?}"
	if [ ! "${_PS1_EXIT}" -eq 0 ]; then
		printf '\033[1;31m(%s)\033[m ' "${_PS1_EXIT}"
	fi
}

_PS1_pwd() {
	case "${PWD}" in
		"${HOME}"/*/*/*) _PS1_PWD="~/...${PWD#${PWD%/*/*}}";;
		"${HOME}"*) _PS1_PWD="~${PWD#${HOME}}";;
		*) _PS1_PWD="${PWD}";;
	esac
	printf '\033[1;36m%s\033[m' "${_PS1_PWD}"
}

_PS1_git() {
	_GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
	if [ -n "${_GIT_DIR}" ]; then
		read -r _PS1_BRANCH < "${_GIT_DIR}"/HEAD
		printf ' \033[93m(%s)\033[m' "${_PS1_BRANCH##*/}"
	fi
}

_PS1_print() {
	_PS1_exit; _PS1_pwd; _PS1_git
}

PS1='$(_PS1_print) \$ '