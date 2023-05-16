//
//  DBHelper.swift
//  GolfCounter Watch App
//
//  Created by 윤재 on 2023/05/16.
//

import Foundation
import SQLite3

class DBHelper {
    static let shared  = DBHelper()
    var db: OpaquePointer?
    let databaseName = "scoreDB.sqlite"
    
    init() {
        self.db = createDB()
    }
    
    deinit {
        sqlite3_close(db)
    }
    
    private func createDB() -> OpaquePointer? {
       var db: OpaquePointer? = nil
       
        do {
           let dbPath: String = try FileManager.default.url(
                                                   for: .documentDirectory,
                                                   in: .userDomainMask,
                                                   appropriateFor: nil,
                                                   create: false
                                               ).appendingPathComponent(databaseName).path
           
           if sqlite3_open(dbPath, &db) == SQLITE_OK {
               print("Successfully created DB. Path: \(dbPath)")
               return db
           }
       } catch {
           print("Error while creating Database -\(error.localizedDescription)")
       }
       return nil
   }
}
