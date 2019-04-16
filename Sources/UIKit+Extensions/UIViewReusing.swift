// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import UIKit

protocol UIViewReusing: class {
    static var reuseIdentifier: String { get }
    static var reuseNibBundle: Bundle? { get }
    static var reuseNibName: String? { get }
    static var reuseNib: UINib? { get }
}

extension UIViewReusing {
    static var reuseIdentifier: String { return String(describing: self) }
    static var reuseNibBundle: Bundle? { return Bundle(for: self) }
    static var reuseNibName: String? { return reuseIdentifier }
    static var reuseNib: UINib? {
        guard let reuseNibName = reuseNibName else { return nil }
        return UINib(nibName: reuseNibName, bundle: reuseNibBundle)
    }
}

protocol UITableViewCellReusing: UIViewReusing {
    static func registeringNib(with tableView: UITableView, nib: UINib?, usingCellReuseIdentifier identifier: String)
    static func registeringClass(with tableView: UITableView, cellClass: AnyClass?, usingCellReuseIdentifier identifier: String)
    static func dequeueingCell(for tableView: UITableView, at indexPath: IndexPath, usingCellReuseIdentifier identifier: String) -> Self?
}

extension UITableViewCellReusing where Self: UITableViewCell {
    static func registeringNib(with tableView: UITableView, nib: UINib? = Self.reuseNib, usingCellReuseIdentifier identifier: String = Self.reuseIdentifier) {
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }

    static func registeringClass(with tableView: UITableView, cellClass: AnyClass? = Self.self, usingCellReuseIdentifier identifier: String = Self.reuseIdentifier) {
        tableView.register(cellClass, forCellReuseIdentifier: identifier)
    }

    static func dequeueingCell(for tableView: UITableView, at indexPath: IndexPath = IndexPath(), usingCellReuseIdentifier identifier: String = Self.reuseIdentifier) -> Self? {
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Self
    }
}

protocol UITableViewHeaderFooterViewReusing: UIViewReusing {
    static func registeringNib(with tableView: UITableView, nib: UINib?, usingHeaderFooterViewReuseIdentifier identifier: String)
    static func registeringClass(with tableView: UITableView, viewClass: AnyClass?, usingHeaderFooterViewReuseIdentifier identifier: String)
    static func dequeueingView(for tableView: UITableView, usingHeaderFooterViewReuseIdentifier identifier: String) -> Self?
}

extension UITableViewHeaderFooterViewReusing where Self: UITableViewHeaderFooterView {
    static func registeringNib(with tableView: UITableView, nib: UINib? = Self.reuseNib, usingHeaderFooterViewReuseIdentifier identifier: String = Self.reuseIdentifier) {
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }

    static func registeringClass(with tableView: UITableView, viewClass: AnyClass? = Self.self, usingHeaderFooterViewReuseIdentifier identifier: String = Self.reuseIdentifier) {
        tableView.register(viewClass, forHeaderFooterViewReuseIdentifier: identifier)
    }

    static func dequeueingView(for tableView: UITableView, usingHeaderFooterViewReuseIdentifier identifier: String = Self.reuseIdentifier) -> Self? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier) as? Self
    }
}

protocol UICollectionViewCellReusing: UIViewReusing {
    static func registeringNib(with collectionView: UICollectionView, nib: UINib?, usingCellReuseIdentifier identifier: String)
    static func registeringClass(with collectionView: UICollectionView, cellClass: AnyClass?, usingCellReuseIdentifier identifier: String)
    static func dequeueingCell(for collectionView: UICollectionView, at indexPath: IndexPath, usingCellReuseIdentifier identifier: String) -> Self?
}

extension UICollectionViewCellReusing where Self: UICollectionViewCell {
    static func registeringNib(with collectionView: UICollectionView, nib: UINib? = Self.reuseNib, usingCellReuseIdentifier identifier: String = Self.reuseIdentifier) {
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }

    static func registeringClass(with collectionView: UICollectionView, cellClass: AnyClass? = Self.self, usingCellReuseIdentifier identifier: String = Self.reuseIdentifier) {
        collectionView.register(cellClass, forCellWithReuseIdentifier: identifier)
    }

    static func dequeueingCell(for collectionView: UICollectionView, at indexPath: IndexPath = IndexPath(), usingCellReuseIdentifier identifier: String = Self.reuseIdentifier) -> Self? {
        return collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Self
    }
}

protocol UICollectionReusableViewReusing: UIViewReusing {
    static var reuseViewKind: String { get }

    static func registeringNib(with collectionView: UICollectionView, nib: UINib?, viewKind: String, usingReuseIdentifier identifier: String)
    static func registeringClass(with collectionView: UICollectionView, viewClass: AnyClass?, viewKind: String, usingReuseIdentifier identifier: String)
    static func dequeueingView(for collectionView: UICollectionView, viewKind: String, at indexPath: IndexPath, usingReuseIdentifier identifier: String) -> Self?
}

extension UICollectionReusableViewReusing where Self: UICollectionReusableView {
    static var reuseViewKind: String { return String(describing: self) }

    static func registeringNib(with collectionView: UICollectionView, nib: UINib? = Self.reuseNib, viewKind: String = Self.reuseViewKind, usingReuseIdentifier identifier: String = Self.reuseIdentifier) {
        collectionView.register(nib, forSupplementaryViewOfKind: viewKind, withReuseIdentifier: identifier)
    }

    static func registeringClass(with collectionView: UICollectionView, viewClass: AnyClass? = Self.self, viewKind: String = Self.reuseViewKind, usingReuseIdentifier identifier: String = Self.reuseIdentifier) {
        collectionView.register(viewClass, forSupplementaryViewOfKind: viewKind, withReuseIdentifier: identifier)
    }

    static func dequeueingView(for collectionView: UICollectionView, viewKind: String = Self.reuseViewKind, at indexPath: IndexPath = IndexPath(), usingReuseIdentifier identifier: String = Self.reuseIdentifier) -> Self? {
        return collectionView.dequeueReusableSupplementaryView(ofKind: viewKind, withReuseIdentifier: identifier, for: indexPath) as? Self
    }
}
