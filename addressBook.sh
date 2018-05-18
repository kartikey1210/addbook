#!/bin/sh

while :
 do
 #if [-e "acontacts.txt"]
 

    clear
    echo "Welcome to the Address Book"
    echo "Choose from the following options"
    echo "1. Search Contact"
    echo "2. Add Contact"
    echo "3. Delete Contact"
    echo "4. Edit Contact"
    echo "5. show Address Book"
    echo "6. Exit"
    
    read -p "enter your choice" choice
    
    case $choice in
    1) echo "Search Result" 
       read -p "enter the name to be searched for" sname
       grep -i $sname contacts.txt
       clear
    ;;
    
    2)  echo "Add Contacts"
        echo "Enter the contact details:"
        read -p "enter the name" name
        read -p "enter last name" lname
        read -p "enter the email" e_mail
        read -p "enter number" number
        echo "Name -> $name ; LastName -> $lname ; E-mail -> $e_mail ; Number -> $number"
        duplicate = $(sed -i -e s/$name//g contacts.txt) #to check the whether the data is already there or not
        if [$name == $duplicate] || [$lname == $duplicate]
            then
            echo "The record already exist"
            read -p "Confirm to save details? (y/n)" ch
            if [$ch == "y"]
                then
                echo "$name: $lname: $e_mail: $number:" >> addrressBook.txt
                echo "Contact added successfully"
            fi
        fi
    clear
    ;;
    
    3)  echo "Delete Contact"
        read -p "Enter the name to be deleted" dname
        sed -i -e /$dname/Id contacts.txt
        echo "Delete successfull"
        clear
    ;;

    4)  echo "Edit Contact"
        echo "enter the contact First name to be deleted"
        read fname
        sed -i -e s/$fname//Id contacts.txt
        read -p "enter the first name: " name
        read -p "enter the last name: " lname
        read -p "enter E-mail: " e_mail
        read -p "enter the number: " number
        echo "$name: $lname: $e_mail: $number" >> contacts.txt
        echo "Contact Edited successfully"
        clear
    ;;

    5)  echo "Address Book Details"
        echo ""
        cat contacts.txt
        #clear
    ;;
    6)  break;;
    
    *)  echo "Invalid Option"
 esac

done