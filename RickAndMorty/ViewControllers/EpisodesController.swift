//
//  EpisodesController.swift
//  HW3.2
//
//  Created by Максим Гурков on 23.03.2023.
//

import UIKit

final class EpisodesController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Public properties
    var episodes: [Episode] = []
    
    //MARK: - Private properties
    private let networkManager = NetworkManager.shared
    
    //MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episodes"
    }
    
}

// MARK: - Extension Table view data source
extension EpisodesController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodes.count
   }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath)
        let epesode = episodes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = epesode.description
        cell.contentConfiguration = content
        cell.selectionStyle = .none
        return cell
    }
    
}
