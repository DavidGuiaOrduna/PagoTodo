//
//  HomeInteractor.swift
//  PagaTodo
//
//  Created by David Fernando Guia Orduña on 10/06/23.
//

import Foundation
import Alamofire


class HomeInteractor: HomeInteractorProtocol {
    
    weak var presenter: HomePresenterProtocol?
    
    private let baseUrl = "https://dev.obtenmas.com/catom/api/challenge/banks"
    typealias testCallBack = (_ testData: [ResultModel]?, _ status: Bool, _ message:String) -> Void
    var callBack: testCallBack?
    
    func getService() {
        let listBanksArray = SQLiteCommands.presenRows()
        let total = listBanksArray?.count ?? 0
        if total == 0 {
            createTable()
            AF.request(self.baseUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
                guard let data = responseData.data else {
                    self.callBack?(nil, false, "")
                    return }
                do {
                    let dataInfo = try JSONDecoder().decode([ResultModel].self, from: data)
                    self.callBack?(dataInfo, true,"")
                    self.presenter?.didGetResponseModel(response: dataInfo)
                    self.getBankDatabase(dataInfo: dataInfo)
                } catch {
                    self.callBack?(nil, false, error.localizedDescription)
                    print("error = \(error)")
                }
            }
        } else {
            presenter?.didGetResponseModel(listBanks: listBanksArray ?? [])
        }
    }
    
    func completionHandler(callBack: @escaping testCallBack) {
        self.callBack = callBack
    }
    
    func createTable() {
        let database = SQLiteDataBase.sharedInstance
        database.createTable()
    }
    
    func getBankDatabase(dataInfo: [ResultModel]) {
        
        for info in dataInfo {
            let banks = Banks(bankName: info.bankName ?? "", description: info.description ?? "", age: info.age ?? 0, url: info.url ?? "")
            insertBanks(banks: banks)
        }
    }
    
    func insertBanks(banks: Banks) {
        let isDataBase = SQLiteCommands.insertRow(BankValues: banks)
        print("Info--->>> \(String(describing: isDataBase))")
    }
}
