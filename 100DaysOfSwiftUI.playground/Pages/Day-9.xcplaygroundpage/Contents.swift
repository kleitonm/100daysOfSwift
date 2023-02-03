//: [Previous](@previous)

import Foundation

//Day 9 – closures, passing functions into functions, and checkpoint 5

/*
 Closures - que são um pouco como funções anônimas – funções que podemos criar e atribuir diretamente a uma variável ou passar para outras funções para personalizar como elas funcionam. Sim, você leu certo: passar uma função para outra como parâmetro.
 - Os Closures nos permitem agrupar algumas funcionalidades em uma única variável e, em seguida, armazená-la em algum lugar. Também podemos retorná-lo de uma função e armazenar o fechamento em outro lugar.
 */


// 1 - Como criar e usar encerramentos
/*
 As funções são coisas poderosas no Swift. Sim, você viu como pode chamá-los, passar valores e retornar dados, mas também pode atribuí-los a variáveis, passar funções para funções e até retornar funções de funções.
 */
func excellentUser() {
    print("Good luck")
}
excellentUser()

var otherUser = excellentUser
otherUser()

/*
 Importante: Ao copiar uma função, você não escreve os parênteses depois dela – é var greetCopy = greetUsere não é var greetCopy = greetUser(). Se você colocar os parênteses lá, estará chamando a função e atribuindo seu valor de retorno a outra coisa.
 */

//Mas e se você quiser pular a criação de uma função separada e apenas atribuir a funcionalidade diretamente a uma constante ou variável? Bem, acontece que você também pode fazer isso:
let sayHi = {
    print("Hi, How are you?")
}
sayHi()
/*
 closure é uma maneira elegante de dizer que acabamos de criar um encerramento – um pedaço de código que podemos passar e chamar sempre que quisermos. Este não tem nome, mas é efetivamente uma função que não recebe parâmetros e não retorna um valor.
 */

// passando paramentro em uma Closure
let sayYee = { (name: String) -> String in
    "Yee \(name)!"
}
sayYee("Yee")
/*
 in é usado para marcar o fim dos parâmetros e tipo de retorno – tudo depois disso é o corpo da própria closure
 */

//Voidsignifica “nada” – esta função não retorna nada. Às vezes, você pode ver isso escrito como (), mas geralmente evitamos isso porque pode ser confundido com a lista de parâmetros vazia.

//O tipo de cada função depende dos dados que recebe e envia de volta. Isso pode parecer simples, mas esconde um problema importante: os nomes dos dados que recebe não fazem parte do tipo da função.
func getUserData(for id: Int) -> String {
    if id == 1987 {
        return "The best"
    } else {
        return "Anonymous"
    }
}
let data: (Int) -> String = getUserData
let user = data(1987)
print(user)

//sorted()com um array para ordenar seus elementos
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

//deixar o nome da capitã sempre em primeiro
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}
//pode ser passada uma função para criar uma ordem de classificação personalizada e, desde que essa função a) aceite duas strings eb) retorne um booleano, sorted()pode usá-la.
//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)

let captainFirstTeam = team.sorted(by: { (nameOne: String, nameTwo: String) -> Bool in
    if nameOne == "Suzanne" {
        return true
    } else if nameTwo == "Suzanne" {
        return false
    }
    return nameOne < nameTwo
})
//Em vez de passar uma função, estamos passando um fechamento – tudo, desde a chave de abertura by:até a chave de fechamento na última linha, faz parte do fechamento.

//Aqui está uma função que aceita uma string e um inteiro:
func pay(user: String, amount: Int) {
    // code
}
//E aqui está exatamente a mesma coisa escrita como encerramento:
let payment = { (user: String, amount: Int) in
    // code
}

//aqui está um encerramento que aceita um parâmetro e não retorna nada:
let payment2 = { (user: String) in
    print("Paying \(user)…")
}

//aqui está um fechamento que aceita um parâmetro e retorna um booleano:
let payment3 = { (user: String) -> Bool in
    print("Paying \(user)…")
    return true
}

// 2 - Como usar fechamentos à direita e sintaxe abreviada

//Não precisamos especificar os tipos de nossos dois parâmetros porque eles devem ser strings e não precisamos especificar um tipo de retorno porque deve ser um booleano. Então, podemos reescrever o código para isso:
//let captainFirstTeam = team.sorted(by: { name1, name2 in

// contamos com valores especialmente nomeados que o Swift fornece para nós: $0e $1, para a primeira e a segunda strings, respectivamente.
let captainFirstTea2m = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}

//se quiséssemos apenas fazer uma classificação reversa - eu usaria:
let reverseTeam = team.sorted {
    return $0 > $1
}

//remover o return
let reserveTeam2 = team.sorted { $0 > $1 }

//a filter()função nos permite executar algum código em cada item do array e enviará de volta um novo array contendo cada item que retornar true para a função poderíamos encontrar todos os jogadores da equipe cujo nome começa com T assim:
let nameWithT = team.filter { $0.hasPrefix("T")}
print(nameWithT)

//Em segundo lugar, a map()função nos permite transformar cada item no array usando algum código de nossa escolha e envia de volta um novo array de todos os itens transformados:
let uppercaseTeam = team.map { $0.uppercased()}
print(uppercaseTeam)


//Dica: Ao trabalhar com map(), o tipo retornado não precisa ser igual ao tipo com o qual você começou – você pode converter um array de inteiros em um array de strings

//Aqui está uma função que aceita um Double closure cheio de alterações a serem feitas:
func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation…")
    animations()
}

//Podemos chamar essa função sem um Trailing closures como este:
animate(duration: 3, animations: {
    print("Fade out the image")
})

//Os Trailing closures nos permitem limpar isso, ao mesmo tempo em que removemos o animationsrótulo do parâmetro. Essa mesma chamada de função se torna isso:
animate(duration: 3) {
    print("Fade out the image")
}

//shorthand parameter names
/*
 Ao trabalhar com closure, o Swift nos fornece uma sintaxe de parâmetro abreviada especial que torna extremamente conciso escrever encerramentos. Essa sintaxe numera automaticamente os nomes dos parâmetros como $0, $1, $2e assim por diante – não podemos usar nomes como esses em nosso próprio código, portanto, quando você os vê, fica imediatamente claro que são sintaxes abreviadas para encerramentos.
 */



// 3 - Como aceitar funções como parâmetros

//Aqui está uma função que gera uma matriz de números inteiros repetindo uma função um certo número de vezes:
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}
//O segundo parâmetro é uma função chamada generator, que não aceita parâmetros e retorna um número inteiro.


//O resultado é que agora podemos fazer arrays inteiros de tamanho arbitrário, passando uma função que deve ser usada para gerar cada número:
let rolls = makeArray(size: 50) {
Int.random(in: 1...20)
}
print(rolls)

//essa mesma funcionalidade também funciona com funções dedicadas, então poderíamos escrever algo assim:
func generateNumber() -> Int {
    Int.random(in: 1...20)
}
let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

// função que aceita três parâmetros de função, cada um dos quais não aceita nenhum parâmetro e não retorna nada:
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

//como isso parece:
doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

// 4 - Resumo: Fechamentos

/*
 - Você pode copiar funções no Swift e elas funcionam da mesma forma que o original, exceto que perdem seus nomes de parâmetros externos.
 - Todas as funções têm tipos, assim como outros tipos de dados. Isso inclui os parâmetros que eles recebem junto com seu tipo de retorno, que pode ser Void– também conhecido como “nada”.
 - Você pode criar fechamentos diretamente atribuindo a uma constante ou variável.
 - Closures que aceitam parâmetros ou retornam um valor devem declarar isso entre chaves, seguido da palavra-chave in.
 - Funções são capazes de aceitar outras funções como parâmetros. Eles devem declarar antecipadamente quais dados essas funções devem usar, e o Swift garantirá que as regras sejam seguidas.
 - Nesta situação, em vez de passar uma função dedicada, você também pode passar um encerramento – você pode fazer um diretamente. O Swift permite que ambas as abordagens funcionem.
 - Ao passar um encerramento como um parâmetro de função, você não precisa escrever explicitamente os tipos dentro do seu encerramento se o Swift puder descobrir isso automaticamente. O mesmo vale para o valor de retorno – se o Swift puder descobrir, você não precisa especificá-lo.
 - Se um ou mais parâmetros finais de uma função forem funções, você poderá usar a sintaxe de fechamento à direita.
 - Você também pode usar nomes de parâmetros abreviados, como $0e $1, mas eu recomendaria fazer isso apenas sob algumas condições.
 - Você pode criar suas próprias funções que aceitam funções como parâmetros, embora na prática seja muito mais importante saber como usá -las do que como criá -las.
 */


// 5 - Ponto de verificação 5

//já conheceu sorted(), filter(), map(), então eu gostaria que você os colocasse juntos em uma cadeia – chame um, depois o outro, depois o outro consecutivamente sem usar variáveis ​​temporárias.

//entrada é esta:
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

/*
 Seu trabalho é:

 Filtre quaisquer números que sejam pares
 Classifique a matriz em ordem crescente
 Mapeie-os para strings no formato “7 é um número da sorte”
 Imprima a matriz resultante, um item por linha
 */

//Portanto, sua saída deve ser a seguinte:
//7 is a lucky number
//15 is a lucky number
//21 is a lucky number
//31 is a lucky number
//33 is a lucky number
//49 is a lucky number

/*
 aqui vão algumas dicas:

Você precisa usar as funções filter(), sorted()e map().
A ordem em que você executa as funções é importante - se você converter a matriz em uma string primeiro, sorted()fará uma classificação de string em vez de uma classificação de número inteiro. Isso significa que 15 virá antes de 7, porque Swift irá comparar o “1” em “15” contra “7”.
Para encadear essas funções, use luckyNumbers.first { }.second { }, obviamente colocando as chamadas de funções reais lá.
Você deve usar isMultiple(of:)para remover números pares.
 */
