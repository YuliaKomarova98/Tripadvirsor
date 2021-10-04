//
//  BRCellCollectionViewCell.swift
//  BottleRocket
//
//  Created by Yulia on 14.09.2021.
//

import UIKit

class TACellCollectionViewCell: UICollectionViewCell {
    var imageManager = TAImageManaget()
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var category: UILabel!
    
    var model: Restaurant? {
        didSet {
            guard let model = model else { return }
            
            name.text = model.name
            category.text = model.category
            
            guard let imageUrl = model.backgroundImageURL else { return }
            
            imageManager.getImage(urlData: imageUrl) { imageView in
                self.imageView.image = imageView
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.layer.cornerRadius = 6
        imageView.layer.cornerRadius = 6
        
        name.font = .boldSystemFont(ofSize: 18)
        name.textAlignment = .center
        name.numberOfLines = 0
        
        category.font = .italicSystemFont(ofSize: 15)
        category.textAlignment = .center
        category.numberOfLines = 0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        name.text = nil
        category.text = nil
    }

}
