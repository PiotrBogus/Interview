
import UIKit
import Utils

public final class MovieListBuilder {
    
    public init() {}
    
    public func build(apiListFetcher: MovieListAPIFetcher,
                      detailsFetcher: MovieDetailsAPIFetcher,
                      kingfisher: KingfisherIntegrationProtocol) -> UIViewController {
        KingfisherManager.shared.configure(kingfisherIntegration: kingfisher)
        
        let router = MovieListRouter(detailsFetcher: detailsFetcher)
        let interactor = MovieListInteractor(apiListFetcher: apiListFetcher)
        let presenter = MovieListPresenter(interactor: interactor, router: router)
        let viewController = MovieListViewController(presenter: presenter)
        
        interactor.delegate = presenter
        presenter.delegate = viewController
        
        return viewController
    }
}
