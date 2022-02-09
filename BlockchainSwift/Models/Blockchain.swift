//
//  Blockchain.swift
//  BlockchainSwift
//
//  Created by Alex Tarragó on 09/05/2018.
//  Copyright © 2018 Dribba S.L. All rights reserved.
//

import UIKit

class Blockchain {
    private var pendingTransactions: [Transaction] = []
    var ourChain: [Block] = []
    
    init() {
        createBlock(proof: 80, previousHash: "0".data(using: .utf8))
    }
    
    @discardableResult
    func createBlock(proof: Int, previousHash: Data? = nil) -> Block {
        let prevHash: Data
        if let previousHash = previousHash {
            prevHash = previousHash
        } else {
            prevHash = getLastBlock().hash()
        }
        let block = Block(index: ourChain.count, transactions: pendingTransactions, proof: proof, previousHash: prevHash)
        pendingTransactions.removeAll()
        ourChain.append(block)
        return block
    }
    
    func createTransaction(sender: String, recipient: String, amount: Int) -> Int {
        let transaction = Transaction(sender: sender, recipient: recipient, amount: amount)        
        pendingTransactions.append(transaction)
        return getLastBlock().index + 1
    }
    
    func getLastBlock() -> Block {
        guard let last = ourChain.last else {
            fatalError("Nuestra cadena ha de contener, al menos, un bloque original.")
        }
        return last
    }
    
    // MARK: - Algoritmo simple de validación de bloques
    class func proofOfWork(lastProof: Int) -> Int {
        var proof: Int = 0
        while !validProof(lastProof: lastProof, proof: proof) {
            proof += 1
        }
        return proof
    }
    class func validProof(lastProof: Int, proof: Int) -> Bool {
        guard let result = String("\(l