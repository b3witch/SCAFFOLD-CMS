//
//  Transaction.swift
//  BlockchainSwift
//
//  Created by Alex Tarragó on 09/05/2018.
//  Copyright © 2018 Dribba S.L. All rights reserved.
//

import UIKit

class Transaction: Codable {
    let sender: String
    let recipient: String
    let amount: Int 
    
    init(sender: String, recipient: String, amount: Int) {
        self.sender = sender
        self.recipient =