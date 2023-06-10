//
//  HomeModule.swift
//  PagaTodo
//
//  Created by David Fernando Guia Orduña on 10/06/23.
//

import UIKit
import Foundation

class HomeModule {
     
    static func building() -> UIViewController {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let router = HomeRouter(viewController: viewController)
        let interactor = HomeInteractor()
        let presenter = HomePresenter(viewController: viewController, interactor: interactor, router: router)
        viewController.presenter = presenter
        interactor.presenter = presenter
        return viewController
    }
}
