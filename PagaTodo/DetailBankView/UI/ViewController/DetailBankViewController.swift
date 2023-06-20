//
//  DetailBankView.swift
//  PagaTodo
//
//  Created by David Fernando Guia Orduña on 10/06/23.
//

import Foundation
import UIKit

class DetailBankViewController: UIViewController, DetailBankViewProtocol, UIGestureRecognizerDelegate {
    
    @IBOutlet private weak var pictureImage: UIImageView! {
        didSet {
            pictureImage.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet private weak var bankName: UILabel! {
        didSet {
            bankName.font = UIFont.boldSystemFont(ofSize: 20)
            bankName.textColor = UIColor.white
        }
    }
    
    var presenter: DetailBankPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gesture()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension DetailBankViewController {
    
    func getDetailBank(detail: DetailBankModel){
        bankName.text = detail.bankName
        setImage(urlImage: detail.url ?? "")
    }
        
    func setImage(urlImage: String) {
        guard let url = URL(string: urlImage) else { return }
        let data = try? Data(contentsOf: url)
        if let imageData = data {
            let image = UIImage(data: imageData)
            pictureImage.image = image
        }
    }
    
    func gesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        presenter?.dismissModalBank()
    }
}
