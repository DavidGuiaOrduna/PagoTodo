//
//  ViewController.swift
//  PagaTodo
//
//  Created by David Fernando Guia Orduña on 10/06/23.
//

import UIKit
import RxSwift
import RxCocoa
import SQLite

class HomeViewController: UIViewController, HomeViewProtocol {
    
    @IBOutlet private weak var pictureIMage: UIImageView! {
        didSet {
            pictureIMage.layer.cornerRadius = 5
        }
    }
    @IBOutlet private weak var bankTable: UITableView!
    
    var presenter: HomePresenterProtocol?
    private var bankInfo: [ResultModel]?
    private var listBanks: [Banks]?
    private var isShowViewDetail: Bool = true
    private let disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        view.backgroundColor = UIColor.backGroundView
    }

    func getDataBack(response: [ResultModel]) {
        bankInfo = response
        setupTabelView()
    }
    
    func getDataBack(listBank: [Banks]) {
        listBanks = listBank
        setupTabelView()
    }
    func setupTabelView() {
        bankTable.dataSource = self
        bankTable.delegate = self
        bankTable.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listBanks?.count != 0 && listBanks != nil {
            return listBanks?.count ?? 0
        } else if bankInfo?.count != 0 {
            return bankInfo?.count ?? 0
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BankViewCell
        if listBanks?.count != 0 && listBanks != nil {
            let list = listBanks?[indexPath.row]
            cell.setup(listBanks: list)
        } else if bankInfo?.count != 0{
            let bankInfo = bankInfo?[indexPath.row]
            cell.setupCell(bankInfo: bankInfo)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if listBanks?.count != 0 && listBanks != nil {
            let list = listBanks?[indexPath.row]
            let detail = DetailBankModel(bankName: list?.bankName, url: list?.url)
            presenter?.showDetail(detail: detail)
        } else if bankInfo?.count != 0{
            let bankInfo = bankInfo?[indexPath.row]
            let detail = DetailBankModel(bankName: bankInfo?.bankName, url: bankInfo?.url)
            presenter?.showDetail(detail: detail)
        }
    }
}

extension UIColor {
    static var backGroundButton: UIColor {
        return UIColor(red: 97.0 / 255.0, green: 104.0 / 255.0, blue: 219.0 / 255.0, alpha: 1.0)
    }
    
    static var backGroundView: UIColor {
        return UIColor(red: 244.0 / 255.0, green: 243.0 / 255.0, blue: 242.0 / 255.0, alpha: 1.0)
    }
}
