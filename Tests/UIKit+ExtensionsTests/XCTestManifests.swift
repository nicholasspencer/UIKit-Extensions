import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(UIKit_ExtensionsTests.allTests),
    ]
}
#endif