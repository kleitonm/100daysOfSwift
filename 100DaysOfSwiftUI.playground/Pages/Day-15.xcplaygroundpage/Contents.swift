//: [Previous](@previous)

import Foundation
/*
 Dia 15: Consolidação I
 Você acabou de aprender muito sobre Swift em apenas 14 dias, então, antes de continuarmos, é importante que você reflita sobre o que aprendeu.
 */

// Day 15 – Swift review

// variaveis e constantes
// variaves podem ser alteradas
var name = "Renata"
name = "Roberta"

let names = "Bob"
print(names) // use o print para saber o que tem dentro da cariavel ou constante

print("----------------------------------- // -------------------------------")

//Strings - é colocado entrte aspas duplas
var actor = "Tom"

var limite = "O seu limite \"Pode estar\" comprometidos por outras compras"

// quando quiser uma string com diversas linhas é só usar 3 aspas
var movie = """
The last of Us
Fast in Furios
The king of American
"""

print(actor.count) //ele ira1 contar o número de letras da String

print(limite.hasPrefix("O")) // verifica se a string começa com a subString, e diferencia maisculo de minisculo
print(limite.hasSuffix("Compras")) // verifica se a string termina com a subString

print("----------------------------------- // -------------------------------")

// Numeros inteiros
var score = 10
var hightScrote = score + 2
var halvedScore = score / 2

var counter = 10
counter += 5

let numbers = 120
print(numbers.isMultiple(of: 2))

let id =  Int.random(in: 1...100) // escolhe um número aleatório, podende ser 1 ou 100, ou qualquer outro.


print("----------------------------------- // -------------------------------")

// Double: tem um número depois da vírgula, e ele é difernete do int

var nota = 9.5

print("----------------------------------- // -------------------------------")

// Bool: é usado quando uma varia1vel é verdadeira ou falsa

var goodDog = false
var badDog = true
var isSaved = false
isSaved.toggle() // toggle ele inverte se a variavel é verdadeira ela se tornara1 falsa

print("----------------------------------- // -------------------------------")

// Constante e Variaves, fazendo a interpolação

var firstName = "Lebron"
var lastname = "James"
var age = 38
var message = "My name is \(firstName), My last name is: \(lastname), and my age is: \(age)"
print(message)

print("----------------------------------- // -------------------------------")

// Agrupar item de uma matriz ou Arrays

var colors = ["Red", "Black", "Yellow"]
var media = [4.5, 8.8, 9.0, 10.0]
var numerical = [10, 20, 30, 40, 50]

print(colors[2])
print(media[3])

colors.append("Green") // append adiciona um item no seu array
colors.remove(at: 0) // remove um item do seu array
print(colors.count)

print(colors.contains("Black")) // verifica se o item consta no seu array


print("----------------------------------- // -------------------------------")

// Dicionarys: usa chave e valor
let employee = [
    "name": "Smith",
    "jobs": "Actor and Singler"
]
print(employee["jobs", default: "Unknown"]) //  caso ele não encontre o valor de Jobs ele retorna Unknown

print("----------------------------------- // -------------------------------")

// SETs - são parecidos com o Array, porém não podem conter itens repeditos, e não tem um ordem definida.
var otherNumbers = Set([2, 2, 4, 4, 10, 10, 30, 20, 40, 80, 80])
print(otherNumbers)

otherNumbers.insert(6) // insert insere um número no Set
otherNumbers.contains(10) // Verifica se há o número 10, a verificar do SET é mais rtápida do que de um Array

print("----------------------------------- // -------------------------------")

// Enum - É um conjunto de valores nomeados que podem ser usados para tornar nosso código mais segurto e eficiente

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.thursday
day = .wednesday

print("----------------------------------- // -------------------------------")

// variaveis ou constantes explicidas
var otherScrore: Double = 0.0

let player: String = "Hey"
let luckyName: Int = 20
let pi: Double = 3.1416
var isEnable: Bool = true

var albuns: [String] = ["My day", "Day after"]
var user: [String: String] = ["Robert": "@robert_"]
var books: Set<String> = Set(["The Blue Ocean", "SwiftUI"])

var teams: [String] = [String]()
var clubs = [String]()

enum UIStyle {
    case light, dark, system
}
var styke: UIStyle = .light

print("----------------------------------- // -------------------------------")

// If, Else if e Else, para verificar uma variedade de condições
let voteAge = 15

if voteAge < 14 {
    print("You can`t vote")
} else if voteAge < 18 {
    print("You can vote soon")
} else {
    print("You can vote now")
}

let driveAge = 14

if driveAge < 14 && driveAge < 18 {
    print("You can`t drive")
}


print("----------------------------------- // -------------------------------")

// Switch

enum Weather {
    case sun, rain, wind
}
var forest = Weather.sun

switch forest {
case .sun:
    print("A nice day")
case .rain:
    print("A bad day")
case .wind:
    print("A so so day")
default :
    print("A normal day")
}


print("----------------------------------- // -------------------------------")

// Operador ternário
var otherVoteAge = 20
var canVote = otherVoteAge >= 20 ? "yes" : "No" // se a idade na2o for igual ou maior que 20, ele será "No"
print(canVote)


print("----------------------------------- // -------------------------------")

// For - executa algum código de uma vez para cada item do array ou dicionario
let plataforms = ["iOS", "MacOs", "WatchOs", "tvOS"]

for os in plataforms {
    print("Swift works on \(os)")
}

for i in 1...12 {
    print("5 x \(i) = \(5 * i)")
}

var lyric = "Haters Gonna"
for _ in 1...5 {
    lyric += "hate"
}
print(lyric)

var countable = 20

while countable > 0 {
    print("\(countable)...")
}
print("Go!")

let files = ["me.jpeg", "work.pdf", "movie.mp4"]

for file in files {
    if file.hasSuffix("mp4") == false {
        continue // ele irá continuar para o próximo arquivo
    }
    print("Found Picture :\(file)")
}

print("----------------------------------- // -------------------------------")

// Funcões com paramentros
func printTimesTable(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) = \(i * number)")
    }
}
printTimesTable(number: 6)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}
let result = rollDice()
print(result)

print("----------------------------------- // -------------------------------")

// Tuplas - armazena um número fixo de itens de tipos especificos
func getUser() -> (firstName: String, lastname: String) {
    (firstName: "Michael", lastname: "Jordan")
}
let nameUser = getUser()
print("Name: \(nameUser.firstName) \(nameUser.lastname)")

//let (firstName, _) = getUser()
//print("Name: \(firstName)")

print("----------------------------------- // -------------------------------")

// Funcóes - quando na2o quiser passar um nome para um paramentro de uma funça2o vc pode colocar o _ underline.

func isUpercase(_ string: String) -> Bool {
    string == string.uppercased()
}
let string = "HELLO WORD"
let resultOne = isUpercase(string)

func printTimesTable(for number: Int) { // for é utilizado externamente um número é usado internamente, for vem primeiro e o number vem em segundo
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTable(for: 5)

print("----------------------------------- // -------------------------------")

// Podemos atribuir valores aos parametros

func green(_ person: String, formal: Bool = false) { // Fora da func podemos chamar com ou sem o formal.
    if formal {
        print("Welcome \(formal)")
    } else {
        print("Hi \(formal)")
    }
}
green("Lebron", formal: true)
green("Taylor")

print("----------------------------------- // -------------------------------")

/*
 Erros - lidar com erros em uma função você precisa:
 1 - definir os tipos de erros que podem ocorrer;
 2 - escrever uma função que lance um ou mais desses erros;
 3 - chamar essa função e lidar com esses erros apropriadamente
 */
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "123456" {
        throw PasswordError.obvious
    }
    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}

do {
    let resultError = try checkPassword("123456")
    print("Rating: \(resultError)")
} catch PasswordError.obvious {
    print("I have the same comination on my  luggage!")
} catch {
    print("There was error.")
}
// erros tem sempre que ter um resumo genérico final , um que detecte qualquer tipo de erro

print("----------------------------------- // -------------------------------")

// Closures - é um pedaço de código que podemos passe e chamar sempre que quisermos. Pode ser chamado igual uma função. Você também pode adicionar parametros dentro das chaves.
// Tudo depois do in é o corpo do nosso próprio fechamento, o código da função que queremos executar.
var sayHello = { (name: String) -> String in
    "Hi \(name)"
}

var teamName = ["Suzam", "Her", "Tasha", "Tiffany", "Thuder"]

let onlyT = teamName.filter({ (name: String) -> Bool in
    return name.hasPrefix("T") // será retornado somente os nomes que começam com a letra T
})
print(onlyT)

print("----------------------------------- // -------------------------------")

// Exemplos de deixar a closure mais fácil de entender:
    //1 - A palavra return não é obrigatório.
    // 2 - Pegar um item do Array uma String e retornar true ou false
    // 3 - fornecer nomes de parametros curtos $0, $1, $2. Tudo se encaixa em uma única linha de código.

var teamNameOther = ["Suzam", "Her", "Tasha", "Tiffany", "Thuder"]

let onlyTT = teamNameOther.filter{ $0.hasPrefix("T")}
print(onlyTT)


print("----------------------------------- // -------------------------------")

// Struct - tipo de dados personalizados completos, com propriedades e métodos
// Mutating - se quiser que um me1todo de uma Struct altere uma de suas propriedades, vc usa o mutanting anes da função.
struct Album {
    var title: String
    var artist: String
    var isRealised = true
    
    func printSummary() {
        print("\(title) by \(artist)")
    }
    
    mutating func removeFromSale() {
        isRealised = false
    }
}
let red = Album(title: "Red", artist: "Red Ballon")
print(red.title)
print(red.artist)
red.printSummary()

print("----------------------------------- // -------------------------------")

// Uma propriedade computada, calcula seu valor, toda vez que é acessada.
struct Employee {
    let name: String
    var vacationAllowed = 15
    var vacationTaken = 0
    
//    var vecationRemaining: Int = {
       // get { // Getter - quando deseja modificar o valor ca variavel computada
          //  vacationAllowed - vacationTaken
       // }
        //set { // Setter - configura o que fazer quando tentarmos definir o valor
           // vacationAllowed = vacationTaken + "newValue"
//        }
//    }
}


print("----------------------------------- // -------------------------------")

// Property Observers - São pedaços de códigos que sa2o executados quando uma propriedade muda
struct Game {
    var scrore = 0 {
        didSet { // é chamado após as alteração ter ocorrido, e será definido chamado antes da alteração ocorrer. Sempre que ele mudar, imprimiremos seu novo valor.
            print("Scrore is now \(scrore)")
        }
    }
}
var game = Game()
game.scrore += 10
game.scrore -= 4


print("----------------------------------- // -------------------------------")

// Custom inicializers - São funções especiais que sa2o executados quando uma nova instância de uma struc é criada. Todas as propriedades dentro de uma Struct devem ter uma valor no momento que terminar.
struct Player {
    var name: String
    var number: Int
    
    init(name: String) { // o init sempre retorna implicitamente um tipo de sua struct
        self.name = name
        number = Int.random(in: 1...99)
    }
}


print("----------------------------------- // -------------------------------")

// Access Control: o Swift existem 4 tipos de controle de acesso, são eles:
    // 1 - Private - nada fora da struct leia ou escreva ele.
    // 2 - private(set) - algo de fora pode lê-lo, mas apenas coisas internas podem escrevê-lo
    // 3 - fileprivate - qualquer dentro do arquivo atual pode lê-lo e escrevê-lo
    // 4 - public - permite que qualquer um em qualquer lugar consegue lê-lo e escrevê-lo.

struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}
var account = BankAccount(funds: 1000)
print(account.funds)
//account.funds += 2000 // dara um erro


print("----------------------------------- // -------------------------------")

// Static properties and methods - reprodurir propriedades e métodos estáticos de suporte rápido permitindo-nos adiciona-los diretamente a um tipo de struct ao invês de uma instância especifica.

//posso apenas imprimir as versões dos pontos dos dados do aplicativo e ler diretamente, ao invés de criar novos dados de uma aplicativo e tentar ler as classes de valor dessa instância.
struct AppData {
    static let version = "1.3 beta 2"
    static let settingsFile = "setting.json"
}
print(AppData.version)

print("----------------------------------- // -------------------------------")

// Classes - tentar ler as classes de valor dessa instância vamos criar tipos de dados personalizados como struct, mas eles são diferentes de struct em algumas maneiras:
    // 1 - quando criamos uma classe podemos herdar ou construir sobre outra classe existente, ela obterá todos as propriedades e métodos dessa classe pai.
    // 2 - o swift nunca fará um inicializador gerado para nossas classes, isso ocorre porque os inicalizadores para classes é mais complicado do que para struct.
    // 3 - uma subclasse não tiver inicializadores personalizados, ela herdará automaticamente todos os de seus pai.
    // 4 - todas as cópias de uma classe compartilham um conjunto especifico de dados. Significa se vc alterar uma instância, todas as instâncias serão alteradas.
    // 5 - classes podem ter um inicializador se precisarem quando a última referência, um objeto é destruído, isso será executado automaticamente pelo sistema.
    // 6 - classes nos permitem alterar as propriedades variáveis mesmo na própria instância da classe é constante .

class Employee2 {
    var hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary2() {
        print("I work \(hours) hours day")
    }
}

class Developer: Employee2 {
    func work() {
        print("I`m coding for \(hours) hours a day")
    }
    
    override func printSummary2() { // override é usado quando deseja sobrescrever uma função
        print("I spend \(hours) hours a day figthing overs tabs vs spaces")
    }
}
let novall = Developer(hours: 8)
novall.work()
novall.printSummary2()

class Vehicle {
    let isEletric: Bool
    
    init(isEletric: Bool) {
        self.isEletric = isEletric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isConvertible: Bool, isEletric: Bool) {
        self.isConvertible = isConvertible
        super.init(isEletric: isEletric) // estamos chamando para a superclass ou classe pai
    }
}

class Actor {
    var name = "Will Smith"
}
var actor1 = Actor()
var actor2 = actor1

actor2.name = "Wesley Snipes"
print(actor1.name)
print(actor2.name)

class Site {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("Site \(id): I`ve been created")
    }
    
    deinit {
        print("Site \(id): I`ve been destroyd!")
    }
}
for i in 1...3 {
let site = Site(id: i)
print("Site \(id): I`m control")
}

class Singer {
    var name: String = "Her"
}
let singer2 = Singer()
singer2.name = "Her2"
print(singer2.name)


print("----------------------------------- // -------------------------------")

// Protocol - definem a funcionalidade  que esperamos que outro tipo suportem e o swift garaterá que eles sigam a regra corretamente.

protocol VehicleProtocol {
    var name: String { get }
    var currentPassengers: Int { get set }
    
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car2: VehicleProtocol {
    var name: String = "Tesla"
    
    var currentPassengers: Int = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 100
    }
    
    func travel(distance: Int) {
        print("I`m driving \(distance)km")
    }
    
    func openSunRoof() {
        print("It1s a nice day")
    }
}
func commute(distance: Int, using vehicle: VehicleProtocol) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow!")
    }
}

print("----------------------------------- // -------------------------------")

// Extension - serve para adicionar novas funcionalidades para qualquer tipo, os que criamos, e os próprio do Swift. Também podem adicionar mutating e propriedades computadas.
extension String {
    func trimmed() {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
//    mutating func trim() {
//        self = self.trimmed()
//    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}
var quote2 = "    The trust is rarely pure and never simple   "
quote2.trimmed()

var lyrics2 = """
But I keeping cruising
Can`t stop the music
Umbrela comporation
the Flash
"""

print(lyrics2.lines.count)


print("----------------------------------- // -------------------------------")

// Protocol Extension - vamos adicionar propriedades e métodos computadosa um protocolo inteiro, para qualquer tipo que esteja em conformidade, para o protocolo obter acesso a eles.
extension Collection {
    var isEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]
if guests.isEmpty {
    print("Guest count: \(guests.count)")
}

// extension de uma Collection - significa que podemos adicionar métodos necessários no próprio protocolo você deve adicionar  um b e c, mas depois adicionar implementações padrões desse método dentro de uma extension de protocolo, e todos os tipos em conformidade para nosso protocolo, obtenha acesso à nossa implementação padrão, ou eles podem subistitui-los em suas próprias estruturas

print("----------------------------------- // -------------------------------")

// Opcionais  representa a ausência de dados. Dados que podem ou não estar. Quando usamos opcionais, precisamos desembrulhar, para isso podemos utilizar o if Else ou ou op Guard let
let opposites = [
    "Mario":"Wario",
    "Luigi":"Waluigi"
]

let peachOpposite = opposites["Yoshi"]

// desembrulhar o opcional com if let
if let marioOpposite = opposites["Mario"] {
    print("Mario`s opposite is \(marioOpposite)")
}

// desembrulhar o opcional com guard let
func printSquare(of number: Int?){
    guard let number = number else {
        print("Missing Input")
        return
    }
    print("\(number) x \(number) is \(number * number)")
}

// desembrulhar usando o coalescenting - ele desembrulhará os opcionais, mas se estiver vazio, ele permitirá que você forneça um valor padrão em vez disso.
let tvShow = ["Eu a Patroa e as Crianças", "Dark", "The game of Thrones", "Ted Lasso"]
let favorite = tvShow.randomElement() ?? "None"

let input = ""
let number = Int(input) ?? 0
print(number)

print("----------------------------------- // -------------------------------")

// Optional chaining - lè os opcionais dentro dos opcionais.
let namesOfTheDog = ["Apollo", "Thor", "Sheelby", "Zigui"]
let chosen = namesOfTheDog.randomElement()?.uppercased()
print("Next in line: \(chosen ?? "No one")")

// se o opcional esta com um valor dentro, então, qualquer código. Neste caso estamos falando que um elemento retorna uma String, então coloca-los com letra maiusculas.


print("----------------------------------- // -------------------------------")

// Optional try? - quando lançamos erro, podemos colocar um ponto de interrogação no try?, para converter qualquer erro em opcional nil, e em sucesso um opcional com valor dentro
enum UserErrorID: Error {
    case badID, networkFailed
}
func getUserID(id: Int) throws -> String {
    throw UserErrorID.networkFailed
}

if let user = try? getUserID(id: 50) {
    print("User: \(id)")
}

//tudo o que nos importa é se recuperarmos um usuario ou não. Se quiser saber exatamente qual erro voltou você não pode usar try? e sim o catch.

print("----------------------------------- // -------------------------------")




