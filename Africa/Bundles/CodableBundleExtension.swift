//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Harshvardhan Basava on 21/05/21.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        //Step 1 - Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to load \(file) in bundle.")
        }
        //Step 2 - Create a property for the data
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file) from bundle.")
        }
        //Step 3 - Create a decoder
        let decoder = JSONDecoder()
        //Step 4 - Create a property of the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to decode \(file) from bundle.")
        }
        //Step 5 - Return the ready to use data
        return loaded
    }
}
