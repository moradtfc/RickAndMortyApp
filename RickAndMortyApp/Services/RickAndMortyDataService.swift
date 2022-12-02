//
//  RickAndMortyDataService.swift
//  RickAndMortyApp
//
//  Created by Jesus Mora on 1/12/22.
//

import Foundation
import Combine

class RickAndMortyDataServices: RickAndMortyService{
    func getAllCharacters() -> AnyPublisher<Characters, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/character")!)
            .map({$0.data})
            .decode(type: Characters.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
