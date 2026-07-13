#!/data/data/com.termux/files/usr/bin/bash

# ==================================
# KEAD
# Web Engine
# ==================================

# Requires:
# settings.sh
# pipeline.sh
# runtime.sh
# finish.sh

# Handles:
# HTML
# CSS
# JavaScript

kead_web_detect() {

	local FILE="$1"

	case "$FILE" in

	*.html)
		echo "html"
		;;

	*.css)
		echo "css"
		;;

	*.js)
		echo "javascript"
		;;

	*)
		echo "unknown"
		;;

	esac

}

kead_web_open_browser() {

        local FILE="$1"

        local DIR
        DIR=$(dirname "$FILE")

        local PAGE
        PAGE=$(basename "$FILE")

        cd "$DIR" || return 1

        # Stop previous KEAD web servers
        pkill -f "python -m http.server 8000" 2>/dev/null

        echo "Starting live server..."

        python -m http.server 8000 >/dev/null 2>&1 &

        SERVER_PID=$!

        sleep 2

        echo "Server: http://127.0.0.1:8000"

        termux-open "http://127.0.0.1:8000/$PAGE"


}

kead_web_validate() {

	local FILE="$1"

	if [[ ! -f "$FILE" ]]; then

		kead_error "File not found: $FILE"

		return 1

	fi

}

kead_web_run() {

        local HTML=""

        for FILE in "$@"; do

                if ! kead_web_validate "$FILE"; then
                        return 1
                fi

                TYPE=$(kead_web_detect "$FILE")

                case "$TYPE" in

                html)
                        [[ -z "$HTML" ]] && HTML="$FILE"
                        ;;

                css|javascript)
                        ;;

                *)
                        kead_error "Unsupported web file: $FILE"
                        return 1
                        ;;

                esac

        done

        if [[ -z "$HTML" ]]; then

                kead_error "No HTML entry file provided."

                echo
                echo "Usage:"
                echo "  kead web index.html"
                echo "  kead web index.html style.css"
                echo "  kead web index.html style.css script.js"

                return 1

        fi

        kead_web_open_browser "$HTML"

}
