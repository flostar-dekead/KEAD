#!/data/data/com.termux/files/usr/bin/bash

# ==================================
# KEAD
# Backend Engine
# ==================================

kead_backend_run() {

	local FILE="$1"

	if [[ -z "$FILE" ]]; then
		kead_output_error "No file provided"
		return 1
	fi

	local LANG
	LANG=$(kead_detect_language "$FILE")

	if [[ "$LANG" == "unknown" ]]; then
		kead_output_error "Unsupported file type"
		return 1
	fi

	if ! kead_compile "$FILE" "$LANG"; then
		kead_output_error "Build failed"
		return 1
	fi

	kead_run_program "$FILE" "$LANG"
	local EXIT_CODE=$?

	return $EXIT_CODE

}

kead_detect_language() {

	local FILE="$1"

	case "$FILE" in

	*.c)

		echo "c"

		;;

	*.cpp)

		echo "cpp"

		;;

	*.py)

		echo "python"

		;;

	*.sh)

		echo "bash"

		;;

	*)

		echo "unknown"

		;;

	esac

}

kead_compile() {

	local FILE="$1"

	local LANG="$2"

	case "$LANG" in

	c)

		kead_execute gcc "$FILE" -o "${FILE%.*}"

		;;

	cpp)

		kead_execute g++ "$FILE" -o "${FILE%.*}"

		;;

	python | bash)

		return 0

		;;

	*)

		return 1

		;;

	esac

}

kead_run_program() {

	local FILE="$1"
	local LANG="$2"

	kead_run_stage

	kead_output_start

	case "$LANG" in

	c | cpp)

		kead_execute "./${FILE%.*}"
		;;

	python)

		kead_execute python "$FILE"
		;;

	bash)

		kead_execute bash "$FILE"
		;;

	*)

		kead_output_error "Unsupported runtime"
		kead_output_end
		return 1
		;;

	esac

	local EXIT_CODE=$?

	kead_output_end

	return $EXIT_CODE

}
