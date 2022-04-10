//
//  Decorator.swift
//  Patterns
//
//  Created by Eugene on 10.04.2022.
//

import Foundation

protocol Component {
    func operation() -> String
}

//Представляют реализацию поведения по умолчанию, может быть несколько вариаций этих классов
class ConcreteComponent: Component {
    
    func operation() -> String {
        return "ConcreteComponent"
    }
    
}

//Базовый класс декоратора определяет интерфейс обертки для всех конкретных декораторов
class Decorator: Component {
    
    private var component: Component
    
    init(_ component: Component) {
        self.component = component
    }
    
    func operation() -> String {
        return component.operation()
    }
    
}

//Конкретные декораторы вызывают обернутый объект и изменяют его результат некоторым образом
class ConcreteDecoratorA: Decorator {
    //можно вызвать родительскую реализацию
//    override func operation() -> String {
//        return "ConcreteDecoratorA + \(super.operation())"
//    }
    
    //можно реализовать свою
    override func operation() -> String {
        return "ConcreteDecoratorA"
    }
}

class ConcreteDecoratorB: Decorator {
    
    //можно вызвать родительскую реализацию
    override func operation() -> String {
        return "ConcreteDecoratorA + \(super.operation())"
    }
    
}

class CLientDecorator {
    static func someClientCode(component: Component) {
        print("Result \(component.operation())")
    }
}
