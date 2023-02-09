//: [Previous](@previous)

import Foundation

//Day 12 – classes, inheritance, and checkpoint 7

/*
 A princípio, as classes parecem muito semelhantes às structs porque as usamos para criar novos tipos de dados com propriedades e métodos. No entanto, eles introduzem um recurso novo, importante e complexo chamado herança – a capacidade de fazer uma classe ser construída sobre as fundações de outra.
 */

// 1 - Como criar suas próprias classes

/*
 - Primeiro, as coisas que classes e structs têm em comum incluem:

     - Você pode criá-los e nomeá-los.
     - Você pode adicionar propriedades e métodos, incluindo observadores de propriedade e controle de acesso.
     - Você pode criar inicializadores personalizados para configurar novas instâncias como quiser.
 
 - No entanto, as classes diferem das estruturas em cinco pontos principais:

     - Você pode fazer com que uma classe se baseie na funcionalidade de outra classe, obtendo todas as suas propriedades e métodos como ponto de partida. Se você deseja substituir alguns métodos seletivamente, também pode fazer isso.
     - Por causa desse primeiro ponto, o Swift não irá gerar automaticamente um inicializador membro para as classes. Isso significa que você precisa escrever seu próprio inicializador ou atribuir valores padrão a todas as suas propriedades.
     - Quando você copia uma instância de uma classe, ambas as cópias compartilham os mesmos dados – se você alterar uma cópia, a outra também será alterada.
     - Quando a cópia final de uma instância de classe é destruída, o Swift pode, opcionalmente, executar uma função especial chamada deinicializador .
     - Mesmo se você tornar uma classe constante, ainda poderá alterar suas propriedades, desde que sejam variáveis.
 */

/*
 SwiftUI usa classes extensivamente, principalmente para o ponto 3: todas as cópias de uma classe compartilham os mesmos dados. Isso significa que muitas partes do seu aplicativo podem compartilhar as mesmas informações, de modo que, se o usuário alterar seu nome em uma tela, todas as outras telas serão atualizadas automaticamente para refletir essa alteração.*/

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}
var newGame = Game()
newGame.score += 20

print("----------------------------------- // -------------------------------")

// 2 - Como fazer uma classe herdar de outra

/*
 Swift nos permite criar classes baseando-as em classes existentes, que é um processo conhecido como herança . Quando uma classe herda a funcionalidade de outra classe (sua classe “pai” ou “super”), o Swift dará à nova classe acesso (a “classe filha” ou “subclasse”) às propriedades e métodos dessa classe pai, permitindo-nos para fazer pequenas adições ou alterações para personalizar a maneira como a nova classe se comporta.
 */

class Employee { // Employee é a classe Pai ou Super-Class
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

//Poderíamos criar duas subclasses de Employee, cada uma das quais obterá a hourspropriedade e o inicializador:
class Developer: Employee {
    func work() {
        print("I`m writing code for \(hours) hours.")
    }
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
         print("I`m going to meetings for \(hours) hours.")
    }
}

let ryan = Developer(hours: 10)
let byan = Manager(hours: 20)
ryan.work()
byan.work()

//Como Developerherda de Employee, podemos começar imediatamente a chamar printSummary()instâncias de Developer, assim:
let novall = Developer(hours: 12)
novall.printSummary()

// se uma classe filha quiser alterar um método de uma classe pai, você deve usar overridena versão da classe filha
/*
 Dica: Se você tem certeza de que sua classe não deve suportar herança, pode marcá-la como final. Isso significa que a própria classe pode herdar de outras coisas, mas não pode ser usada para herdar de – nenhuma classe filha pode usar uma classe final como pai.
 */


print("----------------------------------- // -------------------------------")

// 3 - Como adicionar inicializadores para classes

// importa: se uma classe filha tiver algum inicializador personalizado, ela sempre deve chamar o inicializador do pai depois de terminar de configurar seu próprio propriedades, se houver.

class Vehicle {
    let isElectric: Bool
    
    init(isEletric: Bool) {
        self.isElectric = isEletric
    }
}
/*
 super é outro daqueles valores que o Swift nos fornece automaticamente, semelhante a self: permite chamar métodos que pertencem à nossa classe pai, como seu inicializador. Você pode usá-lo com outros métodos, se desejar; não está limitado a inicializadores.
 */
class Car: Vehicle {
    let isConvertible: Bool
    
     init(isEletric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isEletric: isEletric)
    }
}
let teslaX = Car(isEletric: true, isConvertible: false)
teslaX.self
//Dica: Se uma subclasse não tiver nenhum de seus próprios inicializadores, ela herdará automaticamente os inicializadores de sua classe pai.

print("----------------------------------- // -------------------------------")

// 4 - como copiar aulas

/*
 No Swift, todas as cópias de uma instância de classe compartilham os mesmos dados, o que significa que qualquer alteração feita em uma cópia alterará automaticamente as outras cópias.
 Isso acontece porque as classes são tipos de referência no Swift, o que significa que todas as cópias de uma classe referem -se ao mesmo pote de dados subjacente.
 */

class User {
    var username = "Anonymous"
    
    //Se você deseja criar uma cópia exclusiva de uma instância de classe – às vezes chamada de cópia profunda – você precisa lidar com a criação de uma nova instância e copiar todos os seus dados com segurança.
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}
var userOne = User()

//Poderíamos então fazer uma cópia user1e alterar o usernamevalor:
var userTwo = userOne
userTwo.username = "Lebron James"
//Agora que alteramos a usernamepropriedade da cópia, podemos imprimir as mesmas propriedades de cada cópia diferente:
print(userOne.username)
print(userTwo.username)




print("----------------------------------- // -------------------------------")

// 5 - Como criar um deinicializador para uma classe

/*
 Assim como inicializadores, você não usa funccom deinicializadores – eles são especiais.
 Desinicializadores nunca podem obter parâmetros ou retornar dados e, como resultado, nem mesmo são escritos entre parênteses.
 */

//Para demonstrar isso, poderíamos criar uma classe que imprima uma mensagem quando ela é criada e destruída, usando um inicializador e um deinicializador:
class OtherUser {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I`m alive!")
    }
    deinit {
        print("User \(id): I`m deleted")
    }
}

//Agora podemos criar e destruir instâncias disso rapidamente usando um loop – se criarmos uma Userinstância dentro do loop, ela será destruída quando a iteração do loop terminar:
var users = [OtherUser]()
for i in 1...3 {
    let user = OtherUser(id: i)
    print("User \(user.id): I`m in control!")
    users.append(user)
}
print("Loop is fineshed!")
users.removeAll()
print("Array is clear!")

//O trabalho dos desinicializadores é nos dizer quando uma instância de classe foi destruída. Então o deinicializador vai no final, é o ~final~ da classe.

print("----------------------------------- // -------------------------------")

// 6 - Como trabalhar com variáveis ​​dentro de classes

class UserTwo {
    var name = "Will"
}
let userT = UserTwo()
userT.name = "Smith"
//userT = UserTwo() -  Cannot assign to value: 'userT' is a 'let' constant
print(userT.name)

//você pode alterar qualquer parte de suas propriedades sem precisar destruir e recriar o valor. Como resultado, as classes constantes podem ter suas propriedades variáveis ​​alteradas livremente.

print("----------------------------------- // -------------------------------")

// 7 - Resumo: Aulas

/*
 recapitular o que aprendemos:

     - As classes têm muitas coisas em comum com structs, incluindo a capacidade de ter propriedades e métodos, mas existem cinco diferenças principais entre classes e structs.
 
     - Primeiro, as classes podem herdar de outras classes, o que significa que elas obtêm acesso às propriedades e métodos de sua classe pai. Você pode, opcionalmente, sobrescrever métodos em classes filhas, se desejar, ou marcar uma classe como sendo finalpara impedir que outros criem subclasses dela.
 
     - Em segundo lugar, o Swift não gera um inicializador membro para as classes, então você mesmo precisa fazer isso. Se uma subclasse tiver seu próprio inicializador, ela sempre deverá chamar o inicializador da classe pai em algum ponto.
 
     - Terceiro, se você criar uma instância de classe e fizer cópias dela, todas essas cópias apontarão para a mesma instância. Isso significa que alterar alguns dados em uma das cópias altera todos eles.
     - Quarto, as classes podem ter deinicializadores que são executados quando a última cópia de uma instância é destruída.
 
     - Por fim, as propriedades das variáveis ​​dentro das instâncias de classe podem ser alteradas independentemente de a própria instância ter sido criada como variável.
 */
