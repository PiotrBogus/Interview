
import Foundation
import Shared

public protocol NetworkingService {
    typealias Completion<T: Codable> = (Result<T, NetworkingError>) -> Void

    @discardableResult
    func request<T: Codable>(with endpoint: CallableEndoint, completion: @escaping Completion<T>) -> NetworkCancellable?
}

final public class DefaultNetworkingService: NetworkingService {
    
    private let baseURL: String
    
    public init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    public func request<T>(with endpoint: CallableEndoint, completion: @escaping (Result<T, NetworkingError>) -> Void) -> NetworkCancellable? where T : Codable {
        
        let call = APICall<T>()
        
        return call.call(baseURL: baseURL, endpoint: endpoint, completion: completion)
    }
}
