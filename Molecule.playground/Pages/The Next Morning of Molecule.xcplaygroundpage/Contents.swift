//: [Previous](@previous)

/**
 This isn't syntactically beautiful or concise, but I think this combination of types perfectly models what we're looking for
 */
protocol UI {}
protocol Decoration {}
protocol Container {}

indirect enum Molecule {
    case Atom(UI)                           // leaf
    case Decorated(Decoration, Molecule)    // node atom
    case Contained(Container, [Molecule])   // node sequence
}

/**
 A router would take appends/pops, and have them chase an animatoin state
 */
import UIKit

protocol DisplayContext {} // can also be representative of a today widget/ share extension
extension UIWindow: DisplayContext {}

protocol Action {} // maybe call this animation?

class Router {
    private let window: DisplayContext
    
    private var _stack = [Molecule]()
    private var stackMutationQueue = [Action]() // this should be something Rx, so you don't need to pass completionHandlers/ have some sort of queue polling policy
    
    var stack = [Molecule]() {
        didSet {
            // diff the newValue & stack
            // create one or multiple actions out of the diff, append them to the queue
        }
    }
    
    init(context: DisplayContext) { self.window = context }
}

/**
 Example
 */
struct LandingPage: UI {}
struct Nav: Container {}

let router = Router(context: UIWindow())
router.stack += [Molecule.Contained(Nav(), [.Atom(LandingPage())])]

// there are going to have to be convinience methods for the router. Push onto the top view for example.
extension Router {
    enum PushLocation {
        case Below
        case Into
        case Above
    }
    
    func push(molecule: Molecule, onto pushLocation: PushLocation) {
        guard let topMolecule = stack.last else {
            stack.append(molecule)
            return
        }
        let topMoleculeIdx = stack.endIndex
        
        switch pushLocation {
        case .Below:
            stack.insert(molecule, atIndex: topMoleculeIdx.predecessor())
        case .Into:
            // find the leaf of the topMolecule's node, insert in that context's above
            switch topMolecule {
            case .Atom:
                break // insert
            case .Contained, .Decorated:
                break // recurse
            }
        case .Above:
            stack.append(molecule)
        }
    }
}
// with the case of a NavController, I shouldn't need to know there is a navController, and switch on router.stack.last to see if it is, and insert one way if it is a nav con, a different way if its a tab con... Or should I? We can provide default implementations for all of those cases, but if the option was presented to the user than it would be completely cusomtizable? If a little verbose?

//: [Next](@next)
