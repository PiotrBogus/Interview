
import UIKit

public protocol View: UIView {

    func setUpViewsHierarchy()
    func setUpConstraints()
    func setUpSubviews()
    func setUpAccessibilityIdentifiers()
}

public extension View {

    func performSetUp() {
        setUpSubviews()
        setUpViewsHierarchy()
        setUpConstraints()
        setUpAccessibilityIdentifiers()
    }
}
