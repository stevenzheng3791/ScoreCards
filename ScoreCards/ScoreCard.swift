//
//  ScoreCard.swift
//  ScoreCards
//
//  Created by Steven Zheng on 7/13/17.
//  Copyright © 2017 szzheng. All rights reserved.
//

import UIKit

class ScoreCard: UIView, UIGestureRecognizerDelegate {
    
    var score : UILabel!
    var swipeUp : UISwipeGestureRecognizer!
    var swipeDown : UISwipeGestureRecognizer!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(origin: CGPoint, type: ScoreCardType) {
        var frame: CGRect!
        if type == .large {
            let size = CGSize(width: 100 * 2/3, height: 100)
            frame = CGRect(origin: origin, size: size)
            score = UILabel(frame: CGRect(origin: CGPoint(), size: size))
            score.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 80)
        } else {
            let size = CGSize(width: 75 * 2/3, height: 75)
            frame = CGRect(origin: origin, size: size)
            score = UILabel(frame: CGRect(origin: CGPoint(), size: size))
            score.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 60)
        }
        super.init(frame: frame)
        
        score.textAlignment = .center
        score.backgroundColor = UIColor.clear
        self.addSubview(score)
        
        swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(incrementScore(_:)))
        swipeUp.direction = .up
        swipeUp.delegate = self
        self.addGestureRecognizer(swipeUp)

        swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(decrementScore(_:)))
        swipeDown.direction = .down
        swipeDown.delegate = self
        self.addGestureRecognizer(swipeDown)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(reset(_:)))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.delegate = self
        self.addGestureRecognizer(doubleTap)
    }
    
    func setColors(primaryColor: UIColor, secondaryColor:UIColor) {
        // Sets the score to primaryColor and the background to secondaryColor
        score.textColor = primaryColor
        self.backgroundColor = secondaryColor
    }
    
    func setScore(score: String) {
        // Set the score to display
        self.score.text = score
    }
    
    func handleSwipeUp() {
        
    }
    
    func incrementScore(_ sender: UIGestureRecognizer) {
        var score = Int(self.score.text!)! + 1
        if score == 10 {
            score = 0
        }
        self.setScore(score: String(score))
    }
    
    func decrementScore(_ sender: UIGestureRecognizer) {
        var score = Int(self.score.text!)! - 1
        if score == -1 {
            score = 9
            
        }
        self.setScore(score: String(score))
    }
    
    func reset(_ sender: UIGestureRecognizer) {
        self.setScore(score: "0")
        print("reset")
    }
    

}

class ScoreCardWithHeader: ScoreCard {
    var header : UILabel!
    override init(origin: CGPoint, type: ScoreCardType) {
        super.init(origin: origin, type: type)
        super.score.frame.size = CGSize(width: super.score.frame.size.width, height: super.frame.size.height * 4/5)
        super.score.frame.origin.y = super.frame.height * 1/5
        header = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height/5))
        header.backgroundColor = UIColor.clear
        header.textAlignment = .center
        super.addSubview(header)
        if type == .small {
            header.positionAbove(bottom: super.score, offset: -5)
            header.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 15)
        } else {
            header.positionAbove(bottom: super.score, offset: -8)
            header.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setColors(primaryColor: UIColor, secondaryColor:UIColor) {
        // Sets the score to primaryColor and the background to secondaryColor
        header.textColor = primaryColor
        super.setColors(primaryColor: primaryColor, secondaryColor: secondaryColor)
    }
    
    func setHeader(header: String) {
        self.header.text = header
    }

}


enum ScoreCardType {
    case large
    case small
}
