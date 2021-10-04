//
//  BRImageManager.swift
//  BottleRocket
//
//  Created by Yulia on 24.09.2021.
//

import Foundation
import UIKit

class TAImageManaget {
    
    var imageCache = NSCache<NSString, UIImage>()
    
    func getImage(urlData: String, completionHandler: @escaping (UIImage?) -> Void) {
        
        if let cashedImage = imageCache.object(forKey: urlData as NSString) {
            completionHandler(cashedImage)
        } else {
            let session = URLSession.shared
            guard let url = URL(string: urlData) else { return }
           
            let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 10)
            let dataTask = session.dataTask(with: request) { data, responce, error in
                
                guard error == nil,
                      data != nil else { return }
                
                DispatchQueue.main.async {
                    guard let image = UIImage(data: data!) else { return }
                    self.imageCache.setObject(image, forKey: urlData as NSString)
                
                    completionHandler(image)
                }
            }
            dataTask.resume()
        }
        
    }
}
