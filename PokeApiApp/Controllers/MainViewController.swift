//
//  MainViewController.swift
//  PokeApiApp
//
//  Created by Михаил Фролов on 09.09.2023.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var pokemonNamesTableView: UITableView!
    
    let storageManager = PersonalStorageManager()
    
    var pokemonNames: [PokemonNamesModel] = []
    var pokemonPictureUrls: [PokemonPictureURLsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonNamesTableView.dataSource = self
    
        updatePersonInfo()
        
    }
    
    private func updatePersonInfo() {
        nameLabel.text = storageManager.string(for: .name)
        countryLabel.text = storageManager.string(for: .country)
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonNames.isEmpty ? 1 : pokemonNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pokemonNamesTableView.dequeueReusableCell(withIdentifier: "NamesCell", for: indexPath) as! NamesCell
        if pokemonNames.isEmpty {
            cell.updateCell(name: "No data", url: "No data")
        } else {
            cell.updateCell(name: pokemonNames[indexPath.row].name, url: pokemonPictureUrls[indexPath.row].sprites.other.dream_world.front_default)
        }
        return cell
    }
    
    
}
