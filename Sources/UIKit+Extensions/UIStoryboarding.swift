// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import UIKit

protocol UIStoryboarding: class {
    static var storyboardingIdentifier: String { get }
    static var storyboardingBundle: Bundle? { get }
    static var storyboardingName: String { get }
    static var storyboard: UIStoryboard? { get }
}

extension UIStoryboarding {
    static var storyboardingIdentifier: String { return String(describing: self) }
    static var storyboardingBundle: Bundle? { return Bundle(for: self) }
    static var storyboardingName: String { return String(describing: self) }
    static var storyboard: UIStoryboard? {
        return UIStoryboard(name: storyboardingName, bundle: self.storyboardingBundle)
    }
}

extension UIStoryboarding where Self: UIStoryboard {
    init() {
        self.init(name: Self.storyboardingName, bundle: Self.storyboardingBundle)
    }
}
