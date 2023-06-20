//
//  DetailBankInteractor.swift
//  PagaTodo
//
//  Created by David Fernando Guia Orduña on 10/06/23.
//

import Foundation

class DetailBankInteractor: DetailBankInteractorProtocol {
    
    var presenter: DetailBankPresenterProtocol?
    private var detail: DetailBankModel
    
    init(detail: DetailBankModel) {
        self.detail = detail
    }

    func getData() {
        presenter?.getDetailBank(detail: detail)
    }
}
