//: [Previous](@previous)

import Foundation

// Day 6 – loops, summary, and checkpoint 3


// 1 - Como usar um loop for para repetir o trabalho

//se tivermos um array de strings, podemos imprimir cada string assim:
let platforms = ["ïOS", "watchOS", "MacOS", "tvOS"]

for os in platforms {
    print("Swift works great on \(os)")
}
//Dentro das chaves está o código que queremos executar para cada item do array, então o código acima imprimirá quatro linhas – uma para cada item do loop. Primeiro ele coloca “iOS” lá e depois chama print(), depois coloca “macOS” lá e chama print(), depois “tvOS”, depois “watchOS”.

for name in platforms {
    print("Swift works great on \(name)")
}
//ou
for rubberChicken in platforms {
    print("Swift works great on \(rubberChicken).")
}

//Em vez de percorrer um array (ou conjunto ou dicionário – a sintaxe é a mesma!), você também pode percorrer um intervalo fixo de números. Por exemplo, podemos imprimir a tabuada de 5 de 1 a 12 assim:
for i in 1...12 {
    print("5 X \(i) is \(5 * i)")
}
//Usei a variável de loop i, que é uma convenção de codificação comum para “número com o qual você está contando”. Se estiver contando um segundo número, você usaria j, e se estiver contando um terceiro, usaria k, mas se estiver contando um quarto, talvez deva escolher nomes de variáveis ​​melhores.
//A 1...12parte é um intervalo e significa “todos os números inteiros entre 1 e 12, bem como 1 e 12 em si”. Os intervalos são seus próprios tipos de dados exclusivos no Swift.


//Você também pode colocar loops dentro de loops, chamados de loops aninhados , assim:
for i in 1...12 {
    print("The \(i) times table:")
    
    for j in 1...12 {
        print(" \(j) X \(j * i)")
    }
    print()
}

//O Swift tem um tipo de intervalo semelhante, mas diferente, que conta até, mas excluindo o número final: ..<. Isso é melhor visto no código:
for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}
print()

for i in 1..<10 {
    print("COunting 1 uo to 5: \(i)")
}

/*
 Dica: ..< é muito útil para trabalhar com arrays, onde contamos de 0 e muitas vezes queremos contar até, mas excluindo o número de itens no array.

 Antes de terminarmos com foros loops, há mais uma coisa que quero mencionar: às vezes você quer executar algum código um certo número de vezes usando um intervalo, mas na verdade não quer a variável do loop - você não quer o iou j, porque você não o usa.

 Nessa situação, você pode substituir a variável de loop por um sublinhado, assim:
 */
var lyric = "Haters gonna"
for _ in 1...5 {
    lyric += "hate"
}
print(lyric)

// array - intervalo unilateral
let names = ["Piper", "Alex", "Suzanne", "Gloria"]
print(names[1...])


// 2 - Como usar um loop while para repetir o trabalho

// For são mais utilizados do que os while

var countdown = 10
while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}
print("Blast off!")


//while os loops são realmente úteis quando você simplesmente não sabe quantas vezes o loop será executado. Para demonstrar isso, quero apresentar a você uma funcionalidade realmente útil que Intpossui Double: random(in:). Dê a isso um intervalo de números para trabalhar e ele enviará de volta um aleatório Intou Doublealgum lugar dentro desse intervalo.

//Por exemplo, isso cria um novo número inteiro entre 1 e 1000
let id = Int.random(in: 1...1000)

//rolar alguns dados virtuais de 20 lados repetidas vezes, terminando o loop apenas quando um 20 é lançado - um acerto crítico para todos os jogadores de Dungeons & Dragons por aí.

// create an integer to store our roll
var roll = 0

// carry on looping until we reach 20
while roll != 20 {
    // roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

// if we're here it means the loop ended – we got a 20!
print("Critical hit!")


// 3 - Como pular itens de loop com break e continue

// O Swift nos dá duas maneiras de pular um ou mais itens em um loop: continuepula a iteração do loop atual e breakpula todas as iterações restantes

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}
//Isso cria um array de strings de nome de arquivo, então faz um loop sobre cada um e verifica se tem o sufixo “.jpg” – que é uma imagem. continueé usado com todos os nomes de arquivo que falham nesse teste, de modo que o restante do corpo do loop é ignorado.


//Quanto a break, isso sai de um loop imediatamente e pula todas as iterações restantes. Para demonstrar isso, poderíamos escrever algum código para calcular 10 múltiplos comuns para dois números:
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}
print(multiples)
//Assim que atingirmos 10 múltiplos, chame breakpara sair do loop.


// às vezes você deseja encerrar seu loop prematuramente. Por exemplo, se você tiver uma série de pontuações e quiser descobrir quantas delas o jogador alcançou sem obter um 0, você pode escrever isto:
let scores = [1, 8, 4, 3, 0, 5, 2]
var count = 0

for score in scores {
    if score == 0 {
        break
    }

    count += 1
}

print("You had \(count) scores before you got 0.")

/*Quando usamos continue, estamos dizendo “Concluí a execução atual deste loop” – o Swift pulará o restante do corpo do loop e irá para o próximo item do loop. Mas quando dizemos breakque estamos dizendo "Eu terminei com esse loop completamente, então saia completamente." Isso significa que o Swift pulará o restante do loop do corpo, mas também pulará quaisquer outros itens do loop que ainda estavam por vir.

//Assim como break, você pode usar continuecom declarações rotuladas se quiser, mas honestamente não me lembro de ter visto isso feito!*/


// 4 - Resumo: Condições e loops

/*
 - Usamos ifinstruções para verificar se uma condição é verdadeira. Você pode passar em qualquer condição que desejar, mas, no final das contas, deve se resumir a um booleano.
 - Se desejar, você pode adicionar um elsebloco e/ou vários else ifblocos para verificar outras condições. O Swift os executa em ordem.
 - Você pode combinar condições usando ||, o que significa que toda a condição é verdadeira se uma das subcondições for verdadeira ou &&, o que significa que toda a condição é verdadeira se ambas as subcondições forem verdadeiras.
 - Se você estiver repetindo muito os mesmos tipos de verificação, poderá usar uma switchdeclaração. Eles sempre devem ser exaustivos, o que pode significar adicionar um caso padrão.
 - Se um de seus switchcasos usar fallthrough, significa que o Swift executará o seguinte caso posteriormente. Isso não é usado comumente.
 - O operador condicional ternário nos permite verificar WTF: What, True, False. Embora seja um pouco difícil de ler no começo, você verá que isso é muito usado no SwiftUI.
 - forloops nos permitem percorrer arrays, conjuntos, dicionários e intervalos. Você pode atribuir itens a uma variável de loop e usá-la dentro do loop, ou pode usar sublinhado, _, para ignorar a variável de loop.
 - whileloops nos permitem criar loops personalizados que continuarão em execução até que uma condição se torne falsa.
 - Podemos pular alguns ou todos os itens de loop usando continueou breakrespectivamente.
 */



// 5 - Ponto de verificação 3

