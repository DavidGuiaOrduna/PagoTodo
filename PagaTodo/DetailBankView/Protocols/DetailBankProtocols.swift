//
//  DetailBankProtocols.swift
//  PagaTodo
//
//  Created by David Fernando Guia Orduña on 10/06/23.
//

import Foundation
import RxSwift

protocol DetailBankRouterProtocol: AnyObject {
    func dismissModalBank()
}

protocol DetailBankPresenterProtocol: AnyObject {
    func viewDidLoad()
    func getDetailBank(detail: DetailBankModel)
    func dismissModalBank()
}

protocol DetailBankInteractorProtocol: AnyObject {
    var presenter: DetailBankPresenterProtocol? { get set }
    func getData()
}

protocol DetailBankViewProtocol: AnyObject {
    var presenter: DetailBankPresenterProtocol? { get set }
    func getDetailBank(detail: DetailBankModel)
}
