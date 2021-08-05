
import XCTest
@testable import MovieList

final class MovieListBuilderTests: XCTestCase {

    func testBuild() {
        let vc = MovieListBuilder().build(apiListFetcher: MovieListAPIFetcherMock(),
                                          detailsFetcher: MovieDetailsAPIFetcherMock(),
                                          kingfisher: KingfisherIntegrationMock())
        XCTAssertNotNil(vc)
    }
}
