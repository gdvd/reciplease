//
//  OneFileManager.swift
//  intrip
//
//  Created by Gilles David on 23/12/2021.
//

import Foundation

class OneFileManager {
    
    public func ifFileExist(fileName: String) -> Bool{
        return FileManager().fileExists(atPath: documentsDirectory().path + "/" + fileName)
    }
      
    private func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(
            for: .documentDirectory, 
               in: .userDomainMask)
        print("============= DOC.PATH :",paths[0].path)
        return paths[0]
    }
    
    public func saveChecklistItems(fileName: String, itemToSave:ResponseRequest) {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(itemToSave)
            try data.write(
                to: documentsDirectory().appendingPathComponent(fileName), 
                options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    public func loadItems(fileName: String) -> ResponseRequest? {
        var responseRequest:ResponseRequest!
        let path = documentsDirectory().appendingPathComponent(fileName) 
        if let data = try? Data(contentsOf: path) {
          do {
              responseRequest = try JSONDecoder().decode(ResponseRequest.self, 
              from: data)
          } catch {
            print("Error decoding item array: \(error.localizedDescription)")
          }
        }
        return responseRequest
      }

}
