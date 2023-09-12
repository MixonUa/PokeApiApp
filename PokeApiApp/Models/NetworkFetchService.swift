//
//  NetworkFetchService.swift
//  PokeApiApp
//
//  Created by Михаил Фролов on 12.09.2023.
//

import Foundation

class NetworkFetchService {
    private let networkDataProvider: NetworkManager
    
    init(networkDataProvider: NetworkManager = NetworkManager()) {
        self.networkDataProvider = networkDataProvider
    }
    
    func requestPokemonNames(completion: @escaping ([PokemonNamesModel]?, Error?) -> Void) {
        let pokemonNamesURL = "https://raw.githubusercontent.com/MixonUa/JSON-PokemonNames/main/pokemons.json"
        networkDataProvider.requestData(urlString: pokemonNamesURL) { (data, error) in
            guard let data = data else { return }
            do {
                let answer = try JSONDecoder().decode([PokemonNamesModel].self, from: data)
                DispatchQueue.main.async {
                    completion(answer, nil)
                }
            } catch let decodingError {
                DispatchQueue.main.async {
                    completion(nil, decodingError)
                }
            }
        }
    }
    
    func requestPokemonPictureURLs(name: String, completion: @escaping (PokemonPictureURLsModel?, Error?) -> Void) {
        let baseURL = "https://pokeapi.co/api/v2/pokemon/"
        let fullURL = baseURL + name.lowercased()
        networkDataProvider.requestData(urlString: fullURL) { (data, error) in
            guard let data = data else { return }
            do {
                let answer = try JSONDecoder().decode(PokemonPictureURLsModel.self, from: data)
                DispatchQueue.main.async {
                    completion(answer, nil)
                }
            } catch let decodingError {
                DispatchQueue.main.async {
                    print("ERROR for url: \(fullURL)")
                    print(decodingError)
                    completion(nil, decodingError)
                }
            }
        }
    }
}
