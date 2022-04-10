//
//  NetworkManager.swift
//  WeGoTrip
//
//  Created by admin on 09.04.2022.
//

import Foundation
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func fetchImage(at url: URL, completion: @escaping (UIImage?) -> (Void)) {
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let image = UIImage(data: data)
                completion(image)                
            }
        }
        task.resume()
    }
    
    func sendReview(_ review: Review, completion: @escaping ((Error?) -> Void)) {
        let url = URL(string: "https://webhook.site/c8f2041c-c57e-433f-853f-1ef739702903")!
        let encodedReview = try! JSONEncoder().encode(review)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = encodedReview
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(error)
        }
        task.resume()
    }
}
