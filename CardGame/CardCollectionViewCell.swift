//
//  CardCollectionViewCell.swift
//  CardGame
//
//  Created by Raza on 04/09/2024.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cardImage: UIImageView!
    
    func setBlackImage() {
           cardImage.image = UIImage(named: "blackImage")
       }
}
