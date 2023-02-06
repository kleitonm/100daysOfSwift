//: [Previous](@previous)

import Foundation

//Day 10 – structs, computed properties, and property observers

/*
 As Struct são uma das maneiras pelas quais o Swift nos permite criar nossos próprios tipos de dados a partir de vários tipos pequenos. Por exemplo, você pode colocar três strings e um booleano juntos e dizer que representa um usuário em seu aplicativo. Na verdade, a maioria dos próprios tipos do Swift são implementados como structs, incluindo String, Int, Bool, Arraye muito mais.
 */


// 1 - Como criar suas próprias estruturas ------------------------------------

struct Artist {
    let name: String
    let city: String
    let year: Int
    
    func printSummary() {
        print("\(name) \(city) and \(year)")
    }
}
let artistName = Artist(name: "Lebron", city: "New York", year: 2023)
print(artistName.name)
              
artistName.printSummary()

struct Employee {
    let name: String
    var vacationRemainig: Int
/*
qualquer função que apenas leia dados está bem como está, mas qualquer uma que altere dados pertencentes à struct deve ser marcada com uma mutating palavra-chave especial, como esta:
 mutating func takeVacation(days: Int) {
 */
    mutating func takeVacation(days: Int) {
                if vacationRemainig > days {
                    vacationRemainig -= days
                    print("I`m going on vacation")
                    print("Days remainig: \(vacationRemainig)")
                } else {
                    print("Oops! There aren`t enough days remainig")
                }
            }
}
var archer = Employee(name: "Lebron James", vacationRemainig: 15)
archer.takeVacation(days: 10)
var archer2 = Employee.init(name: "Lebron James", vacationRemainig: 15)
archer.takeVacation(days: 10)
print(archer.vacationRemainig)
print(archer2.vacationRemainig)

//Mas se você mudar var archerpara let archer, verá que o Swift se recusa a construir seu código novamente – estamos tentando chamar uma função mutante em uma estrutura constante, o que não é permitido.
        
//Quando criamos uma constante ou variável a partir de um struct, chamamos isso de instância – você pode criar uma dúzia de instâncias únicas do Albumstruct, por exemplo.

//Quando criamos instâncias de structs, fazemos isso usando um inicializador como este: Album(title: "Wings", artist: "BTS", year: 2016).

//Portanto, use tuplas quando quiser retornar dois ou mais valores arbitrários de uma função, mas prefira structs quando tiver alguns dados fixos que deseja enviar ou receber várias vezes.

print("----------------------------------- // -------------------------------")


// 2 - Como calcular valores de propriedade dinamicamente ---------------------

struct EmployeeTwo {
    let name: String
    var vacationRemaining: Int
}

var archerTwo = EmployeeTwo(name: "Sterling Archer", vacationRemaining: 14)
archerTwo.vacationRemaining -= 5
print(archerTwo.vacationRemaining)
archerTwo.vacationRemaining -= 3
print(archerTwo.vacationRemaining)

// usando a propriedade computada, assim:
struct EmployeeOther {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
//    var vacationRemaining: Int {
//        vacationAllocated - vacationTaken
        
        // um getter e um setter – nomes sofisticados para “código que lê” e “código que escreve”
        var vacationRemaining: Int {
            get {
                vacationAllocated - vacationTaken
            }
            set {
                vacationAllocated = vacationTaken + newValue
        }
    }
}

var acherOther = EmployeeOther(name: "Curry", vacationAllocated: 14)
acherOther.vacationTaken += 4
print(acherOther.vacationRemaining)
acherOther.vacationTaken += 4
print(acherOther.vacationRemaining)


print("----------------------------------- // -------------------------------")


// 3 - Como agir quando uma propriedade muda ------------------------------

/*
 O Swift nos permite criar observadores de propriedade , que são trechos especiais de código que são executados quando as propriedades mudam. Eles assumem duas formas: um didSetobservador para ser executado quando a propriedade acabou de ser alterada e um willSetobservador para ser executado antes que a propriedade seja alterada.
 */
struct Game {
    var score = 0
}
var game = Game()
game.score += 10
print("Score is now \(game.score)")
game.score -= 3
print("Score is now \(game.score)")
game.score -= 1

/*
 Com observadores de propriedade, podemos resolver esse problema anexando a print()chamada diretamente à propriedade usando didSet, de modo que sempre que ela mudar – onde quer que mude – sempre executaremos algum código.
 */
struct GameNew {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}
var gameNew = GameNew()
gameNew.score += 10
gameNew.score -= 3
gameNew.score += 1


//imprimirá mensagens à medida que os valores forem alterados para que você possa ver o fluxo quando o código for executado:
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(contacts)")
        }
        didSet {
            print("There are now: \(contacts.count) contacts")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Bryan C")
app.contacts.append("Lebron J")
app.contacts.append("Ja Morant")


/*
 Na prática, willSet é usado muito menos que didSet, mas você ainda pode vê-lo de vez em quando, por isso é importante saber que ele existe. Independentemente de qual você escolher, tente evitar colocar muito trabalho em observadores de propriedade - se algo que parece trivial, como game.score += 1desencadear trabalho intensivo, isso o surpreenderá regularmente e causará todos os tipos de problemas de desempenho.
 */

//na maioria das vezes, você usará didSet, porque queremos agir após a alteração, para que possamos atualizar nossa interface de usuário, salvar alterações ou qualquer outra coisa
print("----------------------------------- // -------------------------------")

// 4 - Como criar inicializadores personalizados -------------------------------

//Os inicializadores são métodos especializados projetados para preparar uma nova instância de struct para ser usada


struct Player {
    var name: String
    var number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...100)
    }
}
//selfatribuir parâmetros às propriedades para esclarecer que queremos dizer “atribuir o nameparâmetro à minha namepropriedade”.
//Ao escrever self.name, estamos esclarecendo que queremos dizer “a namepropriedade que pertence à minha instância atual”, em oposição a qualquer outra coisa.

let player = Player(name: "Megan Fox")
print(player.number)

/*
 Apenas lembre-se da regra de ouro: todas as propriedades devem ter um valor quando o inicializador terminar. Se não tivéssemos fornecido um valor numberdentro do inicializador, o Swift se recusaria a construir nosso código.
 */

//se eu tivesse um inicializador personalizado que criasse funcionários anônimos, ficaria assim:
struct EmployeeAnonymous {
    var name: String
    var yearsActive = 0

    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}
let roslin = Employee(name: "Laura Roslin", vacationRemainig: 12)
print(roslin)

//Assim que você adicionar um inicializador personalizado para sua estrutura, o inicializador padrão de membro desaparecerá. Se você quiser que ele permaneça, mova seu inicializador personalizado para uma extensão, como esta:

struct EmployeeAnon {
    var name: String
    var yearsActive = 0
}

extension EmployeeAnon {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let roslin2 = EmployeeAnon(name: "Laura Roslin")

// as does creating an anonymous employee
let anon = EmployeeAnon()

//o motivo mais comum para usar self está dentro de um inicializador, onde você provavelmente deseja nomes de parâmetros que correspondam aos nomes de propriedade do seu tipo, como este:
struct Student {
    var name: String
    var bestFriend: String
    
    init(name: String, bestFriend: String) {
        print("Enrollirg \(name) in class")
        self.name = name
        self.bestFriend = bestFriend
    }
}

/*
 Fora dos inicializadores, o principal motivo para usar selfé porque estamos em um encerramento e o Swift exige isso, então estamos claros de que entendemos o que está acontecendo. Isso só é necessário ao acessar selfde dentro de um encerramento que pertence a uma classe, e o Swift se recusará a criar seu código, a menos que você o adicione.
 */

// exemplo:
struct Country {
    var name: String
    var usesImperialMeasurements: Bool
    init(countryName: String) {
        name = countryName
        let imperialCountries = ["Liberia", "Myanmar", "USA"]
        if imperialCountries.contains(name) {
            usesImperialMeasurements = true
        } else {
            usesImperialMeasurements = false
        }
    }
}

// exemplo:
struct Cabinet {
    var height: Double
    var width: Double
    var area: Double
    init (itemHeight: Double, itemWidth: Double) {
        height = itemHeight
        width = itemWidth
        area = height * width
    }
}
let drawers = Cabinet(itemHeight: 1.4, itemWidth: 1.0)

// exemplo:
struct Kitchen {
    var utensils: [String]
    init(utensils: [String]) {
        self.utensils = utensils
    }
}

// exemplo:
struct Character {
    var name: String
    var actor: String
    var probablyGoingToDie: Bool
    init(name: String, actor: String) {
        self.name = name
        self.actor = actor
        if self.actor == "Sean Bean" {
            probablyGoingToDie = true
        } else {
            probablyGoingToDie = false
        }
    }
}
