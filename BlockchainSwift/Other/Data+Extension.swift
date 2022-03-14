//
//  Extension.swift
//  BlockchainSwift
//
//  Created by Alex Tarragó on 09/05/2018.
//  Copyright © 2018 Dribba S.L. All rights reserved.
//

import UIKit

extension Data {
    func sha256() -> Data {
        guard let res = NSMutableData(length: Int(CC_SHA256_DIGEST_LENG