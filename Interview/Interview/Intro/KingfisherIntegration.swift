
import Utils
import UIKit
import Kingfisher

final class KingfisherIndicatorView: BaseView, Indicator {
    
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    lazy var view: IndicatorView = activityIndicator
    
    init(color: UIColor = .whiteColor) {
        super.init(frame: .componentBounds)
        
        activityIndicator.color = color
        activityIndicator.hidesWhenStopped = true
    }
    
    func startAnimatingView() {
        activityIndicator.startAnimating()
    }
    
    func stopAnimatingView() {
        activityIndicator.stopAnimating()
    }
}

final class KingfisherIntegration: KingfisherIntegrationProtocol {
    
    func loadAsyncImage(from url: URL, to imageView: UIImageView) {
        imageView.kf.indicatorType = .custom(indicator: KingfisherIndicatorView())
        imageView.kf.setImage(with: url)
    }
}
