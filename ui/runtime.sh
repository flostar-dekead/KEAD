#!/data/data/com.termux/files/usr/bin/bash

# ==================================
# KEAD
# Report Module
# ==================================

kead_runtime() {

	local runtime="$1"
	local exit_code="$2"

	echo
	echo -e "${CYAN}┌──────────────────────┐${NC}"
	echo -e "${CYAN}│     KEAD REPORT      │${NC}"
	echo -e "${CYAN}└──────────────────────┘${NC}"
	echo

	printf "Runtime : %s\n" "$runtime"
	printf "Exit    : %s\n" "$exit_code"

}
