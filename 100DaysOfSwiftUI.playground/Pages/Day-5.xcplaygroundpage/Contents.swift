//: [Previous](@previous)
// Day 5 – if, switch, and the ternary operator
import Foundation

var someCodition = "Do somenthing"
if someCodition  == "Do Somenthing" {
    print("Do something")
    print("Do something else")
    print("Do a third thing")
}

let score = 80
if score > 80 {
    print("Grrat Jobs")
}

let speed = 100
let percentage = 80
let age = 20

if speed >= 100 {
    print("Where we're going we don't need roads.")
}
if percentage < 80 {
    print("Sorry, you failed the test.")
}
if age >= 20 {
    print("You're eligible to vote")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"
if ourName < friendName {
    print("It`s \(ourName) vs \(friendName)")
}
if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

// Make an array of 3 numbers
var numbers = [1, 2, 3]

// Add a 4th
numbers.append(4)

// If we have over 3 items
if numbers.count > 3 {
    // Remove the oldest number
    numbers.remove(at: 0)
}

// Display the result
print(numbers)

// == significa “é igual a”, que é usado assim
let country = "Canada"
if country == "Australia" {
    print("G'day!")
}

// != que significa “não é igual a”, e é usada assim:
let name = "Taylor Swift"

if name != "Anonymous" {
    print("Welcome, \(name)")
}

// queremos verificar se o nome de usuário digitado pelo usuário está vazio, o que poderíamos fazer assim:
// Create the username variable
var username = "taylorswift13"

// If `username` contains an empty string
if username == "" {
    // Make it equal to "Anonymous"
    username = "Anonymous"
}

// Now print a welcome message
print("Welcome, \(username)!")

// poderíamos comparar o countda string – quantas letras ela tem – contra 0, assim:
if username.count == 0 {
    username = "Anonymous"
}

// enviará de volta truese o que você está verificando não tiver nada dentro e podemos usá-lo para corrigir nossa condição assim:
if username.isEmpty == true {
    username = "Anonymous"
}

// No nosso caso, username.isEmptyjá é um Boolean, ou seja, será true ou false, então podemos deixar nosso código ainda mais simples:
if username.isEmpty {
    username = "Anonymous"
}

// verificar uma variedade de valores para igualdade e comparação
let firstName = "Paul"
let secondName = "Sophie"

let firstAge = 40
let secondAge = 10
//Então poderíamos compará-los de várias maneiras:
print(firstName == secondName)
print(firstName != secondName)
print(firstName < secondName)
print(firstName >= secondName)

print(firstAge == secondAge)
print(firstAge != secondAge)
print(firstAge < secondAge)
print(firstAge >= secondAge)

// Podemos até pedir ao Swift para tornar nossos enums comparáveis, assim:
enum Size: Comparable { // COmparable serve para comparar elementos
    case small
    case medium
    case large
}

let first = Size.small
let second = Size.medium
print(first < second)


// Como verificar várias condições

// Como verificar várias condições
let age1 = 16

if age1 >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}

// Existe uma condição ainda mais avançada chamada else if, que permite executar uma nova verificação se a primeira falhar
let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

// Por exemplo, podemos dizer “se a temperatura de hoje for superior a 20 graus Celsius, mas inferior a 30, imprima uma mensagem”.
let temp = 25

if temp > 20 {
    if temp < 30 {
        print("It's a nice day.")
    }
}

// o Swift fornece uma alternativa mais curta: podemos usar &&para combinar duas condições, e toda a condição só será verdadeira se as duas partes dentro da condição forem verdadeiras.
if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

// Por exemplo, poderíamos dizer que um usuário pode comprar um jogo se tiver pelo menos 18 anos ou, se tiver menos de 18 anos, deve ter permissão de um dos pais. Poderíamos escrever isso usando ||assim:
let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent == true {
    print("You can buy the game")
}

// Neste exemplo vamos criar um enum chamado TransportOption, que contém cinco casos: avião, helicóptero, bicicleta, carro e patinete. Em seguida, atribuiremos um valor de exemplo a uma constante e executaremos algumas verificações:
enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path…")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}

// 3 - Como usar instruções switch para verificar várias condições

//  Por exemplo, se tivéssemos uma previsão do tempo de um enum, poderíamos escolher qual mensagem imprimir com base em uma série de condições, como esta:

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

if forecast == .sun {
    print("It should be a nice day.")
} else if forecast == .rain {
    print("Pack an umbrella.")
} else if forecast == .wind {
    print("Wear something warm")
} else if forecast == .snow {
    print("School is cancelled.")
} else {
    print("Our forecast generator is broken!")
}

//  podemos substituir todos aqueles ife else ifverificações por isto:
switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}

// poderíamos alternar uma string contendo um nome de lugar:

let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}

// e você deseja explicitamente que o Swift continue executando casos subsequentes, use fallthrough. Isso não é comumente usado, mas às vezes – apenas às vezes – pode ajudar a evitar a repetição do trabalho.
let day1 = 5
print("My true love gave to me…")

switch day1 {
case 5:
    print("5 golden rings")
case 4:
    print("4 calling birds")
case 3:
    print("3 French hens")
case 2:
    print("2 turtle doves")
default:
    print("A partridge in a pear tree")
}
//Isso imprimirá “5 anéis de ouro”, o que não está certo. No dia 1 deve ser impresso apenas “Uma perdiz em uma pereira”, no dia 2 deve ser “2 rolas” depois “Uma perdiz em uma pereira”, no dia 3 deve ser “3 galinhas francesas”, “ 2 rolas”, e… bem, essa é a ideia.

//Podemos usar fallthroughpara obter exatamente esse comportamento:

let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

// 4 - Como usar o operador condicional ternário para testes rápidos

// Por exemplo, poderíamos criar uma constante chamada ageque armazena a idade de alguém e, em seguida, criar uma segunda constante chamada canVoteque armazenará se essa pessoa pode votar ou não:
let ageTwo = 18
let canVote = ageTwo >= 18 ? "Yes" : "No"

//Como você pode ver, o operador ternário é dividido em três partes: uma verificação ( age >= 18), algo para quando a condição for verdadeira (“Sim”) e algo para quando a condição for falsa (“Não”). Isso o torna exatamente como um regular ife um elsebloco, na mesma ordem.

//Vejamos alguns outros exemplos, comece com um fácil que leia uma hora no formato de 24 horas e imprima uma das duas mensagens:
let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

// Ou aqui está um que lê o countde uma matriz como parte de sua condição e, em seguida, envia de volta uma das duas strings:
let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

// Fica um pouco difícil de ler quando sua condição é usada ==para verificar a igualdade, como você pode ver aqui:
enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)

/*A = theme ==parte geralmente é a parte que as pessoas acham difícil de ler, mas lembre-se de dividi-la:

Que?theme == .dark
Verdadeiro Preto"
Falso: “branco”
Portanto, se o tema for igual a .darkretornar “Black”, caso contrário, retorne “White”, atribua isso a background.*/

//O operador ternário nos permite escolher um dos dois resultados com base em uma condição, e o faz de forma bastante concisa:
let isAuthenticated = true
print(isAuthenticated ? "Welcome!" : "Who are you?")


