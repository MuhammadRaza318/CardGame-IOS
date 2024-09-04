//
//  CardModel.swift
//  CardGame
//
//  Created by Raza on 04/09/2024.
//

import Foundation

struct CardModel {
    let id: Int
    var imageName: String
    var isHidden: Bool = false
    var score: Int
}

struct DeckModel {
    let dId: Int
    var dImageName: String
    var score: Int
}
