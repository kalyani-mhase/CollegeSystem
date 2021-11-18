//
//  database.swift
//  CollegeSystem
//
//  Created by Mac on 14/10/21.
//

import Foundation
import SQLite3
class database{
    var db : OpaquePointer?
    init()
    {
        db = createAndOpen()
        createTable()
    }
    func createAndOpen() -> OpaquePointer? {
        var db : OpaquePointer?
        do{
            
            let dir = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("college.sqlite")
            if sqlite3_open(dir.path, &db) == SQLITE_OK{
         print("open database successfully")
                print("Database path .\(dir.path)")
                return db
        }
            else{
                print("unable to open database")
            }
    }
        catch{
            print("Unable to get document Directory \(error.localizedDescription)")
        }
        return nil
}
    func createTable() {
        var createStatement : OpaquePointer?
        var createQuery = "CREATE TABLE IF NOT EXISTS collegeTable(roll INTEGER PRIMERY KEY, name TEXT, collegeName TEXT, className TEXT)"
        if sqlite3_prepare_v2(db, createQuery, -1, &createStatement, nil) == SQLITE_OK{
            if sqlite3_step(createStatement) == SQLITE_DONE{
                print("create table succefully")
            }
            else{
                print("unable to create table")
            }
        }
        else{
            print("unable to prepard statement for table")
        }
        sqlite3_finalize(createStatement)
    }
    func insert(roll: Int,name: String,collegeName: String,className: String)  {
        var insertStatement : OpaquePointer?
        var insertQuery = "INSERT INTO collegeTable(roll,name,collegeName,className) VALUES(?,?,?,?)"
        if sqlite3_prepare_v2(db, insertQuery, -1, &insertStatement, nil) == SQLITE_OK{
            //rollno
            let rollno = sqlite3_bind_int(insertStatement, 1, Int32(roll))
            //name
            sqlite3_bind_text(insertStatement, 2, (name as NSString).utf8String, -1, nil)
            //collegeName
            sqlite3_bind_text(insertStatement, 3, (collegeName as NSString).utf8String, -1, nil)
            //className
            sqlite3_bind_text(insertStatement, 4, (className as NSString).utf8String, -1, nil)
            if sqlite3_step(insertStatement) == SQLITE_DONE{
                print("insert succefully")
            }
            else{
                print("unable to insert")
            }
        }
        else{
            print("unable to prepared statement")
        }
        sqlite3_finalize(insertStatement)
    }
    func display()  {
        var selectStatement : OpaquePointer?
        var selectQuery = "SELECT * FROM collegeTable"
        if sqlite3_prepare_v2(db, selectQuery, -1, &selectStatement, nil) == SQLITE_OK{
            while sqlite3_step(selectStatement) == SQLITE_ROW {
                //rollno
                let rollNo = Int(sqlite3_column_int(selectStatement, 0))
                let name = String(describing: String(cString: sqlite3_column_text(selectStatement, 1)))
                let collegeName = String(describing: String(cString: sqlite3_column_text(selectStatement, 2)))
                let className = String(describing: String(cString: sqlite3_column_text(selectStatement, 3)))
                print("Query result")
                print("\(rollNo),\(name),\(collegeName),\(className)")
                
                
            }
        }
        else{
            print("unable to display")
        }
        sqlite3_finalize(selectStatement)
    }
}

