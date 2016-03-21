#Haskell

**Introdução**

Haskell é uma linguagem puramente funcional elaborada em 1987,que enfatiza mais o que deve ser feito e não como deve 
ser feito. Contemplando também a clareza e uma fácil manutenção nos códigos.Levando em comparação as linguagens imperativas, é dado ao
computador uma sequência de tarefas, os quais ele executa, podendo inclusive mudar o estado delas. Já em programação funcional não fazemos atribuições, mas sim definições. 


**Origens e Influências**

Em 1930, Alonzo Church desenvolveu o cálculo de Lambda, um simples e poderoso teorema de funções.Mais a frente, em  1950 John McCarthy desenvolveu Lisp, a primeira linguagem funcional, que tinha influência da teoria de lambda mas aceitando atribuições de variáveis.Em 
1987 havia um número enorme de linguagens funcionais e então surgiu a ideia de se criar uma única linguagem que englobasse 
todas as melhores práticas de projeto de linguagem.Sendo assim,decidiram não começar do zero e elegeram uma linguagem 
como base para o projeto, a linguagem Miranda, que era comercial e já usada em produção. A nova  linguagem foi batizada 
como Haskell em homenagem ao matemático  Haskell Curry .A versão 1.0 de Haskell foi liberada em 1990. Apesar de ser 
simples , possui uma variedade de aplicações e é muito poderosa.

**Comparação com outras linguagens** 


Haskell é uma linguagem de paradigma funcional. Em liguagens imperativas, quando  atribuímos à variável “x” o valor “5”. Em
seguida, são feitas algumas computações e o valor daquela variável se torna “10”. Houve mudança de estado. Já em programação 
funcional não fazemos atribuições, mas sim definições.Se foi definido que “x” é 5, não se pode depois
definir “x” como 10.Portanto, os dados são imutáveis e são evitados estados. Não existe efeitos colaterais.

Exemplo do algoritmo insertion_sort em 

python :

def insertionSort(v):
    for j in range(1, len(v)):
        chave = v[j]
        i = j - 1
        while i >= 0 and v[i] > chave:
            v[i + 1] = v[i]
            i -= 1
        v[i + 1] = chave


Exemplo em Haskell:

import Data.List (insert)

insertsort :: Ord a => [a] -> [a]
insertsort = foldr insert []

 Em Haskell existem apenas funções e todas as funções são unárias.Também não existem variáveis globais, apenas funções e variáveis locais, definidas dentro do escopo de cada função. Também não há estruturas de loop.Há duas funcionalidades importantes para a construção de listas. A primeira é a list comprehension, que permite construir listas sob forma de conjuntos.A segunda funcionalidade é a sequência aritmética, que permite construir listas sob forma de intervalos.
 Outra característica ,dois sinais de menos iniciam um comentário. Comentários em Haskell só existem para uma linha, não para um conjunto delas.

**Conclusão**


 O Haskell possui como propriedades a modificabilidade, a alta portabilidade e a grande reusabilidade.Pode ser compilada 
ou interpretada.Em Haskell não há uma estrutura orientada a objetos propriamente dita, por se tratar de uma linguagem 
puramente funcional.As empresas que a utilizam são Fakebook, at&t , telecomunicações(EUA),Banco- Alemanha entre outros.

**Bibliografia**

https://pt.wikipedia.org/wiki/Haskell_(linguagem_de_programa%C3%A7%C3%A3o)

https://marceloparrela.wordpress.com/2013/11/01/haskell-a-historia/

http://www.inf.ufpr.br/andrey/ci062/ProgramacaoHaskell.pdf

http://haskell.tailorfontela.com.br/introduction
