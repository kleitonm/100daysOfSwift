//: [Previous](@previous)

import Foundation

//Day 8 – default values, throwing functions, and checkpoint 4

// 1- Como fornecer valores padrão para parâmetros

//Adicionar parâmetros às funções nos permite adicionar pontos de personalização, para que as funções possam operar em dados diferentes, dependendo de nossas necessidades.

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

//um parâmetro padrão em ação
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll()
print(characters.count)

//keepingCapacity
characters.removeAll(keepingCapacity: true)
//keepingCapacityé um Boolean com o valor padrão de false para que ele faça a coisa sensata por padrão, enquanto também deixa em aberto a opção de passarmos trueos horários em que queremos manter a capacidade existente da matriz.


//imagine algum código de busca de rota como este:
func findDirections(from: String, to: String, route: String = "fastest", avoidHighways: Bool = false) {
    // code here
}
//podemos chamar a mesma função de três maneiras:
findDirections(from: "London", to: "Glasgow")
findDirections(from: "London", to: "Glasgow", route: "scenic")
findDirections(from: "London", to: "Glasgow", route: "scenic", avoidHighways: true)



// 2 - Como lidar com erros em funções

//precisamos começar definindo os possíveis erros que podem acontecer. Isso significa criar uma nova enumeração que se baseie no tipo existente do Swift Error, assim:
enum PasswordError: Error {
    case short, obvious
}
//Isso diz que há dois erros possíveis com a senha: shorte obvious. Não define o que significam , apenas que existem.

//No nosso caso, vamos escrever uma função que verifica a força de uma senha: se for muito ruim – menos de 5 caracteres ou for extremamente conhecida – lançaremos um erro imediatamente, mas para todas as outras strings retornará classificações “OK”, “Bom” ou “Excelente”.
func checkPassword(_ password: String) Throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obbvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}
// - Se uma função é capaz de gerar erros sem tratá-los ela mesma, você deve marcar a função como throwsantes do tipo de retorno.
// - Quando chega a hora de lançar um erro, escrevemos throwseguido por um de nossos PasswordErrorcasos. Isso encerra imediatamente a função, o que significa que não retornará uma string.

// - Iniciando um bloco de trabalho que pode lançar erros, usando do.
// - Chamando uma ou mais funções de lançamento, usando try.
// - Manipulando quaisquer erros lançados usando catch.
do {
    try someRiskyWork()
} catch {
    print("Handle error here")
}

// Se quiséssemos escrever tente isso usando nossa checkPassword()função atual, poderíamos escrever isto:
let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use longuer password")
} catch PasswordError.obvius {
    print("I have the same combination on my luggage")
} catch {
    print("There was an error.")
}
//try. Isso deve ser escrito antes de chamar todas as funções que podem gerar erros e é um sinal visual para os desenvolvedores de que a execução regular do código será interrompida se ocorrer um erro.
//Em algumas circunstâncias, você pode usar uma alternativa escrita como try!que não requer doe catch, mas travará seu código se um erro for lançado - você deve usar isso raramente e somente se tiver certeza absoluta de que um erro não pode ser lançado.

//Dica: a maioria dos erros gerados pela Apple fornece uma mensagem significativa que você pode apresentar ao usuário, se necessário. O Swift disponibiliza isso usando um errorvalor que é fornecido automaticamente dentro do seu catchbloco, e é comum ler error.localizedDescriptionpara ver exatamente o que aconteceu.


// 3 - Resumo: Funções

/*
 - As funções nos permitem reutilizar o código facilmente, separando pedaços de código e dando-lhes um nome.
 - Todas as funções começam com a palavra func, seguida do nome da função. O corpo da função está contido dentro de chaves de abertura e fechamento.
 - Podemos adicionar parâmetros para tornar nossas funções mais flexíveis – liste-os um a um separados por vírgulas: o nome do parâmetro, depois dois pontos e o tipo do parâmetro.
 - Você pode controlar como esses nomes de parâmetro são usados ​​externamente, usando um nome de parâmetro externo personalizado ou usando um sublinhado para desabilitar o nome externo desse parâmetro.
 - Se você acha que existem determinados valores de parâmetro que usará repetidamente, você pode fazer com que eles tenham um valor padrão para que sua função leve menos código para escrever e faça a coisa inteligente por padrão.
 - As funções podem retornar um valor se você quiser, mas se quiser retornar vários dados de uma função, você deve usar uma tupla . Eles contêm vários elementos nomeados, mas são limitados de uma forma que um dicionário não é - você lista cada elemento especificamente, junto com seu tipo.
 - As funções podem gerar erros: você cria uma enumeração definindo os erros que deseja que ocorram, lança esses erros dentro da função conforme necessário e, em seguida, usa do, trye catchpara tratá-los no local da chamada.
 */


// 4 - Ponto de verificação 4
