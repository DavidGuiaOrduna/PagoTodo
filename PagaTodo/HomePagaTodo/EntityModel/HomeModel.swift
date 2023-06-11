//
//  HomeModel.swift
//  PagaTodo
//
//  Created by David Fernando Guia Orduña on 10/06/23.
//

import UIKit
import Foundation

struct ResultModel: Codable {
    
    var bankName: String?
    var description: String?
    var age: Int?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case bankName = "bankName"
        case description = "description"
        case url = "url"
    }
}
