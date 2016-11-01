# Pomysły na pracę magisterską

0. Wstęp - kilka słów o samym Swifcie
  - nowy język, statycznie i silnie typowany, ale z type inference
  - powstały na bazie doświadczeń z Objective-C, ale zaczerpuje miliony pomysłów z innych języków
  - duży krok w kierunku języków funkcyjnych (domknięcia jako first-class citizens, currying zaszyty w języku, gotowe funkcje wyższego rzędu w stdlibie)
  - motywacja
  - plan pracy

1. Podobieństwa do innych języków:
  - podstawy, np. obiektowość, polimorfizm etc (podobieństwa do Javy, C#, krótko)
  - kompilowany ale ma REPLa
  - generics (TODO: doczytać o implementacji)
  - value types and reference types (jak w C#)
  - język "bardzo silnie" typowany
  - domknięcia jako first-class citizens
  - możliwość wymuszenia leniwości obliczeń (implementacja podobna jak w C# za pomocą sekwencji)
  - funkcyjne elementy podobne do Haskella (?):
    - Optional / Maybe
    - parametryczne enumy (podobne do Haskellowych typów)

2. Podobieństwa i różnice względem Obj-C:
  - wymienienie najważniejszych podobieństw
  - wymienienie najważniejszych różnic (type safety etc)

3. Porównania:
  - wydajność
    - coś klasycznego (Mandelbrot - Swift podobno pokazuje tutaj swój potencjał)
    - operacje na kontenerach
    - sortowanie  (http://i.stack.imgur.com/wcdXk.jpg)
    - coś na sprawdzenie wydajności przy dużej ilości wywołań rekurencyjnych (problemy z reference counting)
    - testy z użyciem nowych feature'ów (względem bliźniaczej implementacji z Swifcie "w starym stylu", wzdlędem Obj-C i ewentualnie innych języków:
      - algorytmy na drzewach (w Swifcie możemy je zaimplementować w mocno funkcyjnym stylu)
      - operacje mapowania/filtrowania w porównaniu do zwykłych pętli for w Obj-C (lub innych językach)
      - test na wykorzystanie statycznego typowania (rozbudowana hierarchia typów polimorficznych?)
      - używanie optional type i unwrapping vs zwracanie nili
      - leniwe sekwencje (porównanie z C#(?))
  - implementacja(?)

  # Uwagi ogólne

  - do dokładniejszej analizy można użyć *Instruments*
  - wydaność można podzielić na dwa obszary: wydajność języka i wydajność stdlib (do sprawdzenie wydajności samego języka najlepiej użyć jakichś prostych testów - funkcji Ackermana, Fibbonacciego etc, patrz: http://dada.perl.it/shootout/)


# Tytuł
Porównanie cech i wydajności języka Swift względem Objective-C