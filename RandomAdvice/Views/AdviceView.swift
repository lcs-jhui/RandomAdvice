//
//  AdviceView.swift
//  RandomAdvice
//
//  Created by Justin Hui on 22/4/2023.
//

import SwiftUI

struct AdviceView: View {
    
    //MARK: Stored Properties
    
    //Current advice to display
    @State var currentAdvice: Advice?
    
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
                    Text("Fetch another one")
                })
                .buttonStyle(.borderedProminent)
                
            }
            .navigationTitle("Random Advice")

        }
        .padding()
        .task {
            currentAdvice = await NetworkService.fetch()
        }
    }
}

struct AdviceView_Previews: PreviewProvider {
    static var previews: some View {
        AdviceView()
    }
}
