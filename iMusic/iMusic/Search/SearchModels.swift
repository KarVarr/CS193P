//
//  SearchModels.swift
//  iMusic
//
//  Created by Karen Vardanian on 27.10.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Search {
    
    enum Model {
        struct Request {
            enum RequestType {
                case some
                case getTracks
            }
        }
        struct Response {
            enum ResponseType {
                case some
                case presentTracks
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case some
                case displayTracks
            }
        }
    }
    
}
