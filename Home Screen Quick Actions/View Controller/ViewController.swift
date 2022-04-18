//
//  ViewController.swift
//  Home Screen Quick Actions
//
//  Created by Bhanuteja on 14/04/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        HomeScreenQuickActionsModel.shared.homeScreenDynamicQuickActions()
    }

    @IBAction func sendMoneyClicked(_ sender: Any) {
        let sendMoneyVC = self.storyboard?.instantiateViewController(withIdentifier: "SendMoneyVC") as! SendMoneyVC
        self.navigationController?.pushViewController(sendMoneyVC, animated: true)
    }

    @IBAction func scanAndPayClicked(_ sender: Any) {
        let scanAndPayVC = self.storyboard?.instantiateViewController(withIdentifier: "ScanAndPayVC") as! ScanAndPayVC
        self.navigationController?.pushViewController(scanAndPayVC, animated: true)
    }

    @IBAction func bankBalanceClicked(_ sender: Any) {
        let bankBalanceVC = self.storyboard?.instantiateViewController(withIdentifier: "BankBalanceVC") as! BankBalanceVC
        self.navigationController?.pushViewController(bankBalanceVC, animated: true)
    }

    @IBAction func transactionsClicked(_ sender: Any) {
        let transactionsVC = self.storyboard?.instantiateViewController(withIdentifier: "TransactionsVC") as! TransactionsVC
        self.navigationController?.pushViewController(transactionsVC, animated: true)
    }
}
