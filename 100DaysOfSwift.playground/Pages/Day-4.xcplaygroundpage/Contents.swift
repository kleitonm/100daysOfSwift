import Foundation

// Loops

// 1. For loops
// loop mais comum no Swift é um forloop: ele fará um loop sobre arrays e intervalos, e cada vez que o loop for executado, ele retirará um item e atribuirá a uma constante

//aqui está um intervalo de números:
let count = 1...10

//Podemos usar um forloop para imprimir cada item assim:
for number in count {
    print("Number is \(number)")
}

// Podemos fazer o mesmo com arrays:

let groups = ["Vou pro Sereno", "Pixote", "Tiee", "Tiaguinho", "Ferrugem"]

for group in groups {
    print("\(group) is on Spotfy")
}

//Se você não usar a constante fornecida pelos forloops, use um sublinhado para que o Swift não crie valores desnecessários:

print("Players gonna ")
for _ in 1...5 {
    print("play")
}

var numbers = [1, 2, 3, 4, 5, 6]
for number in numbers {
    if number % 2 == 0 {
        print(number)
    }
}

// 2. While loops
//Uma segunda maneira de escrever loops é usando while: dê a ele uma condição para verificar e seu código de loop irá girar e girar até que a condição falhe.
var number = 1

while number <= 20 {
    print(number)
    number += 1
}
print("Ready or not, here I come!")

//A principal diferença é que foros loops geralmente são usados ​​com sequências finitas: fazemos um loop pelos números de 1 a 10 ou pelos itens de uma matriz, por exemplo. Por outro lado, os whileloops podem repetir até que qualquer condição arbitrária se torne falsa, o que os permite até que digamos para parar.

//whileloop é útil: podemos manter o loop girando até que estejamos prontos para sair.

let colors = ["Red", "Green", "Blue", "Orange", "Yellow"]
var colorCounter = 0
while colorCounter < 5 {
    print("\(colors[colorCounter]) is a popular color.")
    colorCounter += 1
}

var averageScore = 2.5
while averageScore < 15.0 {
    averageScore += 2.5
    print("The average score is \(averageScore)")
}

// 3. Repeat loops
// repeatloop e é idêntica a um whileloop, exceto que a condição a ser verificada vem no final.

var otherNumber = 1

repeat {
    print(otherNumber)
    otherNumber += 1
} while otherNumber <= 20
print("Ready or not, here I come!")

// shuffled(), que é o código que podemos executar em um array que cria uma cópia do array array, randomiza a ordem dos itens da cópia e os retorna.
let ninenumbers = [1, 2, 3, 4, 5]
let random = ninenumbers.shuffled()

//usando um whileloop, podemos escrever isto:
let onenumbers = [1, 2, 3, 4, 5]
var randoms = onenumbers.shuffled()

while randoms == onenumbers {
    randoms = onenumbers.shuffled()
}

//Agora olhe para o mesmo código usando repeat:
let twonumbers = [1, 2, 3, 4, 5]
var tworandom: [Int]

repeat {
    tworandom = twonumbers.shuffled()
} while tworandom == twonumbers

// 4. Exiting loops
//Você pode sair de um loop a qualquer momento usando a palavra- breakchave
var countDown = 10
while countDown >= 0 {
    print(countDown)
    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }
    countDown -= 1
}

// 5. Exiting multiple loops
// Se você colocar um loop dentro de um loop, ele é chamado de loop aninhado e não é incomum querer sair do loop interno e do loop externo ao mesmo tempo.

//tabuada
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        
        if product == 20 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}
//Com um break, apenas o loop interno seria encerrado - o loop externo continuaria de onde parou.

//exemplo em que estamos tentando descobrir a combinação correta de movimentos para destravar um cofre

let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]
outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}

// 6. Skipping items
//a palavra- breakchave sai de um loop. Mas se você quiser apenas pular o item atual e continuar no próximo, você deve usar continue.

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    print(i)
}

//Quando usamos continue, estamos dizendo “Concluí a execução atual deste loop” – o Swift pulará o restante do corpo do loop e irá para o próximo item do loop. Mas quando dizemos breakque estamos dizendo "Eu terminei com esse loop completamente, então saia completamente." Isso significa que o Swift pulará o restante do loop do corpo, mas também pulará quaisquer outros itens do loop que ainda estavam por vir.
var counting = 0
while counting <= 20 {
    counting += 1
    if counting > 5 {
        continue
    }
    print("\(counting)...")
}
print("Ready or not, here I come!")

for i in 1...100 {
    if 100 % i == 0 {
        print("100 divides evenly into \(i)")
    } else {
        continue
    }
}

// 7. Infinite loops
// Para fazer um loop infinito, basta usar truecomo sua condição. trueé sempre verdadeiro, então o loop se repetirá indefinidamente. Aviso: certifique-se de ter uma verificação que saia do seu loop, caso contrário, ele nunca terminará.

var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}

//Nesse código, “estou vivo!” será impresso de novo e de novo para sempre, enquanto o "eu apaguei!" a mensagem nunca será impressa – o loop não terminará, então a mensagem não será impressa. Na prática, é mais provável que você tenha algum tipo de condição em seu loop, assim:
var isAlive = false

while isAlive == true {
    print("I'm alive!")
}

print("I've snuffed it!")

// 8. Looping summary

/*
 então vamos resumir:

 1 - Os loops nos permitem repetir o código até que uma condição seja falsa.
 
 2 - O loop mais comum é for, que atribui cada item dentro do loop a uma constante temporária.
 
 3 - Se você não precisa da constante temporária fornecida pelos forloops, use um sublinhado para que o Swift possa pular esse trabalho.
 
 4- Existem whileloops, que você fornece com uma condição explícita para verificar.
 
 5 - Embora sejam semelhantes aos whileloops, repeatos loops sempre executam o corpo de seu loop pelo menos uma vez.
 
 6 - Você pode sair de um único loop usando break, mas se tiver loops aninhados, precisará usar breakseguido por qualquer rótulo que tenha colocado antes do loop externo.
 
 7 - Você pode pular itens em um loop usando continue.

 8- Os loops infinitos não terminam até que você peça e são feitos usando while true. Certifique-se de ter uma condição em algum lugar para terminar seus loops infinitos!
 */
