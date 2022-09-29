//
//  imageDowload.swift
//  LiguesObserver
//
//  Created by Оливер Салихов on 19.09.2022.
//

import Foundation
import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        contentMode = mode
        
        if let image = LiguesLocaleStore.shared.logoCahce.object(forKey: url as AnyObject) as? UIImage {
            self.image = image
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async { [weak self] in
                LiguesLocaleStore.shared.logoCahce.setObject(image, forKey: url as AnyObject)
                self?.image = image
            }
        }.resume()
    }
    
    func dowloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
