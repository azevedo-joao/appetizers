//
//  NetworkManager.swift
//  Appetizers
//
//  Created by João Azevedo on 10.03.24.
//

import UIKit

// TODO: Kommentare
final class NetworkManager {
    
    // TODO: Kommentare
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    //    func getAppetizers(completed: @escaping (Result<[Appetizer], ApError>) -> Void) {
    //
    //        // wenn URL nil zurückgibt
    //        guard let url = URL(string: appetizerURL) else {
    //            completed(.failure(.invalidURL))
    //            return
    //        }
    //
    //        /// der Task ist der API-Aufruf
    //        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
    //            if let _ = error {
    //                completed(.failure(.unableToComplete))
    //                return
    //            }
    //
    //            // casts response als URL, wenn nicht nil checkt, ob status code 200 ist
    //            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    //                completed(.failure(.invalidResponse))
    //                return
    //            }
    //
    //            guard let data = data else {
    //                completed(.failure(.invalidData))
    //                return
    //            }
    //
    //            // wird ausgeführt, wenn der Rest nicht gescheitert ist (Datum ist vorhanden)
    //            do {
    //                let decoder = JSONDecoder()
    //                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
    //                completed(.success(decodedResponse.request))
    //            } catch {
    //                completed(.failure(.invalidData))
    //            }
    //
    //        }
    //
    //        task.resume()
    //    }
    
    func getAppetizers() async throws -> [Appetizer] {
        
        // wenn URL nil zurückgibt
        guard let url = URL(string: appetizerURL) else {
            throw ApError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // wird ausgeführt, wenn der Rest nicht gescheitert ist (Datum ist vorhanden)
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AppetizerResponse.self, from: data).request
        } catch {
            throw ApError.invalidData
        }
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        // Wenn das Bild schon im cache ist, braucht man keinen Network-Call
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        // checkt, ob der URL da ist
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            //check, ob es data da ist und mach ein Image aus dem data
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            // speichert das Image im cache
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
