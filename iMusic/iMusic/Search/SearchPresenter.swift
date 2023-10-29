//
//  SearchPresenter.swift
//  iMusic
//
//  Created by Karen Vardanian on 27.10.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
  func presentData(response: Search.Model.Response.ResponseType)
}

class SearchPresenter: SearchPresentationLogic {
  weak var viewController: SearchDisplayLogic?
  
  func presentData(response: Search.Model.Response.ResponseType) {
      switch response {
      case .some:
          print("response .some")
      case .presentTracks:
          print("response .presentTracks")
          viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.displayTracks)
      }
  }
  
}
