//
//  ApiCaller.swift
//  CombineIntro
//
//  Created by Karen Vardanian on 13.10.2023.
//

import Combine
import Foundation


class APICaller {
    static let shared = APICaller()
    
    func fetchCompanies() -> Future<[String], Error> {
        return Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3)	{
                promise(.success(["Apple", "Google", "Microsoft", "Facebook"]))
            }
        }
    }
}
