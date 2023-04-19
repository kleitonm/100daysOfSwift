//: [Previous](@previous)

import Foundation

//Day - 14 - opcionais, coalescência nula e ponto de verificação 9

/*
 Referências nulas – literalmente quando uma variável não tem valor
 
 */


// 1 - Como lidar com dados ausentes com opcionais

// o Swift tem outra maneira importante de garantir a previsibilidade, chamadas opcionais

let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peach"]

/*
 A solução da Swift é chamada de opcionais , o que significa dados que podem estar presentes ou não.
 Os opcionais são como uma caixa que pode ou não ter algo dentro. Então, a String?significa que pode haver uma string esperando por nós, ou pode não haver nada – um valor especial chamado nil, que significa “sem valor”. Qualquer tipo de dado pode ser opcional, incluindo Int, Doublee Bool, bem como instâncias de enums, structs e classes.
 
 Bem, aqui está o argumento decisivo: Swift gosta que nosso código seja previsível, o que significa que não nos permite usar dados que podem não estar lá. No caso dos opcionais, isso significa que precisamos desembrulhar o opcional para usá-lo – precisamos olhar dentro da caixa para ver se há um valor e, se houver, retirá-lo e usá-lo.
 */

//formas principais de desempacotar opcionais
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is  \(marioOpposite)")
}

/*
 Essa if letsintaxe é muito comum no Swift e combina a criação de uma condição ( if) com a criação de uma constante ( let). Juntos, ele faz três coisas:

 1 - Ele lê o valor opcional do dicionário.
 2 - Se o opcional tiver uma string interna, ela será desempacotada – isso significa que a string interna será colocada na marioOppositeconstante.
 3 - A condição foi bem-sucedida – fomos capazes de desempacotar o opcional – então o corpo da condição é executado.
 */

//O corpo da condição só será executado se o opcional tiver um valor dentro. Claro, se você quiser adicionar um elsebloco
var username: String? = nil

if let unwrappdName = username {
    print("We got a user: \(unwrappdName)")
} else {
    print("The optional was empty")
}

//tentar passar um número inteiro opcional para uma função que requer um número inteiro não opcional, como este:
func square(number: Int) -> Int {
    number * number
}
var number: Int? = nil
//print(square(number: number))
//O Swift se recusará a construir esse código, porque o inteiro opcional precisa ser desempacotado – não podemos usar um valor opcional onde um não-opcional é necessário, porque se não houvesse nenhum valor dentro, teríamos um problema.

//Então, para usar o opcional devemos primeiro desempacotá -lo assim:
if let unrappedNumber = number {
    print(square(number: unrappedNumber))
}

//ao desempacotar opcionais, é muito comum desempacotá-los em uma constante de mesmo nome
if let number = number {
    print(square(number: number))
}

func getUsername() -> String? {
    "Taylor"
}
if let getUser = getUsername() {
    print("Username is \(getUser)")
} else {
    print("No username")
}

print("----------------------------------- // -------------------------------")

// 2 - Como desembrulhar opcionais com guarda

/*
 Você já viu como o Swift usa if letpara desempacotar opcionais, e é a forma mais comum de usar opcionais. Mas existe uma segunda maneira que faz quase a mesma coisa, e é quase tão comum: guard let.
 */

// Se parece com isso:
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    print("\(number) x \(number) is \(number * number)")
}

//Como if let, guard letverifica se existe um valor dentro de um opcional, e se houver ele irá recuperar o valor e colocá-lo em uma constante de nossa escolha.

var myVar: Int? = 3

if let unwrapped = myVar {
    print("Run if myVar has a value inside")
}

//guard let unwrapped = myVar else {
//    print("Run if myVar doesn't have a value inside")
//}
/*
 Portanto, if letexecuta o código entre chaves se o opcional tiver um valor e guard letexecuta o código entre chaves se o opcional não tiver um valor. Isso explica o uso de elseno código: “verifique se podemos desempacotar o opcional, mas se não pudermos…”
 */

/*
 1 - Se você usar guardpara verificar se as entradas de uma função são válidas, o Swift sempre exigirá que você use returnse a verificação falhar.
 2 - Se a verificação for aprovada e o opcional que você está desempacotando tiver um valor dentro, você poderá usá-lo após a guardconclusão do código.
 */

//dois pontos em ação se observar a printSquare2():
func printSquare2(of number: Int?) {
    guard let number = number  else{
        print("Missing input")
        
        //// 1: We *must* exit the function here
        return
    }
    // 2: `number` is still available outside of `guard`
      print("\(number) x \(number) is \(number * number)")}

/*
 Portanto: use if letpara desembrulhar os opcionais para que você possa processá-los de alguma forma e use guard letpara garantir que os opcionais tenham algo dentro deles e saiam caso contrário.

 Dica: Você pode usar guarda com qualquer condição, incluindo aquelas que não desembrulham opcionais. Por exemplo, você pode usar guard someArray.isEmpty else { return }.
 */

//guardlet foi projetado para sair da função, loop ou condição atual se a verificação falhar, portanto, quaisquer valores que você desempacotar usando-o permanecerão depois da verificação.

//Para demonstrar a diferença, aqui está uma função que retorna o significado da vida como um número inteiro opcional:
func getMeaningOfLife() -> Int? {
    42
}

//E aqui está essa função sendo usada dentro de outra função, chamada printMeaningOfLife():
func printMeaningOfLife() {
    if let name = getMeaningOfLife() {
        print(name)
    }
}
/*
 Isso usa if let, para que o resultado de getMeaningOfLife()seja impresso apenas se retornar um número inteiro em vez de nil.

 Se tivéssemos escrito isso usando guardlet, ficaria assim:
 */
func printMeaningOfLife2() {
    guard let name = getMeaningOfLife() else {
        return
    }
    print(name)
}

print("----------------------------------- // -------------------------------")

// 3 - Como desembrulhar opcionais com coalescência nula

/*
 Espere… Swift tem uma terceira maneira de desembrulhar opcionais? Sim! E é muito útil também: é chamado de operador de coalescência nil e nos permite desempacotar um opcional e fornecer um valor padrão se o opcional estiver vazio.
 */
//Vamos retroceder um pouco:
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"]

//Com o operador de coalescência nil, escrito ??, podemos fornecer um valor padrão para qualquer opcional, como este:
let new2 = captains["Senery"] ?? "N/A"
//Isso lerá o valor do captainsdicionário e tentará desempacotá-lo. Se o opcional tiver um valor dentro, ele será enviado de volta e armazenado em new2, mas se não tiver, "N/A" será usado.

//não podemos simplesmente especificar um valor padrão ao ler no dicionário? Se você está pensando que está absolutamente correto:
let new3 = captains["Senerity", default: "N/A"]

//o operador nil coalescenting não apenas funciona com dicionários, mas também com quaisquer opcionais

//podemos usar a coalescência nil para fornecer um padrão:
let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite =  tvShows.randomElement() ?? "None"

//Ou talvez você tenha uma estrutura com uma propriedade opcional e queira fornecer um padrão sensato para quando ela estiver ausente:
struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Red Password", author: nil)
let author = book.author ?? "Anonymous"
print(author)

//Aqui podemos usar coalescência nil para fornecer um valor padrão, como este:
let input = ""
let numberOne = Int(input) ?? 0
print(number)

//Por exemplo, se você estiver trabalhando em um aplicativo de bate-papo e quiser carregar qualquer rascunho de mensagem que o usuário tenha salvo, poderá escrever um código como este:
//let saveData = loadSavedMessage() ?? ""

//a leitura de uma chave de dicionário sempre retornará um opcional, portanto, você pode usar a união nil aqui para garantir que receberá um não opcional:
let scores = ["Picard": 800, "Data": 7000, "Troi": 900]
let crusherScore = scores["Crusher"] ?? 0

//os dicionários oferecem uma abordagem um pouco diferente que nos permite especificar o valor padrão para quando a chave não for encontrada:
let crusherScore2 = scores["Crusher", default: 0]

print("----------------------------------- // -------------------------------")

// 4 - Como lidar com vários opcionais usando encadeamento opcional

/*
 O encadeamento opcional é uma sintaxe simplificada para leitura de opcionais dentro de opcionais. Isso pode soar como algo que você gostaria de usar raramente, mas se eu mostrar um exemplo, você verá por que é útil.
 */

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

/*
 A mágica do encadeamento opcional é que ele silenciosamente não faz nada se o opcional estiver vazio – ele apenas enviará de volta o mesmo opcional que você tinha antes, ainda vazio. Isso significa que o valor de retorno de uma cadeia opcional é sempre opcional, e é por isso que ainda precisamos de coalescência nil para fornecer um valor padrão.
 */

struct Books {
    let title: String
    let author: String?
}

var books: Books? = nil
let authors = books?.author?.first?.uppercased() ?? "A"
print(authors)
//Então, lê-se “se tivermos um livro, e o livro tiver um autor, e o autor tiver uma primeira letra, coloque-a em maiúscula e envie-a de volta, caso contrário, envie de volta A”.

/*
 O encadeamento opcional do Swift nos permite vasculhar várias camadas de opcionais em uma única linha de código e, se qualquer uma dessas camadas for nula, a linha inteira se tornará nula.
 */

print("----------------------------------- // -------------------------------")

// 5 - Como lidar com falha de função com opcionais

/*
 Quando chamamos uma função que pode gerar erros, nós a chamamos usando trye tratamos os erros apropriadamente ou, se tivermos certeza de que a função não falhará, usaremos try!e aceitaremos que, se estivermos errados, nosso código falhará. (Spoiler: você deve usar try!muito raramente.)
 
 No entanto, há uma alternativa: se tudo o que importa é se a função foi bem-sucedida ou falhou, podemos usar um try opcional para que a função retorne um valor opcional. Se a função foi executada sem lançar nenhum erro, o opcional conterá o valor de retorno, mas se algum erro for lançado, a função retornará nil. Isso significa que não sabemos exatamente qual erro foi lançado, mas geralmente tudo bem - podemos apenas nos importar se a função funcionou ou não.
 */

enum NetworkError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw NetworkError.networkFailed
}

if let user = try? getUser(id: 30) {
    print("User: \(user)")
}
/*
 A getUser()função sempre lançará um networkFailederro, o que é bom para nossos propósitos de teste, mas na verdade não nos importamos com qual erro foi lançado – tudo o que importa é se a chamada devolveu um usuário ou não.

 É aqui que try?ajuda: retorna getUser()uma string opcional, que será nula se algum erro for lançado. Se você quiser saber exatamente qual erro aconteceu, essa abordagem não será útil, mas na maioria das vezes simplesmente não nos importamos.
 */

//Tenha cuidado, porém: você precisa adicionar alguns parênteses antes da união nula para que o Swift entenda exatamente o que você quer dizer. Por exemplo, você escreveria isto:
let users = (try? getUser(id: 28)) ?? "Anonymous"
print(users)

/*
 Você descobrirá try?que é usado principalmente em três lugares:

 1 - Em combinação com guard letpara sair da função atual se a try?chamada retornar nil.
 2 - Em combinação com coalescência nula para tentar algo ou fornecer um valor padrão em caso de falha.
 3 - Ao chamar qualquer função de lançamento sem um valor de retorno, quando você realmente não se importa se foi bem-sucedida ou não - talvez você esteja gravando em um arquivo de log ou enviando análises para um servidor, por exemplo.
 */

/*
 Quando você deve usar try opcional?
 
 Podemos executar funções de lançamento usando do, trye catchno Swift, mas uma alternativa é usar try?para converter uma chamada de função de lançamento em opcional. Se a função for bem-sucedida, seu valor de retorno será um opcional contendo tudo o que você normalmente receberia de volta e, se falhar, o valor de retorno será um opcional definido como nil.
 
 Se você deseja executar uma função e se preocupa apenas com o sucesso ou falha - você não precisa distinguir entre os vários motivos pelos quais ela pode falhar - então usar try opcional é uma ótima opção, porque você pode resumir tudo para "funcionou?"
 */

//Então, ao invés de escrever isso:
func runRiskyFunction(){
    print("Bad Network")
}

do {
    let result = try runRiskyFunction()
    print(result)
} catch {
    // it failed!
}

//Você pode, em vez disso, escrever isto:
if let result = try? runRiskyFunction() {
    print(result)
}

// 6 - Resumo: Opcionais

/*
 recapitular o que aprendemos:

 - Os opcionais nos permitem representar a ausência de dados, o que significa que podemos dizer “este inteiro não tem valor” – isso é diferente de um número fixo como 0.
 - Como resultado, tudo o que não é opcional definitivamente tem um valor dentro, mesmo que seja apenas uma string vazia.
 - Desembrulhar um opcional é o processo de olhar dentro de uma caixa para ver o que ela contém: se houver um valor dentro, ele é enviado de volta para uso, caso contrário, haverá nildentro.
 - Podemos usar if letpara executar algum código se o opcional tiver um valor, ou guard letpara executar algum código se o opcional não tiver um valor – mas com guardsempre devemos sair da função depois.
 - O operador de coalescência nil, ??, desdobra e retorna um valor opcional ou usa um valor padrão.
 - O encadeamento opcional nos permite ler um opcional dentro de outro opcional com uma sintaxe conveniente.
 - Se uma função pode gerar erros, você pode convertê-la em um using opcional try?– você receberá o valor de retorno da função ou nilse um erro for gerado.
 */
