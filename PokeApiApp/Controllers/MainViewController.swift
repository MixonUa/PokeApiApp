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
    let downloadManager = NetworkFetchService()
    var pokemonNames: [PokemonNamesModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonNamesTableView.dataSource = self
    
        updatePersonInfo()
        loadPokeNames()
        print(pokemonNames)
    }
    
    private func updatePersonInfo() {
        nameLabel.text = storageManager.string(for: .name)
        countryLabel.text = storageManager.string(for: .country)
    }
    
    private func loadPokeNames() {
        downloadManager.requestPokemonNames(completion: { (data, error) in
            if let data = data {
                self.pokemonNames = data
                self.pokemonNamesTableView.reloadData()
            }
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonNames.isEmpty ? 1 : pokemonNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pokemonNamesTableView.dequeueReusableCell(withIdentifier: "NamesCell", for: indexPath) as! NamesCell
        if pokemonNames.isEmpty {
            cell.updateCell(name: "No data")
        } else {
            cell.updateCell(name: pokemonNames[indexPath.row].name)
        }
        return cell
    }
    
    
}
