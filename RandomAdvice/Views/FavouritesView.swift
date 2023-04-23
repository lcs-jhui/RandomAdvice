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
    
    //Acces the connection to the database
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    
    //MARK: Computed Properties
    var body: some View {
        NavigationView{
            List {
                
                
                ForEach(favouriteAdvices.results) { currentAdvice in
                    VStack(alignment: .leading) {
                        Text(currentAdvice.advice)
                    }
                }
                .onDelete(perform: removeRows)
            }
            .navigationTitle("Favourites")
        }
    }
    
    //MARK: Functions
    func removeRows(at offsets: IndexSet) {
        
        Task{
            try await db!.transaction { core in
                
                //Get ID of item to be deleted
                var idList = ""
                for offset in offsets {
                    idList += "\(favouriteAdvices.results[offset].id),"
                }
                
                //Remove final comma
                print(idList)
                idList.removeLast()
                print(idList)
                
                //Delete the row from the database
                try core.query("DELETE FROM Advice WHERE id IN (?)", idList)
            }
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
