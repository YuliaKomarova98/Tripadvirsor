//
//  CustomLayout.swift
//  BottleRocket
//
//  Created by Yulia on 29.09.2021.
//

import Foundation
import UIKit

protocol TACustomLayoutDelegate {
      func heightFor(index : Int) -> CGFloat
   }

class TACustomLayout: UICollectionViewFlowLayout {
    var layoutDelegate : TACustomLayoutDelegate?
    var leftY = CGFloat(0)
    var rightY = CGFloat(0)
    var cache = [UICollectionViewLayoutAttributes]()

   override func prepare() {
       guard  cache.isEmpty == true, let collectionView = collectionView else{
           return
       }
       let verticalSpacing = CGFloat(10)
       let horizontalSpacing = CGFloat(10)
       let margin = CGFloat(10)
       leftY = margin
       rightY = margin
       for item in 0..<collectionView.numberOfItems(inSection: 0){
           var frame = CGRect.zero
           let cellHeight = CGFloat(260)
           frame.size.height = cellHeight
           frame.size.width = (collectionView.frame.size.width - 2 * margin) / 2 - horizontalSpacing/2
           
           if item%2 == 0{
               frame.origin.x = margin
               frame.origin.y = leftY
               leftY += cellHeight + verticalSpacing
           }else{
               frame.origin.x = (collectionView.frame.size.width - 2 * margin) / 2 +  ((4 * horizontalSpacing) / 3)
               frame.origin.y = rightY
               rightY += cellHeight + verticalSpacing
           }

           let indexPath = IndexPath(item: item, section: 0)
           let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
           attributes.frame = frame
           cache.append(attributes)
       }

   }

   override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
       var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
       for attributes in cache {
           if attributes.frame.intersects(rect) {
               visibleLayoutAttributes.append(attributes)
           }
       }
       return visibleLayoutAttributes
   }

    override var collectionViewContentSize: CGSize{
       return CGSize.init(width: collectionView!.frame.size.width, height: max(leftY, rightY))
   }
}
