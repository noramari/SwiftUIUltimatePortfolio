//
//  Bundle-Decodable.swift
//  SwiftUIUltimatePortfolio
//
//  Created by Noora Maeda on 2023/06/03.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(
        _ file: String,
        as type: T.Type = T.self,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys
    ) -> T {
        
        // this is a JSON file you’ve included in your app’s bundle, not some random file you’ve downloaded from the internet, so if you’ve managed to include a bad file in there it’s an unrecoverable programmer error and should really be caught by your tests.
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) in bundle due to missing key \(key.stringValue) - \(context.debugDescription).")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) in bundle due to type mismatch - \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) in bundle due to missing \(type) value - \(context.debugDescription).")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) in bundle due to it appears to be invalid JSON.")
        } catch {
            fatalError("Failed to decode \(file) in bundle: \(error.localizedDescription).")
        }
    }
}
