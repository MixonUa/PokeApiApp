//
//  AccountViewController.swift
//  PokeApiApp
//
//  Created by Михаил Фролов on 09.09.2023.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    
    let storageManager = PersonalStorageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = storageManager.string(for: .name)
        countryTextField.text = storageManager.string(for: .country)
        // Do any additional setup after loading the view.
    }
    // MARK: - Store Data
    

    @IBAction func saveButtonPressed(_ sender: Any) {
        storageManager.set(object: nameTextField.text, for: .name)
        storageManager.set(object: countryTextField.text, for: .country)
    }
}
