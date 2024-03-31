//
//  TSImageLoader.swift
//  TopSongs
//
//  Created by Malavika Akhilesh on 29/03/24.
//

import Foundation

final class TSImageLoader {
    static let shared = TSImageLoader()
        
    private init() {}
    
    private var imageCache = NSCache<NSString, NSData>()
    
    public func downloadImage(_ urlString: String, completion: @escaping (Result<Data, ErrorCases>) -> Void){
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let key = url.absoluteString as NSString
        
        if let data = imageCache.object(forKey: key) {
            completion(.success(data as Data))
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { imageData, _, err in
            guard let data = imageData, err == nil else {
                completion(.failure(.invalidResponse))
                return
            }
            let value = data as NSData
            self.imageCache.setObject(value, forKey: key)
            completion(.success(data))
        }
        task.resume()
    }
}
