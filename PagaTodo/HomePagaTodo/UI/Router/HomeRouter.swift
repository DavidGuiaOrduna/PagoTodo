//
//  HomeRouter.swift
//  PagaTodo
//
//  Created by David Fernando Guia Orduña on 10/06/23.
//

import UIKit
import Foundation

class HomeRouter: HomeRouterProtocol {
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func showDetail(detail: DetailBankModel) {
        
        let deatil = DetailBankRouter.createModule(detail: detail)
        let vc = UINavigationController(rootViewController: deatil)
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.viewController.present(vc, animated: true)
    }
}
