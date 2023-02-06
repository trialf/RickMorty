//
//  ImageDownloader.swift
//  Rick&Morty
//
//  Created by Adrian Ulgar on 30/10/2022.
//

import Foundation
import UIKit
final class ImageDownloader {

    static let shared = ImageDownloader()

    private var cachedImages: [String: UIImage]
    private var imagesDownloadTasks: [String: URLSessionDataTask]

    // MARK: Private init
    private init() {
        cachedImages = [:]
        imagesDownloadTasks = [:]
    }
   
    func downloadImage(with imageUrlString: String?,
                       completionHandler: @escaping (UIImage?, Bool) -> Void,
                       placeholderImage: UIImage?) {

        // check if string
        guard let imageUrlString = imageUrlString else {
            completionHandler(placeholderImage, true)
            return
        }

        // check if we have a cache image
        if let image = getCachedImageFrom(urlString: imageUrlString) {
            completionHandler(image, true)
        } else {
            // check if string can be url
            guard let url = URL(string: imageUrlString) else {
                completionHandler(placeholderImage, true)
                return
            }

            if let _ = getDataTaskFrom(urlString: imageUrlString) {
                return
            }

            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

                guard let data = data else {
                    return
                }

                // if fail we return placeholder image
                if let _ = error {
                    DispatchQueue.main.async {
                        completionHandler(placeholderImage, true)
                    }
                    return
                }

                let image = UIImage(data: data)
                
                self.cachedImages[imageUrlString] = image

                self.imagesDownloadTasks.removeValue(forKey: imageUrlString)

                DispatchQueue.main.async {
                    // return the image
                    completionHandler(image, false)
                }
            }
            
            imagesDownloadTasks[imageUrlString] = task

            task.resume()
        }
    }


    // MARK: Helper methods
    private func getCachedImageFrom(urlString: String) -> UIImage? {
        return cachedImages[urlString]
    }

    private func getDataTaskFrom(urlString: String) -> URLSessionTask? {
        return imagesDownloadTasks[urlString]
    }
}
