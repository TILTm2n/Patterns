//
//  AbstractFactory.swift
//  Patterns
//
//  Created by Eugene on 26.02.2022.
//

import Foundation

//Абстрактная фабрика
protocol AbstractFactory {
    func createProductA() -> AbstractProductA
    func createProductB() -> AbstractProductB
}

//Фабрика по производству продуктов A и B 1 типа
class ConcreteFactory1: AbstractFactory {
    func createProductA() -> AbstractProductA {
        return ConcreteProductA1()
    }
    
    func createProductB() -> AbstractProductB {
        return ConcreteProductB1()
    }
}

//Фабрика по производству продуктов A и B 2 типа
class ConcreteFactory2: AbstractFactory {
    func createProductA() -> AbstractProductA {
        return ConcreteProductA2()
    }
    
    func createProductB() -> AbstractProductB {
        return ConcreteProductB2()
    }
}

protocol AbstractProductA {
    func usefulFunctionA() -> String
}

class ConcreteProductA1: AbstractProductA {
    func usefulFunctionA() -> String {
        return "the result of product A1"
    }
}

class ConcreteProductA2: AbstractProductA {
    func usefulFunctionA() -> String {
        return "the result of product A2"
    }
}

protocol AbstractProductB {
    func usefulFunctionB() -> String
    
    //взаимодействие с продуктами А той же вариации
    func anotherUsefullFunctionB(collaboration: AbstractProductA) -> String
}

class ConcreteProductB1: AbstractProductB {
    
    func usefulFunctionB() -> String {
        return "the result of product B1"
    }
    
    func anotherUsefullFunctionB(collaboration: AbstractProductA) -> String {
        let result = collaboration.usefulFunctionA()
        return "the result of the B1 collaborating with the \(result)"
    }
}

class ConcreteProductB2: AbstractProductB {
    func usefulFunctionB() -> String {
        return "the result of product B2"
    }
    
    func anotherUsefullFunctionB(collaboration: AbstractProductA) -> String {
        let result = collaboration.usefulFunctionA()
        return "the result of the B2 collaborating with the \(result)"
    }
}

class ClientAF {
    static func someClientCode(factory: AbstractFactory) {
        let productA = factory.createProductA()
        let productB = factory.createProductB()
        
        print(productA.usefulFunctionA())
        print(productB.anotherUsefullFunctionB(collaboration: productA))
    }
}

class AbstractFactoryApplication {
    func testAbstractFactoryApplication() {
        ClientAF.someClientCode(factory: ConcreteFactory1())
        ClientAF.someClientCode(factory: ConcreteFactory2())
    }
}
