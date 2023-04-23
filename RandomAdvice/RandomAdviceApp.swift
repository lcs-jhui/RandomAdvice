//
//  RandomAdviceApp.swift
//  RandomAdvice
//
//  Created by Justin Hui on 22/4/2023.
//

import SwiftUI

@main
struct RandomAdviceApp: App {
    var body: some Scene {
        WindowGroup {
            AdviceView()
            //Make the database avaiable to all the child views through the environment
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
