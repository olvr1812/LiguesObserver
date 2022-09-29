//
//  NetworkManager.swift
//  LiguesObserver
//
//  Created by Оливер Салихов on 19.09.2022.
//

import Foundation

class NetworkManager {
    static var shared = NetworkManager()
    
    func getData<T: Decodable>(url: String?, model: T.Type, complition: @escaping(T) -> Void) {
        guard let urlString = url else {
            print("Ошибка строки")
            return
        }
        guard let url = URL(string: urlString) else {
            print("Неверный формат url")
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else {
                print("Ошибка формата data")
                return
            }
            do {
                let dataJSON = try JSONDecoder().decode(model, from: data)
                complition(dataJSON)
            } catch {
                print(error.localizedDescription)
            }
        }).resume()
    }
}
