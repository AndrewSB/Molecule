//: [Previous](@previous)

protocol Decoration {
    var molecule: Molecule { get }
}
protocol Container {
    var molecules: [Molecule] { get }
}

struct Selected: Decoration {
    let molecule: Molecule
    
    init(_ molecule: Molecule) { self.molecule = molecule } // later added for callsite readability
}

struct Navigation: Container {
    let molecules: [Molecule]
}
struct TabBar: Container {
    let molecules: [Molecule]
}

indirect enum Molecule {
    case Atom
    case Decorated(Decoration)
    case Contained(Container)
}

let tabBar =
    Molecule.Contained(TabBar(molecules: [.Atom, .Atom, .Decorated(Selected(.Atom)), .Atom])) // .Decorated(Selected(.Atom)) still feels a little long. There's still room for improvement

let navBar =
    Molecule.Contained(Navigation(molecules: [.Atom]))

let navBarWithMultipleChildren =
    Molecule.Contained(Navigation(molecules: [.Atom, .Atom, .Atom, tabBar]))


//: [Next](@next)
