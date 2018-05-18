#!/bin/sh

if [ -e "contacts.txt" ]
    then
        while [ "$opt" != "n" ]
        do
            echo "welcome to the address book"
            echo "choose from the options"
            echo "1. Add contact"
            echo "2. view Directory"
            echo "3. Search"
            echo "4. Delete contact"
            echo "5. Exit"


            read -p "enter your choice: " choice

            case $choice in
            1)
            #add contact
            read -p "enter the name: " name
            read -p "enter last name:" lname
            read -p "enter number: " number
            read -p "enter E-mail: " e_mail
            echo "$name : $lname: $number: $e_mail" >> contacts.txt
            echo ""
            ;;

            2) cat contacts.txt
            ;;

            3) read -p "enter the first name to be searched: " fname
            grep -i $fname contacts.txt
            echo ""
            ;;

            4) read -p "enter the first name to be deleted: " dname
   
            sed -i "/$dname/d" contacts.txt 
            ;;

            5) break
            ;;

            *) echo "enter a valid choice "
            ;;
            esac

        read -p "do you want to continue (y/n)" opt 
        done

else
touch contacts.txt
fi
