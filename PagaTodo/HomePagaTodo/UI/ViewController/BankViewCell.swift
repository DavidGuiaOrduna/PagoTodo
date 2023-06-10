//
//  BankViewCell.swift
//  PagaTodo
//
//  Created by David Fernando Guia Orduña on 10/06/23.
//

import UIKit

class BankViewCell: UITableViewCell {
    
    @IBOutlet private weak var bankLogo: UIImageView!{
        didSet {
            bankLogo.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet  weak var bankName: UILabel!
    @IBOutlet  weak var bankDescription: UILabel!{
        didSet {
            bankDescription.numberOfLines = 2
            bankDescription.adjustsFontSizeToFitWidth = true
        }
    }
    @IBOutlet  weak var bankAge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(bankInfo: ResultModel?) {
        setImage(urlImage: bankInfo?.url ?? "")
        bankName.text = bankInfo?.bankName
        bankDescription.text = bankInfo?.description
    }
    
    func setup(listBanks: Banks?) {
        setImage(urlImage: listBanks?.url ?? "")
        bankName.text = listBanks?.bankName
        bankDescription.text = listBanks?.description
    }

    func setImage(urlImage: String) {
        guard let url = URL(string: urlImage) else { return }
        let data = try? Data(contentsOf: url)
        if let imageData = data {
            let image = UIImage(data: imageData)
            bankLogo.image = image
        }
    }
}
