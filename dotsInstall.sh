#!/bin/sh

while getopts ":f" o; do case "${o}" in
	f) force=true;;
	*) printf "Invalid option: -%s\\n" "$OPTARG" && exit 1 ;;
esac done

installStow() {
	echo $force
	for package in stow/
	do
		stow -vn -t ~/ $package  >> tmp 2>&1
	done
	cat tmp
}

applyForce() {
	echo "FUCK!"
	grep existing tmp | awk '{print $11}' | xargs -I {} rm ~/{}
	installStow
}

installStow
[ -n "$force" ] && applyForce
rm tmp
