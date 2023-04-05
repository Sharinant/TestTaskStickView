//
//  NetworkService.swift
//  Hammer
//
//  Created by Антон Шарин on 04.04.2023.
//

import Foundation
import UIKit

final class NetworkService {
    
    let url = URL(string: "https://run.mocky.io/v3/7feec4d9-f652-4686-b622-ff578ed3f442")
    
    func homePageCall(completion: @escaping (Result<MenuTableNetworkModel,Error>)-> Void)  {
            
            let task = URLSession.shared.dataTask(with: url!) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let decoded = try JSONDecoder().decode(MenuTableNetworkModel.self, from: data)
                    completion(.success(decoded))
                }
                catch{
                    completion(.failure(error))
                }
            }
            task.resume()
            
        }
    
    
}
