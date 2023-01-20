#!/bin/bash
echo "Hi this is akshith"

#Variable Substitution
read -p "Enter your message": INP

cowsay Akshith say ${INP}

NAME="Avyan"

echo "$NAME"

# '' does not do variable substitution
echo '$NAME'

echo $NAME

###############################

#!/bin/bash
echo "Welcome to the program"
read -p "Enter the name of the user:" USERNAME
echo "The username you have entered is $USERNAME"
#Assigning output of a command to a variable
EXUSER=$(cat /etc/passwd | grep -w $USERNAME)
if [ "${USERNAME}" = "${EXUSER}" ]; then
    echo "Please enter a different username"
else
    echo "Lets create a user"
    useradd -m ${USERNAME}
    echo "${USERNAME} is created"
    PASS="Admin@12345"
    echo "${USERNAME}:$PASS" | sudo chpasswd
fi
#But the password is hardcoded 
#############################################

#!/bin/bash
echo "Welcome to the program"
read -p "Enter the name of the user:" USERNAME
echo "The username you have entered is $USERNAME"
#Assigning output of a command to a variable
EXUSER=$(cat /etc/passwd | grep -w $USERNAME)
if [ "${USERNAME}" = "${EXUSER}" ]; then
    echo "Please enter a different username"
else
    echo "Lets create a user"
    useradd -m ${USERNAME}
    echo "${USERNAME} is created"
    SPEC="!@#$%^&*()_+"
    SPECCHAR=$(echo ${SPEC} | fold -w1 | shuf | head -1)
    PASS="Admin@${RANDOM}${SPECCHAR}"
    echo "${USERNAME}:$PASS" | sudo chpasswd
    passwd -e ${USERNAME}
    echo "The user ${USERNAME} with temp password ${PASS} is created"
fi