#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guessing -t --no-align -c"

# read USERNAME
echo Enter your username:
read USERNAME

# query USERNAME
QUERY_NAME_RESULT=$($PSQL "SELECT games_played,best_game FROM users_info WHERE username='$USERNAME'")

if [[ -z $QUERY_NAME_RESULT ]]
then
  # new user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # old user
  echo $QUERY_NAME_RESULT | while IFS="|" read GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

# get random number
SECRET_NUMBER=$((RANDOM%999+1))

echo "Guess the secret number between 1 and 1000:"
read USER_GUESS
NUMBER_OF_GUESS=1

# game
while (( $USER_GUESS != $SECRET_NUMBER ))
do
  if [[ $USER_GUESS =~ ^[0-9]+$ ]]
  then 
    if (( $USER_GUESS >  $SECRET_NUMBER ))
    then
      echo "It's lower than that, guess again:"
      read USER_GUESS
      NUMBER_OF_GUESS=$(( $NUMBER_OF_GUESS + 1 ))
    else
      echo "It's higher than that, guess again:"
      read USER_GUESS
      NUMBER_OF_GUESS=$(( $NUMBER_OF_GUESS + 1 ))
    fi
  # handle not integer input
  else
    echo "That is not an integer, guess again:"
    read USER_GUESS
  fi
done

# win
echo "You guessed it in $NUMBER_OF_GUESS tries. The secret number was $SECRET_NUMBER. Nice job!"
# insert data to database
if [[ -z $QUERY_NAME_RESULT ]]
then
  # new user
  INSERT_NEW_USER=$($PSQL "INSERT INTO users_info(username,games_played,best_game) VALUES('$USERNAME',1,$NUMBER_OF_GUESS)")
else
  # old user
  echo $QUERY_NAME_RESULT | while IFS="|" read GAMES_PLAYED BEST_GAME
  do
    if (( $NUMBER_OF_GUESS < $BEST_GAME ))
    then
      BEST_GAME=$NUMBER_OF_GUESS
    fi
    UPDATE_USER=$($PSQL "UPDATE users_info SET games_played=$(( $GAMES_PLAYED + 1 )),best_game=$BEST_GAME WHERE username='$USERNAME' ")
  done
fi
