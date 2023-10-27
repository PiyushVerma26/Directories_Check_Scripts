#!/bin/bash

echo "Welcome to the Piyush Bash Scripting"
echo "This Program is for checking the Existence of Directories in the system"
echo "Taking input"

while true; do
  echo "Checking that the directory name is entered or not"
  if [ -n "$1" ]; then
    directory="$1"
  else
    directory="/usr/local"
  fi

  cd "$directory"

  echo "Checking the Existence of the directory"
  if [ ! -d "$directory" ]; then
    echo "The Given directory '$directory' does not exist."
    read -p "Do you want to create a directory at the given location and name? (Yes/No): " option
    if [ "$option" == "Yes" ]; then
      mkdir "$directory"
      echo "Successfully created the directory: '$directory'"
    else
      echo "Directory creation canceled."
      exit 1
    fi
  else
    echo "Congratulations, the given directory exists:"
    for item in "$directory"/*; do
      echo "$item"
    done
  fi

  read -p "Do you want to check another directory? (Yes/No): " another
  if [ "$another" != "Yes" ]; then
    break
  fi
done
