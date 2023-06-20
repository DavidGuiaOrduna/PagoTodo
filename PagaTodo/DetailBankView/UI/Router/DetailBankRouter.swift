//
//  DetailBankRouter.swift
//  PagaTodo
//
//  Created by David Fernando Guia Orduña on 10/06/23.
//

import Foundation
import UIKit

class DetailBankRouter: DetailBankRouterProtocol{
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func createModule(detail: DetailBankModel) -> UIViewController {
        let view = DetailBankViewController(nibName: "DetailBankViewController", bundle: Bundle(for: self))
        let router = DetailBankRouter(viewController: view)
        let interactor = DetailBankInteractor(detail: detail)
        let presenter = DetailBankPresenter(view: view, router: router, interactor: interactor)
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    func dismissModalBank() {
        viewController?.navigationController?.dismiss(animated: true, completion: nil)
    }
}
