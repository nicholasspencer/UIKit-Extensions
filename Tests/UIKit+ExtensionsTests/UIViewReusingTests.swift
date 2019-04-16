// (ↄ) COPYLEFT ALL WRONGS RESERVED

import XCTest
@testable import UIKit_Extensions

class UITableViewReusingTests: XCTestCase {

    var flyweightView: UITableView? {
        didSet {
            guard let flyweightView = flyweightView else { return }
        }
    }

    func test_UITableViewCellReusing() {

    }

    func test_UITableViewHeaderFooterViewReusing() {

    }

}

class UICollectionViewReusingTests: XCTestCase {

    var flyweightView: UICollectionView? {
        didSet {
            guard let flyweightView = flyweightView else { return }
        }
    }

    func test_UICollectionViewCellReusing() {

    }

    func test_UICollectionReusableViewReusing() {

    }

}
