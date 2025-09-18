#!/bin/bash
#Aliases and functions that helps daily

alias desk="cd /home/$USER/Desktop"	# Goes to user's desktop
alias 42="cd /home/$USER/Desktop/42"	# 42 school directory
alias gcca="comp -Wall -Wextra -Werror -g"	# Compiles with error and debbuging flags
alias nette="norminette -R CheckForbiddenSourceHeader"	# Runs 42 school's norm with flag
alias code="flatpak run com.visualstudio.code"	# In case "code" command isn't openning VSCode
alias gitrun='git add * && git commit -m "Commit done in a hurry" && git push'	# Urgent commit if need to leave ASAP
alias valg="valgrind --leak-check=full --show-leak-kinds=all --track-fds=yes --track-origins=yes --trace-children=yes -s"	# Runs valgring with most used flags

function gitall(){	# Do a commit with everything added and comment as the 1st argument of command.
 	git add .
	if [ -n "$1" ]; then
		git commit -m "$1"
	else
		git commit -m update
 	fi
	if [[$2 && $2 == "push"]]; then	# If 2nd argument is "push", already push
		git push
	fi
}
