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
           
            TabView{
                AdviceView()
                    .tabItem{
                        Label("Advice", systemImage: "book.closed")
                    }
                
                FavouritesView()
                    .tabItem{
                        Label("Favourites", systemImage: "heart")
                    }
            }
            //Make the database avaiable to all child views through the environment
            .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
