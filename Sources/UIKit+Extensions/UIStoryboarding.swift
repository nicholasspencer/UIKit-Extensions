// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import UIKit

protocol UIStoryboarding: class {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle? { get }
    static var storyboardIdentifier: String? { get }
}

extension UIStoryboarding {
    static var storyboardBundle: Bundle? { return Bundle(for: self) }
    static var storyboardIdentifier: String? { return nil }

    static var storyboard: UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: storyboardBundle)
    }
}

extension UIStoryboarding where Self: UIStoryboard {
    static var storyboardName: String { return String(describing: self) }

    static var storyboard: UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: storyboardBundle)
    }
}

extension UIStoryboarding where Self: UIViewController {
    static var storyboardIdentifier: String? { return String(describing: self) }

    static var storyboardViewController: Self? {
        if let identifier = storyboardIdentifier {
            return storyboardViewController(withIdentifier: identifier)
        } else {
            return storyboard.instantiateInitialViewController() as? Self
        }

    }

    static func storyboardViewController(withIdentifier: String? = Self.storyboardIdentifier) -> Self? {
        guard let identifier = withIdentifier else { return nil }
        return storyboard.instantiateViewController(withIdentifier: identifier) as? Self
    }
}
