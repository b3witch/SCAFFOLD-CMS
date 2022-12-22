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
    func setupAppearance() {
        self.createTransactionButton.layer.cornerRadius = 4
        self.createTransactionButton.layer.masksToBounds = true
        
        self.mainBlockButton.layer.cornerRadius = 4
        self.mainBlockButton.layer.masksToBounds = true
        
        self.operationTextView.layer.cornerRadius = 4
        self.operationTextView.layer.masksToBounds = true
        
        self.chainTextView.layer.cornerRadius = 4
        self.chainTextView.layer.masksToBounds = true
    }
    
    // MARK: - Chain Handling methods
    func updateBlockchain() {
        let ourChain = self.manager.chain()
        var text = ""
        for block in ourChain {
            text.append(block.description() + "\n\n")
        }
        self.chainTextView.text = text
    }
    
    // MARK: - Button Action Handler methods
    @IBAction func sendTransactionButtonActionHandler(_ sender: Any) {
        let idx = self.manager.send(sender: "me", recipient: "myBelovedFriend", amount: 10)
        self.operationTextView.text = "Una nueva transacción se añadirá al bloque \(idx)\n" + self.operationTextView.text
        self.updateBlockchain()
    }
    @IBAction func mineBlockButtonActionHandler(_ sender: Any) {
        let start = CACurrentMediaTime()
        self.operationTextView.text = "Minando un nuevo bloque...\n" + self.operationTextView.text
        self.manager.mine(recipient: "me") { (block) in
            let time = String(format: "%.1f segundos", CACurrentMedia