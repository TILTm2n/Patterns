//
//  Builder.swift
//  Patterns
//
//  Created by Eugene on 27.02.2022.
//

import Foundation

protocol Builder {
    func producePartA()
    func producePartB()
    func producePartC()
}

class ConcreteBuilder1: Builder {
    private var product = Product1()
    
    func reset() {
        product = Product1()
    }
    
    func producePartA() {
        product.add(part: "PartA1")
    }
    
    func producePartB() {
        product.add(part: "PartB1")
    }
    
    func producePartC() {
        product.add(part: "PartC1")
    }
    
    //метод для сброса продукта на ноль, чтобы можно было начать делать новый продукт
    func retrieveProduct() -> Product1 {
        let result = self.product
        reset()
        return result
    }
}

//класс Директора отвечает только за выполнение шагов построения в опреленной последовательности
class Director {
    private var builder: Builder?
    
    func update(builder: Builder) {
        self.builder = builder
    }
    
    //можно создавать разные конфигурации продукта
    func buildMinimalViableProduct() {
        builder?.producePartA()
    }
    
    func buildFullFeaturedProduct() {
        builder?.producePartA()
        builder?.producePartB()
        builder?.producePartC()
    }
}

class Product1 {
    private var parts = [String]()
    
    func add(part: String) {
        self.parts.append(part)
    }
    
    func  listParts() -> String {
        return "Product parts: " + parts.joined(separator: ", ") + "\n"
    }
}

class ClientB {
    
    static func someClientCode(director: Director) {
        let builder = ConcreteBuilder1()
        director.update(builder: builder)
        
        print("Standart basic product:")
        director.buildMinimalViableProduct()
        print(builder.retrieveProduct().listParts())
        
        print("Standart full featured product:")
        director.buildMinimalViableProduct()
        print(builder.retrieveProduct().listParts())
        
        //объект строителя можно использовать и без директора
        print("Custom product")
        builder.producePartB()
        builder.producePartA()
        print(builder.retrieveProduct().listParts())
    }
}

class BuilderConceptual {
    func testBuilderConceptual() {
        let director = Director()
        ClientB.someClientCode(director: director)
    }
}
