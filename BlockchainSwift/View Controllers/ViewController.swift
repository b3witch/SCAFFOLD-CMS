//
//  ViewController.swift
//  BlockchainSwift
//
//  Created by Alex Tarragó on 09/05/2018.
//  Copyright © 2018 Dribba S.L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operationTextView: UITextView!
    @IBOutlet weak var chainTextView: UITextView!
    @IBOutlet weak var createTransactionButton: UIButton!
    @IBOutlet weak var mainBlockButton: UIButton!
    private let manager = BlockchainManager()

    // MARK: - View lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAppearance()
    }
    
    // MARK: - Appearance methods
    func setupAppearance