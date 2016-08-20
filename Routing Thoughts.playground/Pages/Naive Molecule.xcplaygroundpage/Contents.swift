class Router {
    
    /// The stack is basically a value type - it has no additional state other than the array of molecules it holds
    var stack: [Molecule] = []
    
}

indirect enum Molecule {
    case Atom
    case Decorated(Molecule)
    case Contained([Molecule])
}

// the decorated atom is the selected one
let tabBar =
    Molecule.Contained([.Atom, .Atom, .Decorated(.Atom), .Atom])

let navBar =
    Molecule.Decorated(.Atom)

let navBarWithMultipleChildren =
    [Molecule.Decorated(.Atom), .Atom, .Atom] // bad smell. Parent affects child state...
