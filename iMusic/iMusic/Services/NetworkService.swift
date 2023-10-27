//
//  NetworkService.swift
//  iMusic
//
//  Created by Karen Vardanian on 24.10.2023.
//

import UIKit
import Alamofire


class NetworkService {
    var tracks = [Track]()
    func fetchTracks(searchText: String, completion: @escaping (SearchResponse?) -> Void) {
        let url = "https://itunes.apple.com/search"
        let parameters = ["term": "\(searchText)", "limit": "5", "media": "music"]
        
        AF.request(url, method: .get, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default, headers: nil).responseData { dataResponse in
            if let error = dataResponse.error {
                print("Error \(error)")
                completion(nil)
                return
            }
            
            guard let data = dataResponse.data else { return }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(SearchResponse.self, from: data)
                completion(response)
            } catch let error{
                print("error Data = \(error)")
                completion(nil)
            }

        }
    }
}
