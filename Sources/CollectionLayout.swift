//
//  CollectionLayout.swift
//  CollectionLayout
//
//  Created by Sushil Dhital on 20/06/2022.
//

import Foundation
import UIKit

public class CollectionLayout: UICollectionViewFlowLayout {
    
    public var velocityPerPage: CGFloat = 2
    
    public var itemsPerPage: CGFloat = 1
            
    public override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let collectionView = collectionView else { return proposedContentOffset }
        
        let lengthOfPage: CGFloat
        
        let approximatePage: CGFloat
        
        let currentPage: CGFloat
        
        let pace: CGFloat
        
        if scrollDirection == .horizontal {
            
            lengthOfPage = (self.itemSize.width + self.minimumLineSpacing) * itemsPerPage
            
            approximatePage = collectionView.contentOffset.x / lengthOfPage
            
            pace = velocity.x
            
        } else {
            
            lengthOfPage = (self.itemSize.height + self.minimumLineSpacing) * itemsPerPage
            
            approximatePage = collectionView.contentOffset.y / lengthOfPage
            
            pace = velocity.y
            
        }
        
        if pace < 0 {
            
            currentPage = ceil(approximatePage)
            
        } else if pace > 0 {
            
            currentPage = floor(approximatePage)
            
        } else {
            
            currentPage = round(approximatePage)
            
        }
        
        guard pace != 0 else {
            
            if scrollDirection == .horizontal {
                
                return CGPoint(x: currentPage * lengthOfPage, y: 0)
                
            } else {
                
                return CGPoint(x: 0, y: currentPage * lengthOfPage)
                
            }
            
        }
        
        var nextPage: CGFloat = currentPage + (pace > 0 ? 1 : -1)
        
        let inrementPage = pace / velocityPerPage
        
        nextPage += (pace < 0) ? ceil(inrementPage) : floor(inrementPage)
        
        
        if scrollDirection == .horizontal {
            
            return CGPoint(x: nextPage * lengthOfPage, y: 0)
            
        } else {
            
            return CGPoint(x: 0, y: nextPage * lengthOfPage)
            
        }
        
    }
    
}


