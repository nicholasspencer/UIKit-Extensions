// (ↄ) COPYLEFT ALL WRONGS RESERVED

import XCTest
@testable import UIKit_Extensions

class UIStoryboardingStoryboardTests: XCTestCase {
    let subject = UIStoryboarding.self

    func test_extension_storyboardIdentifier() {
        XCTAssertNil(subject.storyboardIdentifier)
    }

    func test_extension_storyboardBundle() {
        XCTAssertEqual(subject.storyboardBundle, Bundle(for: UIStoryboardingStoryboardTests.self))
    }

    func test_extension_storyboardName() {
        XCTAssertEqual(subject.storyboardName, "UIStoryboarding")
    }

    func test_extension_storyboard() {
        XCTAssertNotNil(subject.storyboard)
    }
}


class UIStoryboardingViewControllerTests: XCTestCase {
    let subject1 = UIStoryboardingFirstViewController.self
    let subject2 = UIStoryboardingSecondViewController.self

    func test_extension_storyboardIdentifier() {
        XCTAssertEqual(subject1.storyboardIdentifier, "UIStoryboardingFirstViewController")
        XCTAssertEqual(subject2.storyboardIdentifier, "UIStoryboardingSecondViewController")
    }

    func test_extension_storyboardBundle() {
        XCTAssertEqual(subject1.storyboardBundle, Bundle(for: UIStoryboardingViewControllerTests.self))
    }

    func test_extension_storyboardName() {
        XCTAssertEqual(subject1.storyboardName, "UIStoryboarding")
        XCTAssertEqual(subject2.storyboardName, "UIStoryboarding")
    }

    func test_extension_storyboard() {
        XCTAssertNotNil(subject1.storyboard)
        XCTAssertNotNil(subject2.storyboard)
    }
}
