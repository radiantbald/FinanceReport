//
//  FinanceReportApp.swift
//  FinanceReport
//
//  Created by Олег Попов on 17.02.2022.
//

import SwiftUI
import Firebase

let screen = UIScreen.main.bounds

@main
struct FinanceReportApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
    
     class AppDelegate: NSObject, UIApplicationDelegate {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            return true
        }
    }
}

