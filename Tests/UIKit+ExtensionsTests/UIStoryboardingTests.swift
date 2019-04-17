// (ↄ) COPYLEFT ALL WRONGS RESERVED

import XCTest
@testable import UIKit_Extensions

class UIStoryboardingTests: XCTestCase {
    let subject = UIStoryboarding.self

    func test_extension_initializer() {
        XCTAssertNotNil(UIStoryboarding())
    }

    func test_extension_storyboard() {
        XCTAssertNotNil(subject.storyboard)
    }

    func test_extension_storyboardName() {
        XCTAssertEqual(subject.storyboardingName, "UIStoryboarding")
    }

    func test_extension_storyboardIdentifier() {
        XCTAssertEqual(subject.storyboardingIdentifier, "UIStoryboarding")
    }
}
