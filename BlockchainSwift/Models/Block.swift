//
//  Block.swift
//  BlockchainSwift
//
//  Created by Alex Tarragó on 09/05/2018.
//  Copyright © 2018 Dribba S.L. All rights reserved.
//

import Foundation

struct Block: Codable {
    let index: Int
    let timestamp: Double
    let transactions: [Transaction]
    let proof: Int
    let previousHash: Data
    
    // MARK: - Generamos el hash para este bloque
    func hash() -> Data {
        let encoder = JSONEncoder()
        let data = try! encoder.encode(self)
        return data.sha256()
    }
    
    // MARK: - Información básica acerca de este bloque
    func description() -> String {
        return "Bloque #\(index) (creado el \(timestamp)), con \(transactions.count) transacciones"
    }
    
    init(index: Int, transactions: [Transaction], proof: Int, previousHash: Data) {
        self.index = index
        self.transactions = transactions
        self.proof = proof
        self.previousHash = previousHash
        
        // Generamos el timestamp para