#!/usr/bin/env zsh
for package in stow/
do
	stow -v -t ~/ $package
done
