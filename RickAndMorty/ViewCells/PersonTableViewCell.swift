//
//  PersonTableViewCell.swift
//  HW3.2
//
//  Created by Максим Гурков on 23.03.2023.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var personImage: UIImageView! {
        didSet {
            personImage.layer.cornerRadius = personImage.frame.width / 2
        }
    }
    
    @IBOutlet weak var infoPersonLabel: UILabel!
    
    private let networkManager = NetworkManager.shared
    
    func configure(person: Person) {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        infoPersonLabel.text = person.descriptionPerson
        
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
    
    

}
