//
//  BRNetworkManager.swift
//  BottleRocket
//
//  Created by Yulia on 14.09.2021.
//

import Foundation

struct TANetworkManager {
    
    static func fetchData(completion: @escaping(_ restaurant: [Restaurant]?, _ error: String?) -> Void) {
        guard let url = URL(string: TAConstants.url) else { return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                guard let data = data else {
                    completion(nil, error.debugDescription)
                    return
                }
                
                let apiResponse = try! JSONDecoder().decode(RestaurantResponse.self, from: data)
                completion(apiResponse.restaurants, nil)
            }
            
        }.resume()
        
    }
}
