import UIKit
//Complex data types

//1. Arrays
//Array: “Uma coleção ordenada de acesso aleatório.”

var name = ["Lebron", "Irving", "BlueIvy", "Zyian" ]
print(name)
var arrayOfBlogCategories: [String] = ["Swift", "Debugging", "Xcode", "Workflow", "Optimization"]
arrayOfBlogCategories.append("Kotlin")

// 2. Sets: não são ordenados e não podem conter duplicatas
// Sets: “Uma coleção não ordenada de elementos únicos.”
var staffReview = Set([1, 2, 3, 1, 2, 4])
var ratings = Set([1, 1, 1, 2, 2, 2, 3, 3, 3])
var setOfBlogCategories: Set<String> = ["Swift", "Debugging", "Xcode", "Workflow", "Optimization"]
setOfBlogCategories.insert("Kotlin")

let (inserted, memberAfterInsert) = setOfBlogCategories.insert("Swift")
if !inserted {
    print("\(memberAfterInsert) already exists")
}
// Prints: "Swift already exists"
//Temos que usar append(_:)para um Array e insert(_:)para um Set


// 3. Tuples você pode ser criada misturando Sring, Int, Bool
// Tanto as tuplas quanto os arrays nos permitem manter vários valores em uma variável, mas as tuplas mantêm um conjunto fixo de coisas que não podem ser alteradas, enquanto os arrays variáveis ​​podem ter itens adicionados a eles indefinidamente.
//você não pode alterar os tipos de itens de tupla

// Por exemplo, se quisermos uma tupla variável para armazenar um site, podemos escrever isto:
var website = (name: "Apple", url: "www.apple.com")

//Outra vantagem das tuplas é que cada valor é criado especificamente por você, portanto, além de fornecer um nome, você também fornece um tipo . Então, você poderia criar uma tupla como esta:
var peson = (name: "Lebron", age: 35, isMarried: true)


// 4. Arrays vs sets vs tuples

//Se você precisa de uma coleção específica e fixa de valores relacionados onde cada item tem uma posição ou nome preciso, você deve usar uma tupla:
let address = (house: "68", street: "Amador Bueno", district: "Jd Nove de Julho")

// Se você precisa de uma coleção de valores que devem ser únicos ou precisa ser capaz de verificar se um item específico está lá de forma extremamente rápida, você deve usar um Set:
let television = Set(["NBA", "World Cup", "NFL", "Soccer Play", "Video Game"])

// Se você precisa de uma coleção de valores que podem conter duplicatas, ou se a ordem dos seus itens é importante, você deve usar um array:
let names = ["Leonard", "Ryan", "Paul", "Terry", "Eric"]


// 5. Dictionaries: Dicionários são coleções de valores como arrays, mas em vez de armazenar coisas com uma posição inteira, você pode acessá-los usando o que quiser.

let heights = [
    "Taylor Swift": 1.63,
    "Lebron": 2.05,
    "Kyve Irving": 1.90
]
heights["Kyve Irving"]


// 6. Dictionary default values
// Se você tentar ler um valor de um dicionário usando uma chave que não existe, o Swift enviará de volta nil– nada. Embora isso possa ser o que você deseja, há uma alternativa: podemos fornecer ao dicionário um valor padrão a ser usado se solicitarmos uma chave ausente.

let favoriteIceCream = [
    "Kleber": "Chocolate",
    "Bia": "Açai",
]
favoriteIceCream["Kleber"]
favoriteIceCream["Bryan"] // vai retornar nil

//Podemos corrigir isso dando ao dicionário um valor padrão de “Desconhecido”, para que, quando nenhum sorvete for encontrado para Charlotte, recebamos “Desconhecido” em vez de zero:
favoriteIceCream["Bryan", default: "Unknown"]

let planets = [1: "Mercury", 2: "Venus"]
let venus1 = planets[2, default: "Planet X"]


// 7.Creating empty collections
// Arrays, conjuntos e dicionários são chamados de coleções , porque eles coletam valores juntos em um só lugar.

// Se você deseja criar uma coleção vazia , basta escrever seu tipo seguido de abertura e fechamento de parênteses.

var teams = [String: String]()

//Podemos então adicionar entradas mais tarde, assim:
teams["Paul"] = "Red"

//Da mesma forma, você pode criar uma matriz vazia para armazenar inteiros como este:
var results = [Int]()

//A exceção é criar um Sets vazio, o que é feito de maneira diferente:
var words = Set<String>()
var numbers = Set<Int>()

//Se você quiser, pode criar arrays e dicionários com sintaxe similar:
var scrores = Dictionary<String, Int>()
var testResults = Array<Int>()


// 8. Enumerations : geralmente chamadas apenas de enum – são uma forma de definir grupos de valores relacionados de forma a torná-los mais fáceis de usar.

//Com enums podemos definir um Resulttipo que pode ser successou failure, assim:
enum Results {
    case sucess
    case failure
}

//E agora, quando o usarmos, devemos escolher um desses dois valores:
let resultTest = Results.sucess


//. 9 Enum associated values
// Além de armazenar um valor simples, as enumerações também podem armazenar valores associados anexados a cada caso. Isso permite que você anexe informações adicionais às suas enumerações para que possam representar dados com mais nuances.
enum Activity {
    case bored(emotion: String)
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
//Agora podemos ser mais precisos – podemos dizer que alguém está falando sobre futebol:
let talking = Activity.talking(topic: "World Cup")
print(talking)

enum Weather {
    case sunny
    case windy(speed: Int)
    case rainy(chance: Int, amount: Int)
}
let windy = Weather.windy(speed: 10)
let rainy = Weather.rainy(chance: 20, amount: 10)


// 10. Enum raw values
//Às vezes, você precisa atribuir valores a enums para que tenham significado. Isso permite criá-los dinamicamente e também usá-los de maneiras diferentes.

//Por exemplo, você pode criar uma Planetenumeração que armazena valores inteiros para cada um de seus casos:
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}
// O Swift atribuirá automaticamente a cada um deles um número começando em 0, e você pode usar esse número para criar uma instância do caso enum apropriado.
let earth = Planet(rawValue: 2) // irá printar earth

// Agora Swift atribuirá 1 mercurye contará para cima a partir daí, o que significa que earthagora é o terceiro planeta.


// 11. Complex types: Summary
/*
1 - Arrays, conjuntos, tuplas e dicionários permitem armazenar um grupo de itens em um único valor. Cada um deles faz isso de maneiras diferentes, então qual você usa depende do comportamento que você deseja.
 
2 - Arrays armazenam itens na ordem em que você os adiciona e você os acessa usando posições numéricas.
 
3 - Define os itens da loja sem nenhuma ordem, portanto, você não pode acessá-los usando posições numéricas.
 
4 - Tuplas são de tamanho fixo e você pode anexar nomes a cada um de seus itens. Você pode ler itens usando posições numéricas ou usando seus nomes.
 
5 - Os dicionários armazenam itens de acordo com uma chave e você pode ler itens usando essas chaves.
 
6 - Enums são uma forma de agrupar valores relacionados para que você possa usá-los sem erros de ortografia.
 
7 - Você pode anexar valores brutos a enums para que possam ser criados a partir de números inteiros ou strings, ou pode adicionar valores associados para armazenar informações adicionais sobre cada caso.*/

var total = 0
total = 5 + 4 * 18 / 3 * 3 % 3 - 1
print(total)
