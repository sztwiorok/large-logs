#!/bin/bash

# Nazwa pliku wyjściowego
OUTPUT_FILE="file.txt"

# Usunięcie poprzedniego pliku, jeśli istnieje
rm -f "$OUTPUT_FILE"

# Generowanie 10 linii logów
for line_num in {1..10}; do
    line=""
    
    # Generowanie zawartości linii (10000 znaków)
    for ((i=0; i<10000; i+=100)); do
        # Tworzenie oznaczenia dla każdego bloku 100 znaków
        marker=$(printf "____%d____" $i)
        
        # Obliczanie, ile 'x' trzeba dodać, aby blok miał 100 znaków
        filler_length=$((100 - ${#marker}))
        filler=$(printf '%*s' "$filler_length" | tr ' ' 'x')
        
        # Dodanie bloku do linii
        line="${line}${marker}${filler}"
    done
    
    # Zapisanie linii do pliku
    echo "$line" >> "$OUTPUT_FILE"
    
    # Wyświetlenie informacji o postępie
    echo "Wygenerowano linię $line_num z 10"
done
