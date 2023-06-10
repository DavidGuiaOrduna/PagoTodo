//
//  HomePresenter.swift
//  PagaTodo
//
//  Created by David Fernando Guia Orduña on 10/06/23.
//

import Foundation
import RxSwift

class HomePresenter: HomePresenterProtocol {
    
    
    weak private var viewController: HomeViewProtocol?
    let router: HomeRouterProtocol?
    var interactor: HomeInteractorProtocol
    
    init(viewController: HomeViewProtocol, interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.viewController = viewController
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        
        interactor.getService()
    }
    
    func didGetResponseModel(response: [ResultModel]) {
        viewController?.getDataBack(response: response)
    }
    
    func didGetResponseModel(listBanks: [Banks]) {
        viewController?.getDataBack(listBank: listBanks)
    }
}

