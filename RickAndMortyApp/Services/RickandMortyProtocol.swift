//
//  RickandMortyProtocol.swift
//  RickAndMortyApp
//
//  Created by Jesus Mora on 1/12/22.
//

import Foundation
import Combine

protocol RickAndMortyService {
    func getAllCharacters () -> AnyPublisher<Characters,Error>
}
