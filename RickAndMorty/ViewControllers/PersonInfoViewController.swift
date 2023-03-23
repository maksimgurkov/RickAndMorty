//
//  PersonInfoViewController.swift
//  HW3.2
//
//  Created by Максим Гурков on 23.03.2023.
//

import UIKit

final class PersonInfoViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var personImage: UIImageView! {
        didSet {
            personImage.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var fulInfoPersonLabel: UILabel!
    
    //MARK: - Public properties
    var person: Person!
    
    //MARK: - Private properties
    private var episodes: [Episode] = []
    private let networkManager = NetworkManager.shared
    
    //MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        title = person.name
        fulInfoPersonLabel.text = person.fulDescription
        fetchImage()
        fetchEpisode()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let episodeVC = segue.destination as? EpisodesController else { return }
        episodeVC.episodes = episodes
    }
    
    //MARK: - Private functions
    private func fetchImage() {
        networkManager.fetchImage(from: person.image) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.personImage.image = UIImage(data: imageData)
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchEpisode() {
        person.episode.forEach { episode in
            guard let url = URL(string: episode) else { return }
            networkManager.fetch(Episode.self, from: url) { [weak self] result in
                switch result {
                case .success(let epesode):
                    self?.episodes.append(epesode)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}
