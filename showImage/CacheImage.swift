//
//  CacheImage.swift
//  showImage
//
//  Created by anhxa100 on 10/2/18.
//  Copyright © 2018 anhxa100. All rights reserved.
//

import Foundation
import UIKit

class CacheImage {

    
    static let cache = NSCache<NSString, UIImage>()
    
    
    // Creates a task that retrieves the contents of the specified URL, then calls a handler upon completion.
    // dataTask(with:completionHandler:)
    // Tạo nhiệm vụ truy xuất nội dung của URL được chỉ định, sau đó gọi trình xử lý sau khi hoàn thành.
    static func downloadImage(withURL url: URL, completion: @escaping (_ image: UIImage?) -> () ) {
        
        let dataTask = URLSession.shared.dataTask(with: url) {
            data, repond, error in
            
            var downloadImage: UIImage?
            
            if let data = data {
                downloadImage = UIImage(data: data)
            }
            if downloadImage != nil {
                cache.setObject(downloadImage!, forKey: url.absoluteString as NSString)
            }
            DispatchQueue.main.async {
                completion(downloadImage)
            }
        }
        dataTask.resume()
    }
    
    // Take image from cache
    //  Lấy ảnh từ cache object để sử dụng
    static func getImage(withURL url: URL, completion: @escaping (_ image: UIImage?) -> () ) {
        if let image = cache.object(forKey: url.absoluteString as NSString) {
            completion(image)
        } else {
            downloadImage(withURL: url, completion: completion)
        }
    }
}
