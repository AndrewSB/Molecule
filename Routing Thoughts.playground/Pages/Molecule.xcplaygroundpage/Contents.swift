//: [Previous](@previous)

protocol Decoration {}
protocol Container {}

protocol Selected: Decoration {}
protocol Navigation: Container {} // Typealias for UINavigationController
protocol Tab: Container {} // Typealias for UITabBarController

indirect enum Molecule {
    case Atom
    case Decorated(Molecule, Decoration) // I feel as if the Decoration describes the Decorated Molecule, so it really should be Decorated(Decoration(Molecule))... But then Decoration isn't a protocol anymore. It would be a struct container for the Molecule?
    case Contained([Molecule], Container.Type) // Ibid.
}

let tabBar =
    Molecule.Contained([.Atom, Molecule.Decorated(.Atom, Selected), .Atom, .Atom])

let navBar =
    Molecule.Decorated(.Atom, Navigation)

let navBarWithMultipleChildren =
    Molecule.Contained([.Atom, .Atom, .Atom], Navigation)


// PS: None of this compiled. Let's rearchitect the decoration and container protocols


//: [Next](@next)
