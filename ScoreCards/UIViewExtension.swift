//
//  UIViewExtension.swift
//  ScoreCards
//
//  Created by Steven Zheng on 7/15/17.
//  Copyright © 2017 szzheng. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addShadow(offset: CGSize, radius: CGFloat = 1) {
        /* Add shadow around view */
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func addBorder(width: CGFloat) {
        /* Add black border around view */
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = width
    }
    
    func positionAbove(bottom: UIView, offset: CGFloat = 0) {
        /* Position this view on top of the bottom view */
        self.frame.origin.y = bottom.frame.origin.y - self.frame.height - offset
    }
    
    func positionBelow(top: UIView, offset: CGFloat = 0) {
        /* Position this view under the top view */
        self.frame.origin.y = top.frame.origin.y + top.frame.height + offset
    }
    
    func positionLeftOf(right: UIView, offset: CGFloat = 0) {
        /* Position this view to the left of the right view */
        self.frame.origin.x = right.frame.origin.x - self.frame.width - offset
    }
    
    func positionRightOf(left: UIView, offset: CGFloat = 0) {
        /* Position this view to the right of the left view */
        self.frame.origin.x = left.frame.origin.x + left.frame.width + offset
    }
    
    func positionCenter(superView: UIView, xOffset: CGFloat = 0, yOffset: CGFloat = 0) {
        /* Position this view in the middle of the superview */
        self.center = CGPoint(x: superView.frame.width/2 + xOffset, y: superView.frame.height/2 + yOffset)
    }
    
    func makeBackdrop(color: UIColor) -> UIView {
        /* Creates a backdrop with the passed in colors for the current view */
        let backdrop = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        backdrop.backgroundColor = color
        return backdrop
    }
}
