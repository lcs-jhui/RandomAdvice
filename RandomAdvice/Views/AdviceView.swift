//
//  AdviceView.swift
//  RandomAdvice
//
//  Created by Justin Hui on 22/4/2023.
//
import Blackbird
import SwiftUI

struct AdviceView: View {
    
    //MARK: Stored Properties
    
    //Current advice to display
    @State var currentAdvice: Advice?
    
    //Acces the connection to the database
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    
    var body: some View {
        NavigationView{
            
            VStack{

                Spacer()

            
            if let currentAdvice = currentAdvice {
                
                //Show the advice if it can be unwrapped
                
                    
                    
                    Text(currentAdvice.advice)
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                    
                    
                } else {
                    
                    //Show spinning wheel
                    ProgressView()
                    
                }
                
                Spacer()
                
                Button(action: {
                    Task{
                        //Get another advice
                        withAnimation{
                            currentAdvice = nil
                        }
                        currentAdvice = await NetworkService.fetch()
                    }
                }, label: {
                    Text("Become More Wise")
                })
                .buttonStyle(.borderedProminent)
                
                Button(action: {
                    Task{
                        //Write to the database
                        if let currentAdvice = currentAdvice {
                            try await db!.transaction { core in
                                try core.query("INSERT INTO Advice (id, advice) VALUES (?, ?)", currentAdvice.id, currentAdvice.advice)
                            }
                        }
                    }
                }, label: {
                    Text("Save For Later")
                })
                .tint(.green)
                .buttonStyle(.borderedProminent)
            
                
                
            }
            .navigationTitle("Random Advice")

        }
        .padding()
        .task {
            if currentAdvice == nil {
                currentAdvice = await NetworkService.fetch()
            }
        }
    }
}

struct AdviceView_Previews: PreviewProvider {
    static var previews: some View {
        AdviceView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
