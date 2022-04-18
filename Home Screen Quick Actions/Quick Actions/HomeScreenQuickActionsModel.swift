//
//  HomeScreenQuickActionsModel.swift
//  Home Screen Quick Actions
//
//  Created by Bhanuteja on 14/04/22.
//

import UIKit


enum HomeScreenQuickActionsData {
    
    static let homeQuickActionUniqeID = Bundle.main.bundleIdentifier! + ".quickAction"
    case sendMoney
    case scanAndPay
    case bankBalance
    case transactions

    var type: String {
        switch self {
        case .sendMoney:
            return HomeScreenQuickActionsData.homeQuickActionUniqeID + ".SendMoney"
        case .scanAndPay:
            return HomeScreenQuickActionsData.homeQuickActionUniqeID + ".ScanAndPay"
        case .bankBalance:
            return HomeScreenQuickActionsData.homeQuickActionUniqeID + ".BankBalance"
        case .transactions:
            return HomeScreenQuickActionsData.homeQuickActionUniqeID + ".Transactions"
        }
    }

    var localizedTitle: String {
        switch self {
        case .sendMoney:
            return "Send Money"
        case .scanAndPay:
            return "Scan & Pay"
        case .bankBalance:
            return "Bank Balance"
        case .transactions:
            return "Transactions"
        }
    }
    
    var localizedSubtitle: String {
        switch self {
        case .sendMoney:
            return "Using mobile number"
        case .scanAndPay:
            return "Scan any UPI's QR code"
        case .bankBalance:
            return ""
        case .transactions:
            return ""
        }
    }
    
    var icon: UIApplicationShortcutIcon {
        switch self {
        case .sendMoney:
            return UIApplicationShortcutIcon(systemImageName: "indianrupeesign.square.fill")
        case .scanAndPay:
            return UIApplicationShortcutIcon(templateImageName: "scan_and_pay")
        case .bankBalance:
            return UIApplicationShortcutIcon(type: .home)
        case .transactions:
            return UIApplicationShortcutIcon(type: .date)
        }
    }
    /*
    var userInfo: [String : NSSecureCoding] {
        switch self {
        case .sendMoney:
            <#code#>
        case .scanAndPay:
            <#code#>
        case .bankBalance:
            <#code#>
        case .transactions:
            <#code#>
        }
    }*/
}

class HomeScreenQuickActionsModel: NSObject {

    static let shared = HomeScreenQuickActionsModel()

    func homeScreenDynamicQuickActions() {
        clearHomeScreenQuickActions()
        addHomeScreenQuickActions(.sendMoney, application: .shared)
        addHomeScreenQuickActions(.scanAndPay, application: .shared)
        addHomeScreenQuickActions(.bankBalance, application: .shared)
        addHomeScreenQuickActions(.transactions, application: .shared)
    }

    fileprivate func clearHomeScreenQuickActions() {
        UIApplication.shared.shortcutItems?.removeAll()
    }

    func addHomeScreenQuickActions(_ type: HomeScreenQuickActionsData, application: UIApplication) {
        removeHomeScreenQuickActions(type, application: .shared)

        var shortcutItems = application.shortcutItems ?? []
        switch type {
        case .sendMoney:
            let shortCutItem = UIMutableApplicationShortcutItem(type: HomeScreenQuickActionsData.sendMoney.type,
                                                                localizedTitle: HomeScreenQuickActionsData.sendMoney.localizedTitle,
                                                                localizedSubtitle: HomeScreenQuickActionsData.sendMoney.localizedSubtitle,
                                                                icon: HomeScreenQuickActionsData.sendMoney.icon,
                                                                userInfo: nil)
            shortcutItems.append(shortCutItem)
        case .scanAndPay:
            let shortCutItem = UIMutableApplicationShortcutItem(type: HomeScreenQuickActionsData.scanAndPay.type,
                                                                localizedTitle: HomeScreenQuickActionsData.scanAndPay.localizedTitle,
                                                                localizedSubtitle: HomeScreenQuickActionsData.scanAndPay.localizedSubtitle,
                                                                icon: HomeScreenQuickActionsData.scanAndPay.icon,
                                                                userInfo: nil)
            shortcutItems.append(shortCutItem)
        case .bankBalance:
            let shortCutItem = UIMutableApplicationShortcutItem(type: HomeScreenQuickActionsData.bankBalance.type,
                                                                localizedTitle: HomeScreenQuickActionsData.bankBalance.localizedTitle,
                                                                localizedSubtitle: HomeScreenQuickActionsData.bankBalance.localizedSubtitle,
                                                                icon: HomeScreenQuickActionsData.bankBalance.icon,
                                                                userInfo: nil)
            shortcutItems.append(shortCutItem)
        case .transactions:
            let shortCutItem = UIMutableApplicationShortcutItem(type: HomeScreenQuickActionsData.transactions.type,
                                                                localizedTitle: HomeScreenQuickActionsData.transactions.localizedTitle,
                                                                localizedSubtitle: HomeScreenQuickActionsData.transactions.localizedSubtitle,
                                                                icon: HomeScreenQuickActionsData.transactions.icon,
                                                                userInfo: nil)
            shortcutItems.append(shortCutItem)
        }
        application.shortcutItems = shortcutItems
    }

    func removeHomeScreenQuickActions(_ type: HomeScreenQuickActionsData, application: UIApplication) {
        guard var dynamicShortcutItems = application.shortcutItems,
              let index = (dynamicShortcutItems.firstIndex { $0.type == type.type }) else { return }
        dynamicShortcutItems.remove(at: index)
        application.shortcutItems = dynamicShortcutItems
    }

    func handleQuickActionTap(_ shortcutItem: UIApplicationShortcutItem, window: UIWindow) {
        let main = UIStoryboard.init(name: "Main", bundle: .main)
        var viewController = UIViewController()

        switch shortcutItem.type {
        case HomeScreenQuickActionsData.sendMoney.type:
            viewController = main.instantiateViewController(withIdentifier: "SendMoneyVC") as! SendMoneyVC
        case HomeScreenQuickActionsData.scanAndPay.type:
            viewController = main.instantiateViewController(withIdentifier: "ScanAndPayVC") as! ScanAndPayVC
        case HomeScreenQuickActionsData.bankBalance.type:
            viewController = main.instantiateViewController(withIdentifier: "BankBalanceVC") as! BankBalanceVC
        case HomeScreenQuickActionsData.transactions.type:
            viewController = main.instantiateViewController(withIdentifier: "TransactionsVC") as! TransactionsVC
        default:
            print("Something went wrong")
        }
        
        if let homeVC = window.rootViewController as? UINavigationController {
            homeVC.pushViewController(viewController, animated: true)
        }
    }
}
