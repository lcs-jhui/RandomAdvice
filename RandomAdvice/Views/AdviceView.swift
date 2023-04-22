//
//  AdviceView.swift
//  RandomAdvice
//
//  Created by Justin Hui on 22/4/2023.
//

import SwiftUI

struct AdviceView: View {
    var body: some View {
        NavigationView{
            
            VStack{
                
                Text("Buy something you would use, not something useless.")
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .navigationTitle("Random Advice")
            
        }
    }
}

struct AdviceView_Previews: PreviewProvider {
    static var previews: some View {
        AdviceView()
    }
}
