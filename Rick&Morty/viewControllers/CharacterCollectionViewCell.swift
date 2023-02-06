//
//  CharacterCollectionViewCell.swift
//  Rick&Morty
//
//  Created by Adrian Ulgar on 29/10/2022.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var characterImg: UIImageView!
    static let reuseIdentifier = "characterCollectionViewCellIdentifier"
    override func awakeFromNib() {
          super.awakeFromNib()
        self.contentView.layer.cornerRadius = 8
        self.layer.cornerRadius = 8
      }
    
    func setupCell(character: Character) {
        self.characterImg.image = UIImage.init(named: "rickandmorty")
        self.nameLbl.text = character.name
        self.statusLbl.text = character.status.rawValue
        self.statusView.backgroundColor = character.statusColor
        self.statusView.layer.cornerRadius = 4
       
        ImageDownloader.shared.downloadImage(with: character.imageUrl, completionHandler: { image, bool in
            self.characterImg.image = image
        }, placeholderImage: UIImage.init(named: "loading"))
    }
}
