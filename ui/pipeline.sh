#!/data/data/com.termux/files/usr/bin/bash

# ==================================
# KEAD
# Pipeline UI Module
# ==================================

# Requires:
# colors.sh
# header.sh

kead_stage() {

	local MESSAGE="$1"

	clear

	kead_header

	echo
	printf "${CYAN}[▶] %-20s${NC}\n" "$MESSAGE"
	echo

}

kead_run_stage() {

	clear

	kead_header

	echo
	echo -e "${CYAN}[▶] Run${NC}"
	echo

}

kead_error() {

	local message="$1"

	echo
	echo -e "${RED}✘ ${message}${NC}"

}
