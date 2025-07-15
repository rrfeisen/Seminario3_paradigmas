# Elm: Linguagem Funcional

## Ano de Criação
**2012** - Primeira versão lançada por Evan Czaplicki

## Quem Criou e Onde Surgiu?
**Criador:** Evan Czaplicki  
**Origem:** Universidade de Harvard, Estados Unidos  
**Contexto:** Desenvolvida inicialmente como tese de graduação de Evan Czaplicki, com foco em programação funcional reativa para desenvolvimento web front-end.

## Por Que Ela é Considerada Funcional?
Elm é considerada funcional pelos seguintes motivos:

- **Imutabilidade por padrão:** Todos os valores são imutáveis
- **Funções como cidadãos de primeira classe:** Funções podem ser passadas como argumentos e retornadas de outras funções
- **Ausência de efeitos colaterais:** Funções puras que sempre produzem o mesmo resultado para a mesma entrada
- **Expressões ao invés de declarações:** Tudo é uma expressão que retorna um valor
- **Sistema de tipos forte:** Inferência de tipos estática que previne erros em tempo de compilação
- **Recursão como mecanismo principal de iteração**

## Qual Problema Ela Buscava Resolver?
Elm foi criada para resolver problemas específicos do desenvolvimento web front-end:

- **Runtime errors:** Eliminar erros em tempo de execução através de um sistema de tipos robusto
- **Complexidade de estado:** Gerenciar estado de aplicações web de forma previsível
- **Debugging difícil:** Fornecer mensagens de erro claras e úteis
- **Performance:** Otimizar renderização através de Virtual DOM eficiente
- **Manutenibilidade:** Facilitar refatoração e evolução do código

## Ela é Usada em Produção Hoje?
**Sim, mas com uso limitado.**

**Empresas que usam/usaram:**
- **NoRedInk:** Maior usuário, plataforma educacional
- **Prezi:** Apresentações online
- **Rakuten:** E-commerce
- **Microsoft:** Alguns projetos internos
- **Pivotal:** Ferramentas de desenvolvimento

**Áreas de uso:**
- Aplicações web front-end
- SPAs (Single Page Applications)
- Interfaces de usuário interativas
- Protótipos e MVPs

**Limitações atuais:**
- Comunidade pequena
- Ecossistema de bibliotecas limitado
- Falta de recursos enterprise

## Ela é Puramente Funcional ou Funcional com Suporte a Imperativo?
**Elm é PURAMENTE FUNCIONAL** pelas seguintes razões:

**Argumentos para pureza funcional:**
- **Sem mutabilidade:** Impossível modificar dados existentes
- **Sem efeitos colaterais:** Todas as funções são puras
- **Sem loops imperativos:** Apenas recursão é permitida
- **Sem variáveis:** Apenas constantes e parâmetros
- **Arquitetura TEA (The Elm Architecture):** Força padrão funcional puro

**Não há suporte imperativo porque:**
- Não existem keywords como `for`, `while`, `var`
- Não há operações de atribuição (`=` é binding, não assignment)
- Não há ponteiros ou referências mutáveis
- I/O é tratado através do sistema de mensagens puro

## Como Ela Lida com Imutabilidade?
**Imutabilidade é fundamental e obrigatória em Elm:**

**Mecanismos:**
- **Structural sharing:** Otimização de memória para cópias de dados
- **Persistent data structures:** Estruturas que preservam versões anteriores
- **Copy-on-write:** Cria novas versões apenas quando necessário

**Exemplo:**
```elm
-- Impossível modificar uma lista existente
numbers = [1, 2, 3]
-- Cria uma nova lista
newNumbers = 4 :: numbers  -- [4, 1, 2, 3]
```

## Características da Sintaxe Funcional

### Como são Declaradas Funções?
```elm
-- Função simples
add : Int -> Int -> Int
add x y = x + y

-- Função com pattern matching
factorial : Int -> Int
factorial n =
    if n <= 1 then
        1
    else
        n * factorial (n - 1)

-- Função anônima
multiply = \x y -> x * y
```

### Como se Define uma Lista?
```elm
-- Lista vazia
empty = []

-- Lista com elementos
numbers = [1, 2, 3, 4, 5]

-- Lista de strings
names = ["Alice", "Bob", "Charlie"]

-- Cons operator (::)
moreNumbers = 0 :: numbers  -- [0, 1, 2, 3, 4, 5]

-- Concatenação
combined = [1, 2] ++ [3, 4]  -- [1, 2, 3, 4]
```

### Como se Faz Recursão?
```elm
-- Recursão simples
countdown : Int -> List Int
countdown n =
    if n <= 0 then
        []
    else
        n :: countdown (n - 1)

-- Recursão com pattern matching
length : List a -> Int
length list =
    case list of
        [] -> 0
        _ :: rest -> 1 + length rest

-- Recursão tail-optimized
sumHelper : List Int -> Int -> Int
sumHelper list acc =
    case list of
        [] -> acc
        x :: xs -> sumHelper xs (acc + x)
```

### Como Usar Funções de Ordem Superior?
```elm
-- Map
squared = List.map (\x -> x * x) [1, 2, 3, 4]  -- [1, 4, 9, 16]

-- Filter
evens = List.filter (\x -> x % 2 == 0) [1, 2, 3, 4, 5, 6]  -- [2, 4, 6]

-- Fold (reduce)
sum = List.foldl (+) 0 [1, 2, 3, 4, 5]  -- 15

-- Composição de funções
pipeline = [1, 2, 3, 4, 5]
    |> List.map (\x -> x * 2)
    |> List.filter (\x -> x > 4)
    |> List.sum
```

## Exemplos Básicos Úteis

### Função que Soma Dois Números
```elm
-- Definição com tipo
add : Int -> Int -> Int
add x y = x + y

-- Uso
result = add 5 3  -- 8

-- Versão curried
add5 = add 5
result2 = add5 3  -- 8
```

### Função Recursiva Simples (Somatório)
```elm
-- Somatório de 1 até n
sum : Int -> Int
sum n =
    if n <= 0 then
        0
    else
        n + sum (n - 1)

-- Versão otimizada (tail recursion)
sumOptimized : Int -> Int
sumOptimized n =
    sumHelper n 0

sumHelper : Int -> Int -> Int
sumHelper n acc =
    if n <= 0 then
        acc
    else
        sumHelper (n - 1) (acc + n)

-- Uso
result = sum 10  -- 55
resultOpt = sumOptimized 10  -- 55
```
