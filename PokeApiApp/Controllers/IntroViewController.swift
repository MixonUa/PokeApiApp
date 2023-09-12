//
//  IntroViewController.swift
//  PokeApiApp
//
//  Created by Михаил Фролов on 09.09.2023.
//

import UIKit

class IntroViewController: UIViewController {
    let storageManager = PersonalStorageManager()
    let downloadManager = NetworkFetchService()
    
    var pokemonNames: [PokemonNamesModel] = []
    var pokemonPictureUrls: [PokemonPictureURLsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPokeNames()
    }
    
    private func loadPokeNames() {
        downloadManager.requestPokemonNames(completion: { (data, error) in
            if let data = data {
                self.pokemonNames = data
                self.loadPokePicturesURLs()
            }
        })
    }
    
    private func loadPokePicturesURLs() {
        pokemonNames.forEach { (data) in
            downloadManager.requestPokemonPictureURLs(name: data.name) { (data, error) in
                if let data = data {
                    self.pokemonPictureUrls.append(data)
                }
            }
        }
    }
    
    @IBAction func clearProfileButtonPressed(_ sender: Any) {
        storageManager.remove(for: .country)
        storageManager.remove(for: .name)
    }
    // MARK: - Navigation
    @IBAction func ComeOnButtonPressed(_ sender: Any) {
        if storageManager.string(for: .name) == nil {
            guard let nextVC = storyboard?.instantiateViewController(identifier: "AccountViewController") as? AccountViewController else { return }
            self.present(nextVC, animated: true)
        } else {
        guard let nextVC = storyboard?.instantiateViewController(identifier: "MainViewController") as? MainViewController else { return }
            nextVC.pokemonNames = pokemonNames
            nextVC.pokemonPictureUrls = pokemonPictureUrls
        self.present(nextVC, animated: true)
        }
    }
}
