#!/data/data/com.termux/files/usr/bin/bash

# ==================================
# KEAD
# NCurses Engine
# ==================================

kead_ncurses_compile() {

	local FILE="$1"
	local OUTPUT="${FILE%.*}"

	kead_execute g++ "$FILE" -lncurses -o "$OUTPUT"

}

kead_ncurses_run() {

	local FILE="$1"
	local PROGRAM="${FILE%.*}"

	kead_execute "./$PROGRAM"

	return $?

}

kead_ncurses_expand_modules() {

	local MAIN="$1"

	shift

	MODULE_HEADERS=()
	MODULE_SOURCES=()

	local EXT="${MAIN##*.}"

	for MODULE in "$@"; do

		MODULE_HEADERS+=("${MODULE}.h")

		if [[ "$EXT" == "c" ]]; then
			MODULE_SOURCES+=("${MODULE}.c")
		else
			MODULE_SOURCES+=("${MODULE}.cpp")
		fi

	done

}

kead_ncurses_validate_modules() {

	for HEADER in "${MODULE_HEADERS[@]}"; do

		if [[ ! -f "$HEADER" ]]; then
			kead_output_error "Missing $HEADER"
			return 1
		fi

	done

	for SOURCE in "${MODULE_SOURCES[@]}"; do

		if [[ ! -f "$SOURCE" ]]; then
			kead_output_error "Missing $SOURCE"
			return 1
		fi

	done

}

kead_ncurses_modular_compile() {

	local MAIN="$1"
	shift

	local OUTPUT="${MAIN%.*}"

	case "${MAIN##*.}" in

	c)

		kead_execute gcc "$MAIN" "${MODULE_SOURCES[@]}" -lncurses -o "$OUTPUT"

		;;

	cpp)

		kead_execute g++ "$MAIN" "${MODULE_SOURCES[@]}" -lncurses -o "$OUTPUT"

		;;

	*)

		kead_output_error "Unsupported source file"
		return 1

		;;

	esac

}

kead_ncurses_modular_start() {

	local MAIN="$1"

	if [[ -z "$MAIN" ]]; then
		kead_error "No main file provided"
		return 1
	fi

	shift

	if [[ $# -lt 1 ]]; then
		kead_error "Modular NCurses requires at least one module"
		return 1
	fi

	kead_ncurses_expand_modules "$MAIN" "$@"

	if ! kead_ncurses_validate_modules; then
		return 1
	fi

	if ! kead_ncurses_modular_compile "$MAIN" "$@"; then
		kead_output_error "Build failed"
		return 1
	fi

	kead_run_stage

	kead_ncurses_run "$MAIN"

	return $?

}
