:
################################################################################
## \file      apt-partial-upgrade.sh
## \author    SENOO, Ken
## \copyright CC0
## \version   0.0.1
## \date      Created: 2019-10-05 Sat
## \date      Updated: 2020-03-26T20:02+09:00
## \sa        https://senooken.jp/blog/2019/10/05/
## \brief     Package partial upgrade partial with APT.
################################################################################

APT_UPGRADE_LOG="apt-upgrade.log"
PACKAGE_LIST_LOG="package-list.log"

## Output apt upgrade stdout.
echo n | sudo apt upgrade >$APT_UPGRADE_LOG

## Format apt upgrade output.
sed -n '/The following packages will be upgraded:/,${/^  /{
	s/^  //; s/ /\n/pg;
}}' $APT_UPGRADE_LOG >$PACKAGE_LIST_LOG

echo "Upgrade all installed packages."
sleep 5

## Uninstall i386 and upgrade the others.
while i=0 read -r pkg; do
	echo $((++i)) $pkg
	case "$pkg" in
		## i386 package is requied WINE.
		# *i386) sudo apt remove -y $pkg;;
		*) sudo apt install -y $pkg;;
	esac
done <$PACKAGE_LIST_LOG
