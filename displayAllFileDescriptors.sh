#! /bin/bash

###
### Print all opened file descriptors in format: "command_name || file_descriptor"
###


for fdDir in /proc/[0-9]* ; do
	commandName=$(tr '\0' ' ' < $fdDir/cmdline)
	#echo 'dir = '${fdDir}' | name = '${commandName}
	#read
	for fd in "$fdDir"/fd/* ; do
		fdLink=$(readlink ${fd})
		! [ -z "${commandName}" ] && echo ${commandName%% *}' || '$fdLink
	done
done

