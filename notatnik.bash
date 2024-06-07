#!/bin/bash

dzialanie_na_pliku () {
    echo "Notatnik";
    echo "Wybierz opcje:";
    echo "1 - stworzyc nowy plik";
    echo "2 - odczytac plik";
    read wybor;

    if [ $wybor -eq 1 ]; then
        echo "Wprowadz nazwe pliku";
        read imie_pliku;
        if [ -f "$imie_pliku" ]; then
            echo "Taki plik juz istnieje";
            echo "Czy chcesz odczytac plik?"
            echo "0 - nie";
            echo "1 - tak";
            read wybor2;
            if [ $wybor2 -eq 0 ]; then
                exit 1;
            else
                while IFS= read -r line; do
                    echo "$line";
                done < "$imie_pliku"
            fi
        else
            echo "Taki plik jeszcze nie istnieje";
            echo "Tworze nowy plik";
            echo "Wpisz zawartosc pliku";
            read zawartosc_pliku;
            echo "Zawartosc pliku juz jest zapisana";
            echo "$zawartosc_pliku" > "$imie_pliku";
            echo "Tworzenie nowego pliku skonczylo sie!";
        fi
    fi
    if [ $wybor -eq 2 ]; then
        echo "Wprowadz nazwe pliku: ";
        read imie_pliku;
        while IFS= read -r line; do
            echo "$line";
        done < "$imie_pliku";
        echo "Czy chcesz zmienic zawartosc tego pliku?";
        echo "0 - nie";
        echo "1 - tak";
        read wybor3;
        if [ $wybor3 -eq 1 ]; then
            echo "Wpisz zawartosc pliku";
            read zawartosc_pliku;
            echo "Zawartosc pliku juz jest zapisana";
            echo "$zawartosc_pliku" > "$imie_pliku";
            echo "Tworzenie nowego pliku skonczylo sie!";
        else
                exit 1;
        fi
        dzialanie_na_pliku;
     fi

}

dzialanie_na_pliku;
