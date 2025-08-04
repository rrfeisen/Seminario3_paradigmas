
module Exercicios exposing (somaLista, soPares)

-- Exercício 1: Soma de uma lista
somaLista : List Int -> Int
somaLista lista =
    case lista of
        [] -> 0
        x :: xs -> x + somaLista xs

-- Exercício 2: Filtrar elementos pares
soPares : List Int -> List Int
soPares lista =
    List.filter (\n -> modBy 2 n == 0) lista
