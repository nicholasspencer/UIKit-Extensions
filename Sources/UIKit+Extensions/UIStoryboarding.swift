// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import UIKit

protocol UIStoryboarding: class {
    static var storyboardingIdentifier: String { get }
    static var storyboard: UIStoryboard? { get }
    static var storyboardingBundle: Bundle? { get }
    static var storyboardingName: String? { get }
}

extension UIStoryboarding {
    static var storyboardingIdentifier: String { return String(describing: self) }
    static var storyboardingBundle: Bundle? { return Bundle(for: self) }
    static var storyboardingName: String? { return storyboardingIdentifier }
    static var storyboard: UIStoryboard? {
        guard let storyboardingName = storyboardingName else { return nil }
        return UIStoryboard(name: storyboardingName, bundle: self.storyboardingBundle)
    }
}
