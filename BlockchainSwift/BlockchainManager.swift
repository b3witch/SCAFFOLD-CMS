//
//  BlockchainManager.swift
//  BlockchainSwift
//
//  Created by Alex Tarragó on 09/05/2018.
//  Copyright © 2018 Dribba S.L. All rights reserved.
//

import UIKit

class BlockchainManager {
    let blockchain = Blockchain()
    
    // MARK: - Crear una nueva transacción
    func send(sender: String, recipient: String, amount: Int) -> Int {
        return blockchain.createTransaction(sender: sender, recipient: recipient, amount: amount)
    }
    
    // MARK: - Minar un nuevo bloque
    func mine(recipient: String, completion: ((Block) -> Void)?) {
        DispatchQueue.global(qos: .default).async {
            let lastProof = self.blockchain.getLastBlock().proof
            let proof = Blockchain.proofOfWork(lastProof: lastProof)
            _ = self.blockchain.createTransaction(sender: "me", recipient: recipient, amount: 1)
            let block = self.blockchain.createBlock(proof: proof)
            DispatchQueue.main.async(execute: {
                completion?(block)
            })
        }
    }
    
    // MARK: - Añadir un nuevo bloque a la cadena
    func chain() -> [Block] {
        return blockchain.ourChain
    }
}
