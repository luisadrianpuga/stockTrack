//
//  APICaller.swift
//  stockTrack
//
//  Created by Luis Adrian on 4/27/22.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private struct Constants {
        static let assetsEndpoint = "https://quotes-gw.webullfintech.com/api/bgw/quote/realtime?ids=913257027%2C913257027&includeSecu=1&includeQuote=1&more=1"
    }
    private init() {
        
    }
    
    public func getAllData(
        completion: @escaping (Result<[Stock], Error>)-> Void
    ) {
        guard let url = URL(string: Constants.assetsEndpoint) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data,_, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                //Decode the response
                let stocks = try JSONDecoder().decode([Stock].self, from: data)
                completion(.success(stocks))
            }
            catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
