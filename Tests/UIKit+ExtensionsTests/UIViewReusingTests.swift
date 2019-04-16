// (ↄ) COPYLEFT ALL WRONGS RESERVED

import XCTest
@testable import UIKit_Extensions

fileprivate let reuseIdentifier = "reuseIdentifier"

class UITableViewClassReusingTests: XCTestCase {

    var flyweightView: UITableView? {
        didSet {
            guard let flyweightView = flyweightView else { return }

            UIViewReusingTableViewCell.registeringClass(with: flyweightView)
            UIViewReusingTableViewCell.registeringClass(with: flyweightView, usingCellReuseIdentifier: reuseIdentifier)
            UIViewReusingTableViewHeaderFooterView.registeringClass(with: flyweightView)
            UIViewReusingTableViewHeaderFooterView.registeringClass(with: flyweightView, usingHeaderFooterViewReuseIdentifier: reuseIdentifier)
        }
    }

    override func setUp() {
        flyweightView = UITableView()
    }

    override func tearDown() {
        flyweightView = nil
    }

    func test_dequeue_cell_automatic() {
        guard let flyweightView = flyweightView else {
            XCTFail("Test is incorrectly setup")
            return
        }

        XCTAssertNotNil(UIViewReusingTableViewCell.dequeueingCell(for: flyweightView))
    }

    func test_dequeue_cell_manual() {
        guard let flyweightView = flyweightView else {
            XCTFail("Test is incorrectly setup")
            return
        }

        XCTAssertNotNil(UIViewReusingTableViewCell.dequeueingCell(for: flyweightView, usingCellReuseIdentifier: reuseIdentifier))
    }

    func test_dequeue_view_automatic() {
        guard let flyweightView = flyweightView else {
            XCTFail("Test is incorrectly setup")
            return
        }

        XCTAssertNotNil(UIViewReusingTableViewHeaderFooterView.dequeueingView(for: flyweightView))
    }

    func test_dequeue_view_manual() {
        guard let flyweightView = flyweightView else {
            XCTFail("Test is incorrectly setup")
            return
        }

        XCTAssertNotNil(UIViewReusingTableViewHeaderFooterView.dequeueingView(for: flyweightView, usingHeaderFooterViewReuseIdentifier: reuseIdentifier))
    }

}

class UICollectionViewClassReusingTests: XCTestCase {

    var flyweightView: UICollectionView? {
        didSet {
            guard let flyweightView = flyweightView else { return }

            UIViewReusingCollectionViewCell.registeringClass(with: flyweightView)
            UIViewReusingCollectionViewCell.registeringClass(with: flyweightView, usingCellReuseIdentifier: reuseIdentifier)
            UIViewReusingCollectionReusableView.registeringClass(with: flyweightView)
            UIViewReusingCollectionReusableView.registeringClass(with: flyweightView, usingReuseIdentifier: reuseIdentifier)
        }
    }

    override func setUp() {
        flyweightView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    }

    override func tearDown() {
        flyweightView = nil
    }

    func test_dequeue_cell_automatic() {
        guard let flyweightView = flyweightView else {
            XCTFail("Test is incorrectly setup")
            return
        }

        XCTAssertNotNil(UIViewReusingCollectionViewCell.dequeueingCell(for: flyweightView))
    }

    func test_dequeue_cell_manual() {
        guard let flyweightView = flyweightView else {
            XCTFail("Test is incorrectly setup")
            return
        }

        XCTAssertNotNil(UIViewReusingCollectionViewCell.dequeueingCell(for: flyweightView, usingCellReuseIdentifier: reuseIdentifier))
    }

    func test_dequeue_view_automatic() {
        guard let flyweightView = flyweightView else {
            XCTFail("Test is incorrectly setup")
            return
        }

        XCTAssertNotNil(UIViewReusingCollectionReusableView.dequeueingView(for: flyweightView))
    }

    func test_dequeue_view_manual() {
        guard let flyweightView = flyweightView else {
            XCTFail("Test is incorrectly setup")
            return
        }

        XCTAssertNotNil(UIViewReusingCollectionReusableView.dequeueingView(for: flyweightView, usingReuseIdentifier: reuseIdentifier))
    }

}
