//
//  CharacterDetailViewController.swift
//  Rick&Morty
//
//  Created by Adrian Ulgar on 31/10/2022.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    @IBOutlet weak var characterStatusLbl: UILabel!
    @IBOutlet weak var characterSpecieLbl: UILabel!
    @IBOutlet weak var characterGenderLbl: UILabel!
    @IBOutlet weak var characterNameLbl: UILabel!
    @IBOutlet weak var characterImg: UIImageView!
    
    var character: Character?
    static let identifier: String = "characterDetailViewControllerIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let character = character {
            characterNameLbl.text = characterNameLbl.text! + character.name
            characterGenderLbl.text = characterGenderLbl.text! + character.gender
            characterSpecieLbl.text = characterSpecieLbl.text! + character.species
            characterStatusLbl.text = characterStatusLbl.text! + character.status.rawValue
         
            characterImg.layer.borderWidth = 6
            switch character.status {
            case .alive:
                characterImg.layer.borderColor = UIColor.green.cgColor
            case .dead:
                characterImg.layer.borderColor = UIColor.red.cgColor
            case .unknown:
                characterImg.layer.borderColor = UIColor.gray.cgColor
            }
            
            ImageDownloader.shared.downloadImage(with: character.imageUrl, completionHandler: { image, bool in
                self.characterImg.image = image
            }, placeholderImage: UIImage.init(named: "loading"))
        }
        
    }
}
