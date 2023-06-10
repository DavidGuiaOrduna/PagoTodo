//
//  SQLiteCommands.swift
//  PagaTodo
//
//  Created by David Fernando Guia Orduña on 10/06/23.
//

import Foundation
import SQLite

class SQLiteCommands {
    static var table = Table("listBanks")
    
    static let bankName = Expression<String>("bankName")
    static let description = Expression<String>("description")
    static let age = Expression<Int>("age")
    static let url = Expression<String>("url")

    //Creando Tabla
    static func createTable() {
        guard let database = SQLiteDataBase.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        
        do {
            // ifNotExists: true - Will NOT create a table if it alrady exists
            try database.run(table.create(ifNotExists: true) { table in
                table.column(bankName, primaryKey: true)
                table.column(description)
                table.column(age)
                table.column(url)
            })
        } catch {
            print("Table already exists \(error)")
        }
    }
    
    // Insert Row
    static func insertRow(BankValues: Banks) -> Bool? {
        guard let database = SQLiteDataBase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        do {
            try database.run(table.insert(bankName <- BankValues.bankName, description <- BankValues.description, age <- BankValues.age, url <- BankValues.url))
            return true
        } catch let Result.error(message, code, statement) where code == SQLITE_CONSTRAINT {
            print("Inser row failed: \(message), in \(String(describing: statement))")
            return false
        } catch let error {
            print("Insertion failed: \(error)")
            return false
        }
    }
    
    //Present Row
    static func presenRows() ->[Banks]? {
        guard let database = SQLiteDataBase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        //bank Array
        var bankArray = [Banks]()
        
        //Sorting data in descending orde by
        table = table.order(bankName.desc)
        
        do {
            for bank in try database.prepare(table) {
                let bankNameValue = bank[bankName]
                let descriptionValue = bank[description]
                let ageValue = bank[age]
                let urlValue = bank[url]
                
                // Create object
                let bankObject = Banks(bankName: bankNameValue, description: descriptionValue, age: ageValue, url: urlValue)
                
                // Add objet to an array
                bankArray.append(bankObject)
                
                print("bankName \(bank[bankName]), description \(bank[description]), age \(bank[age]), url \(bank[url])  ")
            }
        } catch {
            print("Presente row error \(error)")
        }
        return bankArray
    }
}
