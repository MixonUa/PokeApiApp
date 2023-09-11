//
//  IntroViewController.swift
//  PokeApiApp
//
//  Created by Михаил Фролов on 09.09.2023.
//

import UIKit

class IntroViewController: UIViewController {
    let storageManager = PersonalStorageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        self.present(nextVC, animated: true)
        }
    }
}
