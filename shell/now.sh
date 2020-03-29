:
################################################################################
## \file      now.sh
## \author    SENOO, Ken
## \copyright CC0
## \version   0.0.1
## \date      Created: 2016-12-27T23:46+09:00
## \date      Updated: 2020-03-29T09:58+09:00
## \sa        https://senooken.jp/post/2016/12/27/
## \brief     Get current time in POSIX shell script.
################################################################################

now()(
	EXE_NAME='now'
	dt=$(date +%Y%m%dT%H%M%S)
	OPTSTR=':lst-:'
	for opt in $(echo $OPTSTR | sed 's/[:-]//g' | fold -w 1); do
		eval is_opt_$opt='false'
	done

	while getopts $OPTSTR opt; do
		case "$opt${OPTARG:-}" in
			l|-long)  dt=$(date +%Y-%m-%dT%H:%M:%S);;
			s|-short) dt=$(date +%Y%m%dT%H%M%S    );;
			t|-time-zone) is_opt_t='true';;
			\?*) echo "$EXE_NAME: invalid option -- '$OPTARG'" >&2;        exit 1;;
			*)   echo "$EXE_NAME: unrecognized option '-$opt$OPTARG'" >&2; exit 1;;
		esac
	done

	if $is_opt_t; then
		TIME_ZONE=$(tz)
		[ -n "${dt%%*:*}" ] && TIME_ZONE=$(printf '%s\n' "$TIME_ZONE" | sed 's/://')
		dt="$dt$TIME_ZONE"
	fi

	echo "$dt"
)

now ${1+"$@"}
