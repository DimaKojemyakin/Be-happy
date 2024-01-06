//
//  Be_happyApp.swift
//  Be happy
//
//  Created by Дима Кожемякин on 22.12.2023.
//

import SwiftUI

@main
struct Be_happyApp: App {
    @StateObject var securityFunces = SecurityFunces()
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(securityFunces)
        }
    }
}
