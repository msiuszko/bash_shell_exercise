#!/bin/bash

# test-integer3: sprawdza, czy liczba całkowita
# znajduje się w zakresie wartości

MIN_VAL=1
MAX_VAL=100
INT=50

if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
	if [[ "$INT" -ge "$MIN_VAL" && "$INT" -le "$MAX_VAL" ]]; then
		echo "$INT znajduje się w przedziale od $MIN_VAL do $MAX_VAL."
	else
		echo "$INT jest poza przedziałem."
	fi
else
	echo "INT nie jest liczbą całkowitą." >&2
	exit 1
fi
