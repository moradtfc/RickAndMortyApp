//
//  Characters.swift
//  RickAndMortyApp
//
//  Created by Jesus Mora on 1/12/22.
//

import Foundation

enum CharacterViewModelState {
case initial
case loading
case loaded(characters:Characters)
case error(errorMessage:String)
    
}

struct Characters: Codable {
    let info: Info
    let results: [Results]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
}

struct Results: Identifiable, Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Location: Codable {
    let name: String
    let url: String
}
