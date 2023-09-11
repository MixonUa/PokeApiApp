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
    
    let storageManager = PersonalStorageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = storageManager.string(for: .name)
        countryLabel.text = storageManager.string(for: .country)
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
