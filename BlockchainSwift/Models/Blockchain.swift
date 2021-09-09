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
    
    init(