//
//  Singleton.swift
//  Patterns
//
//  Created by Eugene on 28.02.2022.
//

import Foundation

class Singleton {
    
    static var shared: Singleton = {
        let instance = Singleton()
        //настройка объекта
        return instance
    }()
    
    //инициализатор должен быть скрытым
    private init() {}
    
    func someBusinessLogic() -> String {
        //...
        return "Result of the someBusinessLogic call"
    }
}

//Singleton не должен быть копируемым
extension Singleton: NSCopying {
    
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}

class ClientS {
    
    static func someClientCode() {
        let instance1 = Singleton.shared
        let instance2 = Singleton.shared
        
        if (instance1 === instance2) {
            print("Singleton works, both variables contain the same instance")
        } else {
            print("Singleton failed, both variables contain different instance")
        }
    }
}

class SingletonConceptual {
    
    func testSingletonConceptual() {
        ClientS.someClientCode()
    }
}
