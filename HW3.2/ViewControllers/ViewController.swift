//
//  ViewController.swift
//  HW3.2
//
//  Created by Максим Гурков on 20.03.2023.
//

import UIKit

enum Link: String {
    case rickAndMorty = "https://rickandmortyapi.com/api/character"
}

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPerson()
    }
}
    
//MARK: - Extension
private extension ViewController {
    
    func fetchPerson() {
        guard let url = URL(string: Link.rickAndMorty.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let person = try decoder.decode(RickAndMorty.self, from: data)
                person.results.forEach { person in
                    print(person.description)
                }
            } catch let error {
                print(error)
            }
        }.resume()
        
    }
    
}

