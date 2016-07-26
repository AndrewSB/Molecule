//: [Previous](@previous)

import UIKit

protocol AtomType {
    func present()
    func dismiss()
}

indirect enum Molecule {
    case Atom(AtomType)
    case Decorated(Molecule)
    case Contained(Molecule)
}

class Login: AtomType {
    init() {}
    func present() {}
    func dismiss() {}
}

class Landing: AtomType {
    init() {}
    func present() {}
    func dismiss() {}
}

let landingMolecule =
    Molecule.Atom(Landing())

let loginMolecule =
    [landingMolecule, .Atom(Login())]

typealias Nav =

let loginMoleculeWithNav =

//: [Next](@next)
