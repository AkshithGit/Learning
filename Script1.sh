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

###############################################################

#!/bin/bash
#for continous loop
while [ TRUE ]; do
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
done

##############################################
#!/bin/bash
#for 6 users loop using while loop
COUNT=0
while [ $COUNT -lt 6 ]; do
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
    COUNT=$(($COUNT + 1))
done
##############################################################################
#!/bin/bash
#for loop
#for ((COUNT = 0; COUNT <= 3; COUNT++)); do
read -p "Please enter the user count:" USERCOUNT
for ((COUNT = 0; COUNT <= ${USERCOUNT}; COUNT++)); do
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

done
################################################################################

$@ --> Parameters assigning to the $a one at a time and considers quotes
Use:
ping.sh kick bick tick

#!/bin/bash
$@
echo $@

output: kick bick tick




$* --> Parameters assigning to the $* all atonce, mainly used in the bash for loop for range, doesn't consider quoted strings
Use:
ping.sh kick bick tick

#!/bin/bash
for USER in $*
#for USER in $@ #Even this works same as there are no quotes in the input parameters
do
echo $USER
done


output: kick bick tick





$? --> exit Status of the previous execution(success=0,..)
Use: echo $?
Refer: https://www.educative.io/answers/what-are-exit-codes-in-linux





$# --> Number of parameters given as input to the script.
Use:
#!/bin/bash
if [ $# > 0 ]
then
echo "Lets create $# users" 
else
echo "Enter atleast one user"
fi

#####################################################################

#!/bin/bash

USERS=$@
for USER in ${USERS}
do
    EXUSER=$(cat /etc/passwd | grep -w $USER)
    if [ "${USER}" = "${EXUSER}" ]; then
        echo "Please enter a different username"
    else
        echo "Lets create a user"
        useradd -m ${USER}
        echo "${USER} is created"
        SPEC="!@#$%^&*()_+"
        SPECCHAR=$(echo ${SPEC} | fold -w1 | shuf | head -1)
        PASS="Admin@${RANDOM}${SPECCHAR}"
        echo "${USER}:$PASS" | sudo chpasswd
        passwd -e ${USER}
        echo "The user ${USER} with temp password ${PASS} is created"
    fi

done
#############################################################