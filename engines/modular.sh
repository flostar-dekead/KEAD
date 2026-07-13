#!/data/data/com.termux/files/usr/bin/bash

# ==================================
# KEAD
# Modular Engine
# ==================================

MODULE_HEADERS=()
MODULE_SOURCES=()

kead_expand_modules() {

	MODULE_HEADERS=()
	MODULE_SOURCES=()

	for MODULE in "$@"; do

		MODULE_HEADERS+=("${MODULE}.h")
		MODULE_SOURCES+=("${MODULE}.cpp")

	done

}

kead_validate_modules() {

	for HEADER in "${MODULE_HEADERS[@]}"; do

		[[ -f "$HEADER" ]] || {

			kead_output_start

			echo -e "${RED}✘ Missing $HEADER${NC}"

			kead_output_end

			return 1

		}

	done

	for SOURCE in "${MODULE_SOURCES[@]}"; do

		[[ -f "$SOURCE" ]] || {

			kead_output_start

			echo -e "${RED}✘ Missing $SOURCE${NC}"

			kead_output_end

			return 1

		}

	done

}

kead_modular_compile() {

	local MAIN="$1"

	local OUTPUT="${MAIN%.*}"

	g++ "$MAIN" "${MODULE_SOURCES[@]}" -o "$OUTPUT"

}

kead_modular_run() {

	local MAIN="$1"

	local PROGRAM="${MAIN%.*}"

	kead_run_stage

	kead_output_start

	"./$PROGRAM"

	local EXIT_CODE=$?

	kead_output_end

	return $EXIT_CODE

}

kead_modular_start() {

	local MAIN="$1"

	shift

	if [[ -z "$MAIN" ]]; then

		kead_error "No main file provided"

		return 1

	fi

	if [[ $# -lt 1 ]]; then

		kead_error "Modular mode requires at least one module"

		return 1

	fi

	kead_expand_modules "$@"

	if ! kead_validate_modules; then

		return 1

	fi

	if ! kead_modular_compile "$MAIN"; then

		echo -e "${RED}✘ Build failed${NC}"

		return 1

	fi

	kead_modular_run "$MAIN"

	return $?

}
