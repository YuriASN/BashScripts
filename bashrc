#Aliases and functions that helps daily
#
#Created by YuriASN, 2025

# Goes to user's desktop
alias desk="cd /home/$USER/Desktop"

# 42 school directory at desktop
alias 42="cd /home/$USER/Desktop/42"

# Compiles with error and debbuging flags
alias gcca="comp -Wall -Wextra -Werror -g"

# Runs 42 school's norm with flag
alias nette="norminette -R CheckForbiddenSourceHeader"

# In case "code" command isn't openning VSCode
#alias code="flatpak run com.visualstudio.code"

# Urgent commit if need to leave ASAP
alias gitrun='git add * && git commit -m "Commit done in a hurry" && git push'

# Runs valgring with most used flags
alias valg="valgrind --leak-check=full --show-leak-kinds=all --track-fds=yes --track-origins=yes --trace-children=yes -s"

# Do a commit with everything added and comment as the 1st argument of command.
# If 2nd argument is push, already push the commit.
function gitall(){
	git add .
	if [ -n "$1" ]; then
	    git commit -m "$1"
	else
	    git commit -m update
	fi
	if [ $2 -a $2 == "push" ]; then
		git push
	elif [ $2 ]; then
			echo "Option $2 doesn't exist"
	fi
}
