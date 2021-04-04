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
    let previousH