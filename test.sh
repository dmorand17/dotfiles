#!/bin/bash
set -eo pipefail

ERRORS=()

# find all executables and run `shellcheck`
for f in $(find . -type f -not -path '*.git*' | sort -u); do
	if file "$f" | grep --quiet shell; then
		{
			shellcheck "$f" --severity error && echo "[OK]: successfully linted $f"
		} || {
			# add to errors
			ERRORS+=("$f")
		}
	fi
done

if [ ${#ERRORS[@]} -eq 0 ]; then
	echo "No errors 🎉🎉🎉"
else
	echo 
	echo "These files failed shellcheck:"
	printf '  %s\n' "${ERRORS[@]}"
	exit 1
fi