//: [Previous](@previous)

protocol AnyAtom {}

protocol Decorator {
    associatedtype Atom
    
    func doSomething(withAtom atom: Atom)
}

struct Molecule<Atom, D: Decorator where D.Atom == Atom> {
    
}

struct NoDecorator: Decorator {

    func doSomething(withAtom atom: AnyAtom) {
        // do nothing
    }
}

struct NavigationDecorator: Decorator {
    
    func doSomething(withAtom atom: AnyAtom) {
        // do nothing
    }
}

typealias AnyView = Molecule<AnyAtom, NoDecorator>

typealias Nav = Molecule<AnyAtom, NavigationDecorator>

/*
 Not sure where this is going. These were about all the ideas I had

 I'd say the best implementation is something between Contained and Generic. From Contained, there has to be some way to specialize .Atom, so you can create a loginAtom, and a homeAtom - maybe with associated types?? It may be possible to utilize generics to handle the specialization, if so, I have no idea why.
 https://github.com/Ben-G/Validated had some interesting ideas on how to construct dependant types using a model and a validator (`LoggedInUser = Validated<User, LoggedInValidator>`). It may be possible to create a dependant molecule using an atom and a Nil/decorator/container?
 
 Maybe I'm thinking about this all wrong...
 */




//: [Next](@next)
