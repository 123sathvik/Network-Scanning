#!/bin/bash

# Function to display the menu
display_menu() {
    echo "\nSelect the type of Nmap scan to perform:"
    echo "1. Aggressive Scan"
    echo "2. Stealth Scan"
    echo "3. Verbose Scan"
    echo "4. Port Scan"
    echo "5. UDP Scan"
    echo "6. Exit"
}

# Main loop
while true; do
    # Display the menu
    display_menu

    # Prompt the user for input
    read -p "Enter your choice: " choice

    # Handle the exit option
    if [ "$choice" -eq 6 ]; then
        echo "Exiting..."
        exit 0
    fi

    # Prompt the user for the target IP/host
    read -p "Enter the target IP or hostname: " target

    # Validate the choice and execute the corresponding nmap command
    case $choice in
        1)
            echo "Performing Aggressive Scan on $target..."
            nmap -A "$target"
            ;;
        2)
            echo "Performing Stealth Scan on $target..."
            nmap -sS "$target"
            ;;
        3)
            echo "Performing Verbose Scan on $target..."
            nmap -v "$target"
            ;;
        4)
            echo "Performing Port Scan on $target..."
            nmap -p- "$target"
            ;;
        5)
            echo "Performing UDP Scan on $target..."
            nmap -sU "$target"
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac

done
