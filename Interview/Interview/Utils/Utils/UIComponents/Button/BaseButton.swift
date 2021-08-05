
import UIKit

open class BaseButton: UIButton, View {
    
    private let configuration: ButtonConfiguration
    
    public init(configuration: ButtonConfiguration) {
        self.configuration = configuration
        
        super.init(frame: .zero)
        
        setUp()
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func setUp() {
        setTitleColor(configuration.labelsColor, for: .normal)
        titleLabel?.font = configuration.font
        backgroundColor = configuration.backgroundColor
        layer.cornerRadius = configuration.cornerRadius
        layer.borderWidth = configuration.borderWidth
        layer.borderColor = configuration.borderColor.cgColor
        
        performSetUp()
    }
    
    open func setUpViewsHierarchy() {}
    
    open func setUpConstraints() {}
    
    open func setUpSubviews() {}

    open func setUpAccessibilityIdentifiers() {}
}
