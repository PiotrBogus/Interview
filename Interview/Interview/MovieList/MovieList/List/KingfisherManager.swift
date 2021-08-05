
import Utils
import UIKit

final class KingfisherManager {
    
    static let shared = KingfisherManager()
    
    private var kingfisherIntegration: KingfisherIntegrationProtocol?
    
    private init() {}
        
    func configure(kingfisherIntegration: KingfisherIntegrationProtocol) {
        self.kingfisherIntegration = kingfisherIntegration
    }
    
    func loadAsyncImage(from url: URL, to imageView: UIImageView) {
        KingfisherManager.shared.kingfisherIntegration?.loadAsyncImage(from: url, to: imageView)
    }
}
