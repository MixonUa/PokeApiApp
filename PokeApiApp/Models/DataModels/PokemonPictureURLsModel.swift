//
//  PokemonPictureURLsModel.swift
//  PokeApiApp
//
//  Created by Михаил Фролов on 12.09.2023.
//

import Foundation

struct PokemonPictureURLsModel: Codable {
    var sprites: Sprites
}
struct Sprites: Codable {
    var other: Other
}
struct Other: Codable {
    var dream_world: DreamWorld
}
struct DreamWorld: Codable {
    var front_default: String
}
