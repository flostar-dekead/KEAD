#!/data/data/com.termux/files/usr/bin/bash

# ==================================
# KEAD
# Output Module
# ==================================

kead_output_start() {

	echo
	echo -e "${CYAN}┌──────────────────────┐${NC}"
	echo -e "${CYAN}│    PROGRAM OUTPUT    │${NC}"
	echo -e "${CYAN}└──────────────────────┘${NC}"
	echo

}

kead_output_end() {

	echo

}

kead_execute() {

	"$@" 2>&1

	local EXIT_CODE=$?

	return $EXIT_CODE

}

kead_output_error() {

	local MESSAGE="$1"

	echo -e "${RED}✘ ${MESSAGE}${NC}"

}
