//Day 13


//: [Previous](@previous)

import Foundation

// Dia 13 – protocolos, extensões e checkpoint 8

/*
 Protocolos e extensões
 As extensões de protocolo nos permitem eliminar hierarquias de herança grandes e complexas e substituí-las por protocolos muito menores e mais simples que podem ser combinados. Isso realmente é o cumprimento de algo que Tony Hoare disse há muitos anos: “dentro de todo grande programa, há um pequeno programa tentando sair”.
 */


// 1 - Como criar e usar protocolos
/*
 Os protocolos são um pouco como os contratos no Swift: eles nos permitem definir quais tipos de funcionalidade esperamos que um tipo de dados suporte, e o Swift garante que o restante do nosso código siga essas regras.
 
 os protocolos: eles nos permitem definir uma série de propriedades e métodos que queremos usar. Eles não implementam essas propriedades e métodos – eles realmente não colocam nenhum código por trás disso – eles apenas dizem que as propriedades e métodos devem existir, um pouco como um projeto.
 */



protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set}
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}
/*
 1. Uma string chamada name, que deve ser legível. Isso pode significar que é uma constante, mas também pode ser uma propriedade computada com um getter.
 2. Um inteiro chamado currentPassengers, que deve ser leitura/gravação. Isso pode significar que é uma variável, mas também pode ser uma propriedade computada com um getter e setter.
 */

struct Car: Vehicle {
    
    let name: String = "Car"
    var currentPassengers: Int = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    
    func openSunroof() {
        print("It's a nice day")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100
    {
        print("That's too slow! I'll try difference vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}
let car = Car()
commute(distance: 100, using: car)

/*
 Bem, agora podemos projetar tipos que funcionem com esse protocolo. Isso significa criar novas structs, classes ou enums que implementem os requisitos desse protocolo, que é um processo que chamamos de adoção ou conformidade com o protocolo.
 */

struct Bicycle: Vehicle {
    
    let name: String = "Bicycle"
    var currentPassengers: Int = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km")
    }
}
let bike = Bicycle()
commute(distance: 50, using: bike)

/*
 Agora temos uma segunda estrutura que também está em conformidade com Vehicle, e é aqui que o poder dos protocolos se torna aparente: agora podemos passar a Carou a Bicyclepara a commute()função. Internamente a função pode ter toda a lógica que quiser, e quando chamar estimateTime()ou o travel()Swift automaticamente usará a apropriada – se passarmos de carro vai dizer “estou dirigindo”, mas se passarmos de moto vai dizer “Estou pedalando”.
 */

/*
 Assim como métodos, você também pode escrever protocolos para descrever propriedades que devem existir em tipos conformes. Para fazer isso, escreva var, em seguida, um nome de propriedade e, em seguida, liste se deve ser legível e/ou gravável.
 */

// você pode substituí-los por propriedades calculadas, desde que obedeça às regras - se você usar, { get set }não poderá se conformar ao protocolo usando uma propriedade constante.

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to traveln\(distance)km")
    }
}
getTravelEstimates(using: [car, bike], distance: 200)

/*
 Dica: Você pode se adequar a quantos protocolos precisar, apenas listando-os um a um separados por vírgula. Se você precisar criar uma subclasse de algo e se adequar a um protocolo, você deve colocar o nome da classe pai primeiro e, em seguida, escrever seus protocolos.
 */

/*
 Na prática, o que os protocolos nos permitem fazer é tratar nossos dados em termos mais gerais. Portanto, em vez de dizer “este buy()método deve aceitar um Bookobjeto”, podemos dizer “esse método pode aceitar qualquer coisa que esteja em conformidade com o Purchaseableprotocolo. Isso pode ser um livro, mas também pode ser um filme, um carro, um café e assim por diante – torna nosso método simples mais flexível, ao mesmo tempo em que garante que Swift imponha as regras para nós.
 */

protocol Purchaseable {
    var name: String { get set}
}

// Em termos de código, nosso buy()método simples que funciona apenas com livros ficaria assim:
struct Book: Purchaseable {
    var name: String
    var author: String
}

struct Movie: Purchaseable {
    var name: String
    var actor: String
}

//struct Car: Purchaseable {
//    var name: String
//    var manufacture: String
//}

struct Coffee: Purchaseable {
    var name: String
    var strenght: Int
}

func buy(_ item: Purchaseable) {
    print("I'm buying \(item.name)")
}

print("----------------------------------- // -------------------------------")


// 2 - Como usar tipos de retorno opacos
/*
 os tipos de retorno opacos: eles nos permitem ocultar informações em nosso código, mas não no compilador Swift. Isso significa que nos reservamos o direito de tornar nosso código flexível internamente para que possamos retornar coisas diferentes no futuro, mas o Swift sempre entende o tipo de dado real que está sendo retornado e o verificará adequadamente.
 
 O Swift fornece um recurso muito obscuro, muito complexo, mas muito importante , chamado tipos de retorno opacos, que nos permite remover a complexidade do nosso código.
 */

func getRandomNumber() -> Int {
    Int.random(in: 1...6)
}

func getRandomBool() -> Bool {
    Bool.random()
}

/*
 Ambos Inte Boolestão em conformidade com um protocolo Swift comum chamado Equatable, que significa “pode ser comparado para igualdade”. O Equatableprotocolo é o que nos permite usar ==, assim:
 */
print(getRandomNumber() == getRandomNumber())

//Como esses dois tipos estão em conformidade com Equatable, podemos tentar alterar nossa função para retornar um Equatablevalor, como este:

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}
/*
 No entanto, esse código não funcionará e o Swift exibirá uma mensagem de erro que provavelmente não será útil neste ponto de sua carreira no Swift: “o protocolo 'Equatable' só pode ser usado como uma restrição genérica porque possui Self ou associado requisitos de tipo”. O que o erro de Swift significa é que retornar Equatablenão faz sentido, e entender por que não faz sentido é a chave para entender os tipos de retorno opacos.
 */

//Para atualizar nossas duas funções para tipos de retorno opacos, adicione a palavra-chave some antes do tipo de retorno.

/*
 Então, quando você vê some Viewem seu código SwiftUI, estamos efetivamente dizendo a Swift “isso vai enviar de volta algum tipo de visualização para o layout, mas não quero escrever a coisa exata – você descobre por si mesmo. ”
 */
protocol View { }


print("----------------------------------- // -------------------------------")


// 3 - Como criar e usar extensões
/*
 As extensões nos permitem adicionar funcionalidade a qualquer tipo, seja ele criado por nós ou por outra pessoa – até mesmo um dos tipos da própria Apple.
 
 método útil em strings, chamado trimmingCharacters(in:). Isso remove certos tipos de caracteres do início ou fim de uma string, como letras alfanuméricas, dígitos decimais ou, mais comumente, espaços em branco e novas linhas.
 */

//Por exemplo, aqui está uma string que possui espaços em branco em ambos os lados:
var quote = "   The truth is rarely pure and never simple   "

//Se quiséssemos cortar o espaço em branco e as novas linhas em ambos os lados, poderíamos fazer assim:
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

/*
 O .whitespacesAndNewlinesvalor vem da API do Foundation da Apple e, na verdade, vem trimmingCharacters(in:)– como eu disse no início deste curso, o Foundation é realmente repleto de códigos úteis!
 */

//Ter que ligar trimmingCharacters(in:)toda vez é um pouco prolixo, então vamos escrever uma extensão para torná-la mais curta:
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
//Observe como podemos usar selfaqui – que se refere automaticamente à string atual. Isso é possível porque estamos atualmente em uma extensão de string.

//E agora em todos os lugares que queremos remover espaços em branco e novas linhas, podemos apenas escrever o seguinte:
let trimmed2 = quote.trimmed()

//poderíamos ter escrito uma função assim:
//mutating
func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

//usou assim:
let trimmed3 = trim(quote)

/*
 Como seus métodos de extensão são parte integral do tipo original, eles obtêm acesso total aos dados internos do tipo. Isso significa que eles podem usar propriedades e métodos marcados com privatecontrole de acesso, por exemplo.
 */

//Como a quotestring foi criada como uma variável, podemos apará-la assim:
//quote.trim()

/*
 lines, que divide a string em uma matriz de linhas individuais. Isso envolve outro método de string chamado components(separatedBy:), que divide a string em uma matriz de strings, dividindo-a em um limite de nossa escolha. Nesse caso, queremos que o limite seja novas linhas, então adicionamos isso à nossa extensão de string:
 */
//var lines: [String] {
//    self.components(separatedBy: .newlines)
    
//}

//Com isso no lugar, agora podemos ler a linespropriedade de qualquer string, assim:
let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

//print(lyrics.lines.count)

struct Books {
    let title: String
    let pageCount: Int
    let readingHours: Int
    
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}
//let lots = Books(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

//se quiséssemos que nosso Bookstruct tivesse o inicializador padrão de membros, bem como nosso inicializador personalizado, colocaríamos o personalizado em uma extensão, como esta:
//extension Books {
//    init(title: String, pageCount: Int) {
//        self.title = title
//        self.pageCount = pageCount
//        self.readingHours = pageCount / 50
//    }
//}

print("----------------------------------- // -------------------------------")




// 4 - Como criar e usar extensões de protocolo

/*
 Os protocolos nos permitem definir contratos aos quais os tipos em conformidade devem aderir, e as extensões nos permitem adicionar funcionalidade aos tipos existentes.
 */

//verificando se um array contém algum valor
let guests = ["Mario", "Luigi", "Zelda", "Goku"]
if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}

//Algumas pessoas preferem usar o !operador booleano, assim:
if !guests.isEmpty {
    print("Guest count: \(guests.count)")
}

//Podemos consertar isso com uma extensão bem simples para Array, assim:
extension Array {
    var isNotEmpty: Bool {
        !isEmpty
    }
}

//Agora podemos escrever um código que acho mais fácil de entender:
if !guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

//podemos mudar Arraypara Collectionem nosso código para obter isto:
extension Collection {
    var isNotEmpty: Bool {
        !isEmpty
    }
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}
/*
 E agora os tipos em conformidade podem adicionar seu próprio sayHello()método se quiserem, mas não precisam – eles sempre podem contar com aquele fornecido dentro de nossa extensão de protocolo.

 Assim, poderíamos criar um funcionário sem o sayHello()método:
 */
struct Employee: Person {
    let name: String
}
let lebron = Employee(name: "Lebron James")
lebron.sayHello()


//os arrays do Swift têm um allSatisfy()método que retorna true se todos os itens do array passarem em um teste. Assim, poderíamos criar um array de números e verificar se todos são pares:
let numbers = [4, 8, 15, 16]
let allEven = numbers.allSatisfy{ $0.isMultiple(of: 2) }

//Isso é muito útil, mas não seria mais útil se também funcionasse em conjuntos? Claro que sim, e é por isso que acontece:
let numbers2 = Set([4, 8, 15, 16])
let allEven2 = numbers2.allSatisfy { $0.isMultiple(of: 2) }

//cada par de chave/valor é passado para o encerramento e você precisa retornar verdadeiro ou falso. Se parece com isso:
let numbers3 = ["four": 4, "eight": 8, "fifteen": 15, "sixteen": 16]
let allEven3 = numbers3.allSatisfy { $0.value.isMultiple(of: 2) }

protocol Sequence {
    func allSatisfy()
}

struct AllSequence: Sequence {
    func allSatisfy() {
        let numbers = [4, 8, 15, 16]
        let allEven = numbers.allSatisfy{ $0.isMultiple(of: 2) }
    }
}

let all = AllSequence()

print("----------------------------------- // -------------------------------")


// 5 - Resumo: protocolos e extensões

/*
 Vamos recapitular o que aprendemos:

 - Os protocolos são como contratos de código: especificamos as funções e os métodos necessários e os tipos em conformidade devem implementá-los.
 
 - Os tipos de retorno opacos nos permitem ocultar algumas informações em nosso código. Isso pode significar que queremos manter a flexibilidade para mudar no futuro, mas também significa que não precisamos escrever tipos de retorno gigantescos.
 
 - As extensões nos permitem adicionar funcionalidade aos nossos próprios tipos personalizados ou aos tipos integrados do Swift. Isso pode significar adicionar um método, mas também podemos adicionar propriedades calculadas.
 
 - As extensões de protocolo nos permitem adicionar funcionalidade a muitos tipos de uma só vez – podemos adicionar propriedades e métodos a um protocolo e todos os tipos em conformidade obtêm acesso a eles.
 */

print("----------------------------------- // -------------------------------")

// 6 -  Como aproveitar ao máximo as extensões de protocolo

//amos tentar outra extensão de protocolo, desta vez um pouco mais complicada. Primeiro, vamos escrevê-lo como uma extensão simples em Int:
extension Int {
    func squared() -> Int {
        self * self
    }
}

let wholeNumber = 5
print(wholeNumber.squared())

//Aqui, ambos os tipos compartilham o Numericprotocolo, porque ambos são números, então poderíamos tentar estender isso:
//extension Numeric {
//    func squared() -> Int {
//        self * self
        //No entanto, esse código não funcionará mais, porque self * selfagora pode ser qualquer tipo de número, incluindo Double, e se você multiplicar a Doublepor a Double, definitivamente não receberá um Intretorno.
//    }
//}

/*
 Para resolver isso, podemos apenas usar a Self palavra-chave – apresentei-a brevemente quando analisamos a referência a propriedades e métodos estáticos, porque ela nos permite referir-se ao tipo de dados atual. É útil aqui porque significa “qualquer tipo conforme este método foi realmente chamado”, e se parece com isto:
 */
extension Numeric {
    func squared() -> Self {
        self * self
    }
}

/*
 Lembre-se, selfe Selfsignifica coisas diferentes: selfrefere-se ao valor atual e Selfrefere-se ao tipo atual . Portanto, se tivéssemos um número inteiro definido como 5, nossa squared()função funcionaria efetivamente assim:
 */
func squared() -> Int {
    5 * 5
}

//Existe Selfefetivamente Int, e selfé efetivamente 5. Ou se tivéssemos um decimal definido como 3,141, squared()funcionaria assim:
func squared() -> Double {
    3.14 * 3.14
}


/*
 vamos começar com um protocolo interno chamado Equatable, que é o que o Swift usa para comparar dois objetos usando ==e !=.

 Podemos fazer nossa Userestrutura se conformar Equatableassim:
 */
struct User: Equatable, Comparable {
    let name: String
    }
func <(lhs: User, rhs: User) -> Bool {
    lhs.name < rhs.name
}
//E agora podemos comparar dois usuários:
let name = User(name: "Myke")
let name2 = User(name: "Stefan")
print(name == name2)
print(name != name2)

//Nosso código é suficiente para criarmos duas Userinstâncias e compará-las usando <, assim:
print(name < name2)

//Não precisamos fazer nenhum trabalho especial aqui, porque o Swift pode fazer a Equatable conformidade para nós – ele irá comparar todas as propriedades de um objeto com as mesmas propriedades do outro objeto.

/*
 existe um protocolo Swift chamado Comparable, que permite ao Swift ver se um objeto deve ser classificado antes de outro. O Swift não pode implementar isso automaticamente em nossos tipos personalizados, mas não é difícil: você precisa escrever uma função chamada <que aceite duas instâncias de sua struct como parâmetro e retorne true se a primeira instância deve ser classificada antes da segunda.
 */

//Dica: Ao aprender mais sobre Swift, você aprenderá que a <função pode ser implementada como uma função estática que ajuda a manter seu código um pouco mais organizado.

//Isso é legal, mas o mais inteligente é que o Swift usa extensões de protocolo para fazer o seguinte funcionar também:
print(name <= name2)
print(name > name2)
print(name >= name2)


/*
 Esse código é possível porque Equatablenos permite saber se user1é igual a user2, e Comparablenos permite saber se user1deve ser classificado antes de user2, e com essas duas partes o Swift pode descobrir o resto automaticamente.
 
 Nos bastidores, o Swift usa herança de protocolo para que Comparableautomaticamente também signifique Equatable. Isso funciona de maneira semelhante à herança de classes, portanto, quando Comparableherda Equatabledela, também herda todos os seus requisitos.
 */
