//
//  Facade.swift
//  Patterns
//
//  Created by Eugene on 10.04.2022.
//

import Foundation

class Facade {
    
    private var subsystem1: Subsystem1
    private var subsystem2: Subsystem2
    
    //Можно предоставить Фасаду существующие объекты подсиситемы или заставить Фасад создать их самостоятельно
    init(subsystem1: Subsystem1 = Subsystem1(), subsystem2: Subsystem2 = Subsystem2()) {
        self.subsystem1 = subsystem1
        self.subsystem2 = subsystem2
    }
    
    func operation() -> String {
        var result = "Facade initializers:\n"
        result += " " + subsystem1.operation1()
        result += " " + subsystem2.operation1()
        result += " " + "Facade orders subsystem to perform the actions:\n"
        result += " " + subsystem1.operationN()
        result += " " + subsystem2.operationQ()
        return result
    }
    
}

class Subsystem1 {
    
    func operation1() -> String {
        return "Subsystem1: Ready!\n"
    }
    
    func operationN() -> String {
        return "Subsystem1: Go!\n"
    }
    
}

class Subsystem2 {
    
    func operation1() -> String {
        return "Subsystem2: Ready!\n"
    }
    
    func operationQ() -> String {
        return "Subsystem2: Fire!\n"
    }
    
}

class ClientFacade {
    static func cliaentCodeFacade(facade: Facade) {
        print(facade.operation())
    }
}
