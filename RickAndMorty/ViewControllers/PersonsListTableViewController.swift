//
//  PersonsListTableViewController.swift
//  HW3.2
//
//  Created by Максим Гурков on 23.03.2023.
//

import UIKit

final class PersonsListTableViewController: UITableViewController {
    
    //MARK: - Private properties
    private var persons: [Person] = []
    private let networkManager = NetworkManager.shared

    //MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Rick and Morty"
        fetchPersons()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let personVC = segue.destination as? PersonInfoViewController else { return }
        guard let index = tableView.indexPathForSelectedRow else { return }
        personVC.person = persons[index.row]
    }
    
    //MARK: - Private functions
    private func fetchPersons() {
        networkManager.fetch(RickAndMorty.self, from: Link.rickAndMorty.url) { [weak self] result in
            switch result {
            case .success(let persons):
                self?.persons = persons.results
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

// MARK: - Extension Table view data source
extension PersonsListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        guard let cell = cell as? PersonTableViewCell else { return UITableViewCell()}
        let person = persons[indexPath.row]
        cell.configure(person: person)
        return cell
    }
}
