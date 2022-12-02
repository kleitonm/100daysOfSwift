
import Foundation

// Operators and conditions

// 1. Arithmetic Operators
let firstSccore = 12
let secondScore = 2

let plus = firstSccore + secondScore
let sub = firstSccore - secondScore
let div = firstSccore / secondScore
let mult = firstSccore * secondScore
let remainder = 13 % secondScore

let weeks = 465 / 7
let days = 465 % 7
print("There are \(weeks) weeks and \(days) days until the event.")

//Dica: se o seu objetivo é perguntar “esse número se divide igualmente em algum outro número?” então o Swift tem uma abordagem mais fácil:
let number = 465
let isMultiple = number.isMultiple(of: 7)

let result = 12 % 6


// 2. Operator overloading
//O Swift oferece suporte à sobrecarga de operador, que é uma maneira sofisticada de dizer que o que um operador faz depende dos valores com os quais você o usa. Por exemplo, +soma inteiros como este:
let meaningOfLife = 42
let doubleMeaning = 42 + 42

// + também une strings:
let fakers = "Faker gonna"
let action = fakers + "fake"

// juntar arrays
let firsthalf = ["Lebron", "Mike"]
let secondHalf = ["Ianes", "Paul"]
let group = firsthalf + secondHalf


// 3. Compound assignment operators

//se alguém marcou 95 em um exame, mas precisa ser penalizado em 5 pontos, você pode escrever o seguinte:
var score = 95
score -= 5

//Da mesma forma, você pode adicionar uma string a outra usando +=:
var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"


// 4. Comparison operators
var Onescore = 6
var Twoscore = 10

// ==verifica se dois valores são iguais e !=(pronuncia-se “não é igual”) verifica se dois valores não são iguais:
Onescore == Twoscore
Onescore != Twoscore

//Existem quatro operadores para comparar se um valor é maior, menor ou igual a outro. Estes são como na matemática:
Onescore < Twoscore
Onescore >= Twoscore

//Cada um deles também funciona com strings, porque as strings têm uma ordem alfabética natural:
"Taylor" <= "Swift"

//Podemos até pedir ao Swift para tornar nossos enums comparáveis, assim:
enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second)


// 5. Conditions
//condições usando ifinstruções. Você dá ao Swift uma condição e, se essa condição for verdadeira, ele executará o código de sua escolha.

let firstCard = 11
let secondcard = 10
// Você também pode encadear condições usando else if
if firstCard + secondcard == 2 {
    print("Aces - Lucky!")
}
else if firstCard + secondcard == 21 {
    print("BlackJack")
} else { //  código alternativo para executar se a condição for falsa , usando else:
    print("Regular Cards")
}

// Você pode ter quantos else ifcheques quiser, mas precisa exatamente de um ife zero ou um else
let Otherscore = 9001

if Otherscore > 9000 {
    print("It's over 9000!")
} else if Otherscore == 9000 {
    print("It's exactly 9000!")
} else {
    print("It's not over 9000!")
}

// 6.Combining conditions
//Swift tem dois operadores especiais que nos permitem combinar condições: eles são &&(pronuncia-se “e”) e ||(pronuncia-se “ou”).
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}

var isOwner = true
var isEditingEnabled = true
var isAdmin = true
if (isOwner == true && isEditingEnabled) || isAdmin == true {
    print("You can delete this post")
}

// 7.The ternary operator
// Swift tem um operador raramente usado chamado operador ternário. Ele trabalha com três valores ao mesmo tempo, daí vem seu nome: verifica uma condição especificada no primeiro valor, e se for true retorna o segundo valor, mas se for false retorna o terceiro valor.

//O operador ternário é uma condição mais blocos de verdadeiro ou falso, tudo em um, dividido por um ponto de interrogação e dois pontos, o que dificulta a leitura. Aqui está um exemplo:
let firstTernary = 11
let secondTernary = 10
print(firstTernary == secondTernary ? "Cards are the same" : "Cards are differents")

//Isso verifica se os dois cartões são iguais e imprime “Os cartões são iguais” se a condição for verdadeira ou “Os cartões são diferentes” se for falso. Poderíamos escrever o mesmo código usando uma condição regular:

if firstTernary == secondTernary {
    print("Cards are The same")
} else {
    print("Cards are different")
}


// 8. Switch statements
//Usando essa abordagem, você escreve sua condição uma vez e, em seguida, lista todos os resultados possíveis e o que deve acontecer para cada um deles.
var weather = "sunny"

switch weather {
case "rain":
    print("You need a umberla")
case "snow":
    print("You need a glover")
case "sunny":
    print("You need a black glasses")
default:
    print("Enjoy your day!")
}

//O Swift executará apenas o código dentro de cada caso. Se você deseja que a execução continue no próximo caso, use a palavra- fallthroughchave assim:
switch weather {
case "rain":
    print("You need a umberla")
case "snow":
    print("You need a glover")
    fallthrough
case "sunny":
    print("You need a black glasses")
default:
    print("Enjoy your day!")
}


// 9.Range operators

//O Swift nos dá duas maneiras de criar intervalos: os operadores ..<e . ...O operador de intervalo semiaberto, ..<, cria intervalos até, mas excluindo o valor final, e o operador de intervalo fechado, ..., cria intervalos até e incluindo o valor final.

//Por exemplo, o intervalo 1..<5contém os números 1, 2, 3 e 4, enquanto o intervalo 1...5contém os números 1, 2, 3, 4 e 5.

var testScore = 90

switch testScore {
case 0..<50:
    print("You failed in Test")
case 50..<80:
    print("You reached the average")
case 90:
    print("Very good")
default:
    print("It wasn't this time")
}

// 10.Operators and conditions summary

/*
 resumindo:

 1 - Swift tem operadores para fazer aritmética e para comparação; eles funcionam principalmente como você já sabe.
 
 2 - Existem variantes compostas de operadores aritméticos que modificam suas variáveis ​​no local: +=, -=, e assim por diante.
 
 3 - Você pode usar if, elsee else ifpara executar o código com base no resultado de uma condição.
 
 4 - O Swift possui um operador ternário que combina uma verificação com blocos de código verdadeiro e falso. Embora você possa vê-lo em outro código, eu não recomendaria usá-lo você mesmo.
 
 5 - Se você tiver várias condições usando o mesmo valor, geralmente é mais fácil de usar switch.
 
 6 - Você pode fazer intervalos usando ..<e ...dependendo se o último número deve ser excluído ou incluído.
 */
