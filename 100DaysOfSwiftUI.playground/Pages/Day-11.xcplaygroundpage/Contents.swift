//: [Previous](@previous)

import Foundation
//Estruturas, parte dois

// Day 11 – access control, static properties and methods, and checkpoint 6

// structs nos permitem combinar partes individuais de dados para criar algo novo e, em seguida, anexar métodos para que possamos manipular esses dados.

// 1 - Como limitar o acesso a dados internos usando o controle de acesso

// Por padrão, as structs do Swift nos permitem acessar suas propriedades e métodos livremente

struct BankAccount {
    //funds deve ser acessível apenas dentro do struct
    //private(set)é a melhor escolha para fundos: você pode ler o saldo atual da conta bancária a qualquer momento, mas não pode alterá-lo sem passar pela minha lógica.
   private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}
//Que possui métodos para depositar e sacar dinheiro de uma conta bancária, e deve ser utilizado assim:
var account = BankAccount()
account.deposit(amount: 200)
let sucess = account.withdraw(amount: 400)

if sucess {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

/*
 O Swift nos oferece várias opções, mas quando você estiver aprendendo, precisará apenas de algumas:

 Use privatepara "não deixe nada fora da estrutura usar isso".
 Use fileprivatepara “não deixe nada fora do arquivo atual usar isso”.
 Use publicpara “permitir que qualquer pessoa, em qualquer lugar, use isso”.
 private(set) - Isso significa “permitir que qualquer pessoa leia esta propriedade, mas deixe apenas meus métodos escrevê-la”.
 */

//ao usar privateaqui, estou pedindo ao Swift para impor as regras para mim: não me deixe ler ou escrever esta propriedade de qualquer lugar fora da User estrutura.

// exemplo:
struct School {
    var staffNames: [String]
    private var studentNames: [String]
    init(staff: [String]) {
        self.staffNames = staff
        self.studentNames = [String]()
    }
}
let royalHigh = School(staff: ["Mrs Hughes"])

print("----------------------------------- // -------------------------------")


// 2 - Propriedades e métodos estáticos
struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}
//Para usar esse código, escreveríamos o seguinte:
School.add(student: "Taylor Swift")
print(School.studentCount)

//Agora temos self e Self , e eles significam coisas diferentes: selfrefere-se ao valor atual da estrutura e Selfrefere-se ao tipo atual .

/*
 Dica: É fácil esquecer a diferença entre selfe Self, mas se você pensar sobre isso, é como o resto da nomenclatura de Swift – começamos todos os nossos tipos de dados com uma letra maiúscula ( Int, Double, Bool, etc), então faz sentido Selfcomeçar com letra maiúscula também.
 */

//posso ter uma estrutura AppDatapara armazenar muitos valores compartilhados que uso em muitos lugares:
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

//A segunda razão pela qual costumo usar dados estáticos é criar exemplos de minhas estruturas
struct Employee {
    let usename: String
    let password: String
    
    static let example = Employee(usename: "ryan123", password: "RaN242201")
}

//Um uso comum para propriedades e métodos estáticos é armazenar funcionalidades comuns que você usa em um aplicativo inteiro
struct Unwrap {
    static let appURL = "https://itunes.apple.com/app/id1440611372"
}
//Dessa forma, posso escrever Unwrap.appURLquando alguém compartilhar algo do aplicativo


//Também uso uma propriedade estática e um método estático para armazenar alguma entropia aleatória na mesma estrutura, assim:
struct Example {
    private static var entropy = Int.random(in: 1...1000)
    
    static func getEntropy() -> Int {
        entropy += 1
        return entropy
    }
}


print("----------------------------------- // -------------------------------")


// 3 - Resumo: Estruturas

//As structs são usadas em quase todos os lugares no Swift: String, Int, Double, Arraye até mesmo Boolsão todas implementadas como structs, e agora você pode reconhecer que uma função como isMultiple(of:)é realmente um método pertencente a Int.

/*
  - Você pode criar seus próprios structs escrevendo struct, dando um nome a ele e colocando o código do struct entre chaves.
 
  - Estruturas podem ter variáveis ​​e constantes (conhecidas como propriedades) e funções (conhecidas como métodos)
 
 - Se um método tentar modificar as propriedades de sua estrutura, você deve marcá-lo como mutating.
 
 - Você pode armazenar propriedades na memória ou criar propriedades calculadas que calculam um valor toda vez que são acessadas.
 
 - Podemos anexar didSete willSetobservadores de propriedade a propriedades dentro de uma estrutura, o que é útil quando precisamos ter certeza de que algum código sempre será executado quando a propriedade for alterada.
 
 - Os inicializadores são um pouco como funções especializadas, e o Swift gera um para todas as estruturas usando seus nomes de propriedade.
 
 - Você pode criar seus próprios inicializadores personalizados, se desejar, mas sempre deve certificar-se de que todas as propriedades em sua estrutura tenham um valor no momento em que o inicializador terminar e antes de chamar qualquer outro método.
 
 - Podemos usar o acesso para marcar quaisquer propriedades e métodos como disponíveis ou indisponíveis externamente, conforme necessário.
 
 - É possível anexar uma propriedade ou métodos diretamente a um struct, para que você possa usá-los sem criar uma instância do struct.
 */
