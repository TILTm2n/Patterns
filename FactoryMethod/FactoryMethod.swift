//
//  FactoryMethod.swift
//  Patterns
//
//  Created by Eugene on 26.02.2022.
//

import Foundation

//MARK: - Creator
protocol Creator {
    //у этого метода также может быть реализация по умолчанию
    func factoryMethod() -> Product
    
    //какая-либо основная бизнес-логика
    func someOperation() -> String
    
}

extension Creator {
    //дефолтная реализация метода бизнес-логики
    func someOperation() -> String {
        //вызов фабричного метода для получения объект-продукт
        let product = factoryMethod()
        
        return "Создатель:" + product.operation()
    }
}

class ConcreteCreator1: Creator {
    func factoryMethod() -> Product {
        return ConcreteProduct1()
    }
}

class ConcreteCreator2: Creator {
    func factoryMethod() -> Product {
        return ConcreteProduct2()
    }
}

//MARK: - Product
protocol Product {
    //протокол продукта определяет все необходимые операции которые должны выполнять все продукты
    func operation() -> String
}

//различные реализации протокола продукта от разных продуктов
class ConcreteProduct1: Product {
    func operation() -> String {
        return "result of ConcreteProduct1"
    }
}

class ConcreteProduct2: Product {
    func operation() -> String {
        return "result of ConcreteProduct2"
    }
}

//MARK: - Client
class Client {
    static func someClientCode(creator: Creator) {
        print("Клиент: Не имею понятия о классе созадтеле но все работает" + creator.someOperation())
    }
}

//работа всего вместе
class FactoryMethod {
    func testFactoryMethod() {
        //приложение запущено с ConcreteCreator1
        Client.someClientCode(creator: ConcreteCreator1())
        
        //приложение запущено с ConcreteCreator2
        Client.someClientCode(creator: ConcreteCreator2())
    }
}
