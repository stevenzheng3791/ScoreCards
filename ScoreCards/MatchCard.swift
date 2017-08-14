//
//  MatchCard.swift
//  ScoreCards
//
//  Created by Steven Zheng on 7/15/17.
//  Copyright © 2017 szzheng. All rights reserved.
//

import UIKit

class MatchCard: UIView  {
    
    var leftGameCard : ScoreCard!
    var rightGameCard : ScoreCard!
    var leftSetCard : ScoreCardWithHeader!
    var rightSetCard : ScoreCardWithHeader!
    var scoreCards = [ScoreCard]()
    var title : UILabel!
    var status : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        leftGameCard = ScoreCard(origin: CGPoint(), type: .large)
        leftGameCard.positionCenter(superView: self, xOffset: (leftGameCard.frame.width/2 + 15) * -1, yOffset: 0)
        self.addSubview(leftGameCard)
        leftGameCard.setScore(score: "0")
        leftGameCard.setColors(primaryColor: .black, secondaryColor: .white)
        leftGameCard.addBorder(width: 1)
        leftGameCard.addShadow(offset: CGSize(width: 0, height: 2))
        
        rightGameCard = ScoreCard(origin: CGPoint(), type: .large)
        rightGameCard.positionCenter(superView: self, xOffset: rightGameCard.frame.width/2 + 15, yOffset: 0)
        self.addSubview(rightGameCard)
        rightGameCard.setScore(score: "0")
        rightGameCard.setColors(primaryColor: .red, secondaryColor: .white)
        rightGameCard.addBorder(width: 1)
        rightGameCard.addShadow(offset: CGSize(width: 0, height: 2))
        
        leftSetCard = ScoreCardWithHeader(origin: CGPoint(), type: .small)
        leftSetCard.positionLeftOf(right: leftGameCard, offset: 15)
        leftSetCard.frame.origin.y = leftGameCard.frame.origin.y
        self.addSubview(leftSetCard)
        leftSetCard.setScore(score: "0")
        leftSetCard.setHeader(header: "SETS")
        leftSetCard.setColors(primaryColor: .black, secondaryColor: .white)
        leftSetCard.addBorder(width: 1)
        leftSetCard.addShadow(offset: CGSize(width: 0, height: 2))
        
        rightSetCard = ScoreCardWithHeader(origin: CGPoint(), type: .small)
        rightSetCard.positionRightOf(left: rightGameCard, offset: 15)
        rightSetCard.frame.origin.y = rightGameCard.frame.origin.y
        self.addSubview(rightSetCard)
        rightSetCard.setScore(score: "0")
        rightSetCard.setHeader(header: "SETS")
        rightSetCard.setColors(primaryColor: .red, secondaryColor: .white)
        rightSetCard.addBorder(width: 1.5)
        rightSetCard.layer.cornerRadius = 2
        rightSetCard.addShadow(offset: CGSize(width: 0, height: 2))
        
        scoreCards = [leftGameCard, rightGameCard, leftSetCard, rightSetCard]
        
        title = UILabel(
            frame: CGRect(
                x: 0, y: 0, width: self.frame.width, height: (self.frame.height - leftGameCard.frame.height)/2
            )
        )
        title.textColor = UIColor.black
        title.textAlignment = .center
        title.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 15)
        setTitle(title: "Singles 1: Arya Stark")
        self.addSubview(title)
        
        status = UILabel(
            frame: CGRect(
                x: 0, y: 0, width: self.frame.width, height: (self.frame.height - leftGameCard.frame.height)/2
            )
        )
        status.positionBelow(top: leftGameCard)
        status.textColor = UIColor.black
        status.textAlignment = .center
        status.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 15)
        setStatus(status: "Last Updated: 3 minutes ago")
        self.addSubview(status)
        
        //self.addBorder(width: 3)
        //self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 10
        //self.addShadow(offset: CGSize(width: 0, height: 1))
        self.backgroundColor = UIColor.white
    }
    
    func setLeftGameCard(score: String) {
        leftGameCard.setScore(score: score)
    }
    
    func setLeftSetCard(score: String) {
        leftSetCard.setScore(score: score)
    }
    
    func setRightGameCard(score: String) {
        rightGameCard.setScore(score: score)
    }
    
    func setRightSetCard(score: String) {
        rightSetCard.setScore(score: score)
    }
    
    func setScoreCards(leftGames: String, rightGames: String, setScoreHome: String, rightSets: String) {
        setLeftGameCard(score: leftGames)
        setRightGameCard(score: rightGames)
        setLeftSetCard(score: setScoreHome)
        setRightSetCard(score: rightSets)
    }
    
    func setMatch(match: Match) {
        setScoreCards(leftGames: String(match.leftGames), rightGames: String(match.rightGames), setScoreHome: String(match.leftSets), rightSets: String(match.rightSets))
    }
    
    func setTitle(title: String) {
        self.title.text = title
    }
    
    func setStatus(status: String) {
        self.status.text = status
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
