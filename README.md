# Testy wydajnościowe dla Swift

Niniejsze repozytorium zawiera testy porównujące wydajność języka Swift z Objective-C oraz platformę do uruchomienia testów napisane na potrzeby pracy magisterskiej. 

## Wymagania sprzętowe

Testy można uruchomić jedynie na komputerze z systemem MacOS z zainstalowanym językiem Swift w wersji conajmniej 4.2. Do uruchomienia projektu niezbędne są narzędzia Xcode Command Line Tools. Można je zainstalować na dwa sposoby:

- instalując środowisko programistyczne Xcode,
- wywołując komendę `xcode-select --install`.

## Kompilacja i uruchomienie

Aby zbudować projekt z platformą testową i testami, należy przejść do folderu `Benchmarks` i uruchomić komendę `xcodebuild -project Benchmarks.xcodeproj`. Zostanie stworzony folder `build`, w których znajdą się wszystkie artefakty powstałe podczas budowania, w tym również plik wykonywalny platformy testowej, który domyślnie znajduje się w folderze `build/Release`.

Aby uruchomić test należy przejść do folderu z plikiem wykonywalnym i uruchomić komendę `./Benchmarks run nazwa_testu -n n`, gdzie `nazwa_testu` to test, który ma zostać wykonany, a `n` to wartość wejściowa dla testu. Przykładowe wywołanie: `./Benchmarks run ArrayInsertionSwift -n 100000`. Lista wszystkich nazw testów dostępna jest za pomocą komendy `./Benchmarks list`.

Platforma testowa zawiera więcej opcji modyfikujących wykonanie testów, pełna lista dostępna jest za pomocą komendy `./Benchmarks help`.
