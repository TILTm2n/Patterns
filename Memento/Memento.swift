//
//  Memento.swift
//  Patterns
//
//  Created by Eugene on 12.04.2022.
//

import Foundation

class Originator {
    
    private var state: String
    
    init (state: String) {
        self.state = state
        print("Originator: My initial state is: \(state)")
    }
    
    func doSomething() {
        print("Originator: I'm doing something important")
        state = generateRandomString()
        print("Originator: My state has changed to: \(state)")
    }
    
    private func generateRandomString() -> String {
        return String(UUID().uuidString.suffix(4))
    }
    
    func save() -> Memento {
        return ConcreteMemento(state: state)
    }
    
    func restore(memento: Memento) {
        guard let memento = memento as? ConcreteMemento else { return }
        self.state = memento.state
        print("Originator: My state has changed to: \(state)")
    }
    
}

protocol Memento {
    
    var name: String { get }
    var date: Date { get }
    
}

class ConcreteMemento: Memento {
    
    private(set) var state: String
    private(set)var date: Date
    
    init(state: String) {
        self.state = state
        self.date = Date()
    }
    
    var name: String { return state + " " + date.description.suffix(14).prefix(8) }
    
}

class Caretaker {
    private lazy var mementos = [Memento]()
    private var originator: Originator
    
    init(originator: Originator) {
        self.originator = originator
    }
    
    func backup() {
        print("\nCaretaker: Saving Originator's state...\n")
        mementos.append(originator.save())
    }
    
    func undo() {
        
        guard !mementos.isEmpty else { return }
        let removedMemento = mementos.removeLast()
        
        print("Caretaker: Restoring state to:  " + removedMemento.name)
        originator.restore(memento: removedMemento)
    }
    
    func showHistory() {
        print("Caretake: Here's the list of mementos:\n")
        mementos.forEach({ print($0.name) })
    }
    
}
