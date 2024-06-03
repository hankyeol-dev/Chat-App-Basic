import Foundation
import UIKit

protocol SetIdentifier {
    static var identifier: String { get }
}

/**
 - UIViewController
 - UITableView, UITableViewCell
 */

extension UIViewController: SetIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableView: SetIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: SetIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}
