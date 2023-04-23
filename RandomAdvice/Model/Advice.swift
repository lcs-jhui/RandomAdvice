//
//  Advice.swift
//  RandomAdvice
//
//  Created by Justin Hui on 22/4/2023.
//

import Blackbird
import Foundation

struct AdviceResponse: Codable {
    let slip: Advice
}

struct Advice: Identifiable, Codable, BlackbirdModel {
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var advice: String
}

let exampleAdvice = Advice(id: 148, advice: "Some people would be better off if they took their own advice.")
