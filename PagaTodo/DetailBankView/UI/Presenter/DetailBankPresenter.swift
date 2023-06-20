//
//  DetailBankPresenter.swift
//  PagaTodo
//
//  Created by David Fernando Guia Orduña on 10/06/23.
//

import Foundation

class DetailBankPresenter: DetailBankPresenterProtocol {
    
    weak private var view: DetailBankViewProtocol?
    let router: DetailBankRouterProtocol?
    let interactor: DetailBankInteractorProtocol?
    
    init(view: DetailBankViewProtocol, router: DetailBankRouterProtocol, interactor: DetailBankInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        interactor?.getData()
    }
    
    func getDetailBank(detail: DetailBankModel) {
        view?.getDetailBank(detail: detail)
    }
    
    func dismissModalBank() {
        router?.dismissModalBank()
    }
}
