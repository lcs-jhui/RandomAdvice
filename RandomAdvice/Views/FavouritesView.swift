//
//  FavouritesView.swift
//  RandomAdvice
//
//  Created by Justin Hui on 22/4/2023.
//
import Blackbird
import SwiftUI

struct FavouritesView: View {
    
    //MARK: Stored Properties
    
    //List of favourite advices
    @BlackbirdLiveModels ({ db in
        try await Advice.read(from: db)
    }) var favouriteAdvices
    
    //MARK: Computed Properties
    var body: some View {
        NavigationView{
            List(favouriteAdvices.results) { currentAdvice in
                VStack(alignment: .leading) {
                    Text(currentAdvice.advice)
                }
            }
            .navigationTitle("Favourites")
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
