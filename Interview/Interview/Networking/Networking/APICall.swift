
import Foundation
import Shared
import Utils

public protocol NetworkCancellable {
    func cancel()
}

extension URLSessionDataTask: NetworkCancellable {}

final class APICall<Response: Codable> {
    
    typealias Completion = (Result<Response,NetworkingError>) -> Void
    
    private let session: URLSession
        
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func call(baseURL: String, endpoint: CallableEndoint, completion: @escaping Completion) -> NetworkCancellable? {
        guard let request = endpoint.makeRequest(baseURL: baseURL) else {
            Logger.error("Failed to make URL Request for endpoint: \(endpoint.endpoint)")
            completion(.failure(.requestParseError))
            return nil
        }
                
        let task = session.dataTask(with: request) {
            data, response, error in
            
            if let error = error {
                Logger.error("Networking error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(.failure(.other(localizedDescription: error.localizedDescription)))
                }
                return
            }
            
            guard let data = data else {
                completion(.failure(.jsonParseError))
                return
            }

            let decoder = JSONDecoder()
            let response: Response
            
            do {
                response = try decoder.decode(Response.self, from: data)
            } catch let error {
                DispatchQueue.main.async {
                    Logger.error("Failed to decode response with error: \(error.localizedDescription)")
                    completion(.failure(.other(localizedDescription: error.localizedDescription)))
                }
                return
            }
       
            DispatchQueue.main.async {
                Logger.other("Data tak completed: \(endpoint.endpoint).")
                completion(.success(response))
            }
        }
        
        task.resume()
        
        return task
    }
}
