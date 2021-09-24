#!/usr/bin/env zsh
for package in stow/
do
	stow -vn -t ~/ $package
done
