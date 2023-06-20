//
//  HomeProtocols.swift
//  PagaTodo
//
//  Created by David Fernando Guia Orduña on 10/06/23.
//

import UIKit
import Foundation

protocol HomeRouterProtocol: AnyObject {
    func showDetail(detail: DetailBankModel)
}


protocol HomePresenterProtocol: AnyObject {
    func viewDidLoad()
    func didGetResponseModel(response: [ResultModel])
    func didGetResponseModel(listBanks: [Banks])
    func showDetail(detail: DetailBankModel)
}

protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set}
    func getService()
    
}

//MARK: Presenter - View
protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set}
    func getDataBack(response: [ResultModel])
    func getDataBack(listBank: [Banks])
}
