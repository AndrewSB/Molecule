//: [Previous](@previous)

/// Contained:
/// Protocols instead of an enum, for composition
protocol MoleculeType {}

protocol Atom: MoleculeType {}
protocol Decoration: MoleculeType {
    var molecule: MoleculeType { get }
}
protocol Container: MoleculeType {
    var molecules: [MoleculeType] { get }
}


/// Generic:
protocol IInheritFromUIKit {}
class AtomType: IInheritFromUIKit {}

struct Molecule<AtomType, MoleculeType> {}

class LandingAtom: AtomType {}
typealias LandingMolecule = Molecule<LandingAtom, Atom>
let landingMolecule = LandingMolecule()

class LoginAtom: AtomType {}
typealias LoginMolecule = Molecule<LoginAtom, Atom>
let loginMolecule = LoginMolecule()

struct NavigationContainer: Container {
    let molecules: [MoleculeType]
}

class NavController: AtomType {}
typealias AuthNavigationMolecule = Molecule<NavController, Decoration>
let authNavMolecule = AuthNavigationMolecule()

/*
 Post script:
    For `struct Molecule<AtomType, MoleculeType> {}`
    I want AtomType to be \{one|array} of atoms, and MoleculeType to be either .Atom or .Decoration if one, and .Container if many.
 
    Not sure how to encode that into a type... Halp
 */

//: [Next](@next)
