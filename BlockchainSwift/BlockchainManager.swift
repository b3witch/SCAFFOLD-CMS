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
        return blockchain.createTrans