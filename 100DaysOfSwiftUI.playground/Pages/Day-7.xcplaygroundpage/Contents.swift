//: [Previous](@previous)

import Foundation

//Day 7 – functions, parameters, and return values

// As funções nos permitem agrupar pedaços de código para que possam ser usados ​​em vários lugares. Podemos enviar dados para funções para personalizar como elas funcionam e receber dados que nos informam o resultado que foi calculado.

// 1 - Como reutilizar código com funções

//As funções são apenas pedaços de código que você separou do resto do seu programa e recebeu um nome para que você possa consultá-los facilmente.
func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}
showWelcome()

let number = 139

if number.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}

let roll = Int.random(in: 1...20)
//random()é uma função e a (in: 1...20)parte marca as opções de configuração – sem isso não teríamos controle sobre o intervalo de nossos números aleatórios, o que seria significativamente menos útil.


//Podemos fazer nossas próprias funções que estão abertas para configuração, tudo colocando código extra entre parênteses quando criamos nossa função. Isso deve receber um único número inteiro, como 8, e calcular as tabelas de multiplicação para isso de 1 a 12.
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(number: 5)
//Observe como eu coloquei number: Intdentro dos parênteses? Isso é chamado de parâmetro e é nosso ponto de personalização. Estamos dizendo que quem chama essa função deve passar um número inteiro aqui, e o Swift irá aplicá-lo. Dentro da função, numberestá disponível para uso como qualquer outra constante, por isso aparece dentro da print()chamada.


//Essa nomeação de parâmetros torna-se ainda mais importante quando você tem vários parâmetros. Por exemplo, se quisermos personalizar o quão alto nossas tabuadas foram, podemos definir o final de nosso intervalo usando um segundo parâmetro, como este:
func printTimesTables2(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables2(number: 5, end: 20)


// 2 - Como retornar valores de funções

//A sqrt()função aceita um parâmetro, que é o número do qual queremos calcular a raiz quadrada, e irá em frente e fará o trabalho, então enviará de volta a raiz quadrada.
let root = sqrt(169)
print(root)

//Por exemplo, talvez você queira jogar um dado em várias partes do seu programa, mas em vez de sempre forçar o lançamento do dado a usar um dado de 6 lados, você pode fazer disso uma função:
func rollDice() -> Int {
    return Int.random(in: 1...6)
}
let result1 = rollDice()
print(result1)

//duas strings contêm as mesmas letras, independentemente de sua ordem? Esta função deve aceitar dois parâmetros de string e retornar true se suas letras forem iguais – portanto, “abc” e “cab” devem retornar true porque ambos contêm um “a”, um “b” e um “c”.
//sorted()qualquer string, receberá uma nova string de volta com todos os letras em ordem alfabética. Portanto, se você fizer isso para ambas as strings, poderá ==compará-las para ver se as letras são iguais.
func areLettersIdentical(string1: String, string2: String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    return first == second
}

//Esse código classifica ambos string1e string2, atribuindo seus valores classificados a novas constantes, firste second. No entanto, isso não é necessário - podemos pular essas constantes temporárias e apenas comparar os resultados sorted()diretamente, assim:
func areLettersIdentical2(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}

//Veja bem, nós dissemos ao Swift que esta função deve retornar um Booleano, e porque há apenas uma linha de código na função, o Swift sabe que é aquela que deve retornar dados. Por causa disso, quando uma função possui apenas uma linha de código, podemos remover a palavra- returnchave totalmente, assim:
func areLettersIdentical3(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

//Podemos voltar e fazer o mesmo para a rollDice()função também:
func rollDice2() -> Int {
    Int.random(in: 1...6)
}

// Você já aprendeu a usar sqrt(), então podemos construir uma pythagoras()função que aceita dois números decimais e retorna outro:
func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}
let c = pythagoras(a: 10, b: 5)
print(c)

//Essa função também pode ser reduzida a uma única linha e ter sua palavra- returnchave removida – experimente. Como sempre, mostrarei minha solução depois, mas é importante que você tente.
func pythagoras2(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}


//Tudo isso importa porque o Swift nos permite pular o uso da palavra- returnchave quando temos apenas uma expressão em nossa função. Então, essas duas funções fazem a mesma coisa:
func doMath() -> Int {
    return 5 + 5
}

func doMoreMath() -> Int {
    5 + 5
}

//o operador ternário também funciona aqui e, de fato, este é o principal caso de uso dele: quando você deseja ter uma única expressão, mas não deseja um if.
func greet(name: String) -> String {
    if name == "Taylor Swift" {
        return "Oh wow!"
    } else {
        return "Hello, \(name)"
    }
}

//Se quiséssemos remover as instruções de lá, nãoreturn poderíamos escrever isto:

func greet2(name: String) -> String {
    if name == "Taylor Swift" {
        "Oh wow!"
    } else {
        "Hello, \(name)"
    }
}
//Isso não é permitido, porque temos declarações reais lá - ife else.

//No entanto, poderíamos usar o operador ternário assim:
func greet3(name: String) -> String {
    name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
}

//Então, quando essa função é executada, ela efetivamente se resume a isso:
func greet4(name: String) -> String {
    "Oh wow!"
}



// 3 - Como retornar vários valores de funções

//Quando você deseja retornar um único valor de uma função, você escreve uma seta e um tipo de dados antes da chave de abertura da sua função, assim:
func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

//Se você deseja retornar dois ou mais valores de uma função, pode usar uma matriz. Por exemplo, aqui está um que envia de volta os detalhes de um usuário:
func getUser7() -> [String] {
    ["Taylor", "Swift"]
}

let user7 = getUser7()
print("Name: \(user7[0]) \(user7[1])")

//Poderíamos usar um dicionário, mas isso tem seus próprios problemas:
func getUser2() -> [String: String] {
    [
        "firstName": "Taylor",
        "lastName": "Swift"
    ]
}

let users = getUser2()
print("Name: \(users["firstName", default: "Anonymous"]) \(users["lastName", default: "Anonymous"])")


//as tuplas nos permitem colocar vários dados em uma única variável, mas, ao contrário dessas outras opções, as tuplas têm um tamanho fixo e podem ter uma variedade de tipos de dados.
//Veja como nossa função fica quando retorna uma tupla:
func getUser3() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}
let user2 = getUser3()
print("Name: \(user2.firstName) \(user2.lastName)")

//se você está retornando uma tupla de uma função, o Swift já sabe os nomes que você está dando a cada item na tupla, então você não precisa repeti-los ao usar return. Portanto, este código faz a mesma coisa que nossa tupla anterior:
func getUser() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

//às vezes você descobrirá que recebeu tuplas em que os elementos não têm nomes. Quando isso acontece você pode acessar os elementos da tupla usando índices numéricos começando em 0, assim:
func getUser6() -> (String, String) {
    ("Taylor", "Swift")
}

let user6 = getUser6()
print("Name: \(user6.0) \(user6.1)")


func getUser5() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}
let user5 = getUser5()
let firstName = user5.firstName
let lastName = user5.lastName

print("Name: \(firstName) \(lastName)")

//No entanto, em vez de atribuir a tupla a user, e copiar valores individuais de lá, podemos pular a primeira etapa – podemos separar o valor de retorno de getUser()em duas constantes separadas, assim:
let (firstName3, lastNam3) = getUser()
print("Name: \(firstName3) \(lastNam3)")



// 4 - Como personalizar rótulos de parâmetros

//poderíamos escrever uma função para rolar um dado um certo número de vezes, usando parâmetros para controlar o número de lados do dado e o número de jogadas:
func rollDice(sides: Int, count: Int) -> [Int] {
    // Start with an empty array
    var rolls = [Int]()

    // Roll as many dice as needed
    for _ in 1...count {
        // Add each result to our array
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }

    // Send back all the rolls
    return rolls
}

let rolls = rollDice(sides: 6, count: 4)

//Esse método de nomear parâmetros para uso externo é tão importante para o Swift que ele realmente usa os nomes quando se trata de descobrir qual método chamar
func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }

//Primeiro, pense na hasPrefix()função que você aprendeu anteriormente:
let lyric = "I see a red door and I want it painted black"
print(lyric.hasPrefix("I see"))


func isUppercase1(string: String) -> Bool {
    string == string.uppercased()
}

let strin = "HELLO, WORLD"
let result2 = isUppercase1(string: strin)


//Se adicionarmos um sublinhado antes do nome do parâmetro, podemos remover o rótulo do parâmetro externo da seguinte forma:
func isUppercases(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercases(string)


//Seria muito melhor assim:
//func printTimesTables(for: Int) {
//    for i in 1...12 {
//        print("\(i) x \(for) is \(i * for)")
//    }
//}
//printTimesTables(for: 5)

func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)
