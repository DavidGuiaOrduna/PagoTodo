//
//  SQLiteDataBase.swift
//  PagaTodo
//
//  Created by David Fernando Guia Orduña on 10/06/23.
//

import Foundation
import SQLite

class SQLiteDataBase {
    static let sharedInstance = SQLiteDataBase()
    var database: Connection?
    
    private init() {
        //Crear conecxión con la base de datos
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            
            let fileUrl = documentDirectory.appendingPathComponent("dataBaseBanks").appendingPathExtension("sqlite3")
            print("fileUrl--> \(fileUrl)")
            database = try Connection(fileUrl.path)
        } catch {
            print("Creating connection to database error: \(error)")
        }
    }
    
    //Creando tabla
    func createTable(){
        SQLiteCommands.createTable()
    }
}
