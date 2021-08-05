
import Foundation
import Networking
import MovieList
import Utils
import UIKit

final class MovieListIntegration: Presentable {
    
    private let apiListFetcher = MovieListAPIFetcherIntegration()
    
    func presentMovieList(on viewController: UIViewController) {
        let movieListViewController = MovieListBuilder().build(apiListFetcher: apiListFetcher,
                                                               detailsFetcher: MovieDetailsAPIFetcherIntegration(),
                                                               kingfisher: KingfisherIntegration())
        
        push(viewController: movieListViewController, on: viewController)
    }
}
