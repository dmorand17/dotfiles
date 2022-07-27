##
# Sync the codebases for a branch
#
function code-sync()
{
  for dir in */; do
    (
      echo "${dir}"
      cd "${dir}" > /dev/null 2>&1 || exit

      if [ -d .git ]; then
        git fetch -p origin && \
        git pull origin "$(git_current_branch)"
      else
        echo 'Not a git repo, skipping...'
      fi
      echo ""
    )
  done
}

##
# Run git clean for all the git repos
#
function code-clean()
{
  for dir in */; do
  (
    printf "${dir}\n"
    cd "${dir}" > /dev/null 2>&1 || exit

    if [ -d .git ]; then
      git clean -fX
    else
      printf "Not a git repo, skipping..."
    fi
    printf "\n"
  )
  done
}

##
# What branch is the codebase on and red/green depending if it's dirty or not
#
function code-branch()
{
  local reset=$'\e[0m'
  local red=$'\e[1;31m'
  local green=$'\e[1;32m'
  color=${red}

  for dir in */; do
  (
    cd "${dir}" > /dev/null 2>&1 || exit
    cmd=$(git status --short)
    if [ -z "${cmd}" ] ; then
      color=${green}
    fi
    printf "${dir} %s$(git rev-parse --abbrev-ref HEAD)%s\\n" "${color}" "${reset}"
  )
  done
}

##
# Connect to a vscode dev container
##
vscode-dev-connect() {
  local project=$1

  if [ -z "${project}" ]; then
    printf "Please specify a project\n"
    return
  fi

  docker exec -it "${project}" zsh
}

##
# Open the applications I use
##
start-day() {
  open -a Mail
  open -a Safari
  open -a Slack
  open -a Obsidian
  open -a "Visual Studio Code"
  open -a Music
  open -a Twitter
}

#!/usr/bin/env bash

function exe() { echo "\$ $@" ; "$@" ; }

rebase-with-master() {
    #1) Checks out the master branch.
    #2) Pulls any remote changes.
    #3) Swaps back to your original branch.
    #4) Rebases with master.

    exe git checkout master && git pull && git checkout - && git rebase master
}

bat-tail() {
    tail -f "$@" | bat --paging=never -l log --style=plain
}

clean-orig() {
    # Useful for cleaning up .orig* files post handling merge conflicts
    #git status -su | grep --null "\.orig$" | cut -c4- | xargs -0 rm -r
    find . -name '*.orig' -delete
}

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
function targz() {
	local tmpFile="${@%/}.tar";
	tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1;

	size=$(
		stat -f"%z" "${tmpFile}" 2> /dev/null; # OS X `stat`
		stat -c"%s" "${tmpFile}" 2> /dev/null # GNU `stat`
	);

	local cmd="";
	if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
		# the .tar file is smaller than 50 MB and Zopfli is available; use it
		cmd="zopfli";
	else
		if hash pigz 2> /dev/null; then
			cmd="pigz";
		else
			cmd="gzip";
		fi;
	fi;

	echo "Compressing .tar using \`${cmd}\`…";
	"${cmd}" -v "${tmpFile}" || return 1;
	[ -f "${tmpFile}" ] && rm "${tmpFile}";
	echo "${tmpFile}.gz created successfully.";
}

# Show all the names (CNs and SANs) listed in the SSL certificate
# for a given domain
function getcertnames() {
	if [ -z "${1}" ]; then
		echo "ERROR: No domain specified.";
		return 1;
	fi;

	local domain="${1}";
	echo "Testing ${domain}…";
	echo ""; # newline

	local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
		| openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1);

	if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
		local certText=$(echo "${tmp}" \
			| openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
			no_serial, no_sigdump, no_signame, no_validity, no_version");
		echo "Common Name:";
		echo ""; # newline
		echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//";
		echo ""; # newline
		echo "Subject Alternative Name(s):";
		echo ""; # newline
		echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
			| sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
		return 0;
	else
		echo "ERROR: Certificate not found.";
		return 1;
	fi;
}
