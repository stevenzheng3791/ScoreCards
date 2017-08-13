//
//  MatchCard.swift
//  ScoreCards
//
//  Created by Steven Zheng on 7/15/17.
//  Copyright © 2017 szzheng. All rights reserved.
//

import UIKit

class MatchCard: UIView  {
    
    var gameCardHome : ScoreCard!
    var gameCardAway : ScoreCard!
    var setCardHome : ScoreCardWithHeader!
    var setCardAway : ScoreCardWithHeader!
    var scoreCards = [ScoreCard]()
    var title : UILabel!
    var status : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        gameCardHome = ScoreCard(origin: CGPoint(), type: .large)
        gameCardHome.positionCenter(superView: self, xOffset: (gameCardHome.frame.width/2 + 15) * -1, yOffset: 0)
        self.addSubview(gameCardHome)
        gameCardHome.setScore(score: "0")
        gameCardHome.setColors(primaryColor: .black, secondaryColor: .white)
        gameCardHome.addBorder(width: 1)
        gameCardHome.addShadow(offset: CGSize(width: 0, height: 2))
        
        gameCardAway = ScoreCard(origin: CGPoint(), type: .large)
        gameCardAway.positionCenter(superView: self, xOffset: gameCardAway.frame.width/2 + 15, yOffset: 0)
        self.addSubview(gameCardAway)
        gameCardAway.setScore(score: "0")
        gameCardAway.setColors(primaryColor: .red, secondaryColor: .white)
        gameCardAway.addBorder(width: 1)
        gameCardAway.addShadow(offset: CGSize(width: 0, height: 2))
        
        setCardHome = ScoreCardWithHeader(origin: CGPoint(), type: .small)
        setCardHome.positionLeftOf(right: gameCardHome, offset: 15)
        setCardHome.frame.origin.y = gameCardHome.frame.origin.y
        self.addSubview(setCardHome)
        setCardHome.setScore(score: "0")
        setCardHome.setHeader(header: "SETS")
        setCardHome.setColors(primaryColor: .black, secondaryColor: .white)
        setCardHome.addBorder(width: 1)
        setCardHome.addShadow(offset: CGSize(width: 0, height: 2))
        
        setCardAway = ScoreCardWithHeader(origin: CGPoint(), type: .small)
        setCardAway.positionRightOf(left: gameCardAway, offset: 15)
        setCardAway.frame.origin.y = gameCardAway.frame.origin.y
        self.addSubview(setCardAway)
        setCardAway.setScore(score: "0")
        setCardAway.setHeader(header: "SETS")
        setCardAway.setColors(primaryColor: .red, secondaryColor: .white)
        setCardAway.addBorder(width: 1.5)
        setCardAway.layer.cornerRadius = 2
        setCardAway.addShadow(offset: CGSize(width: 0, height: 2))
        
        scoreCards = [gameCardHome, gameCardAway, setCardHome, setCardAway]
        
        title = UILabel(
            frame: CGRect(
                x: 0, y: 0, width: self.frame.width, height: (self.frame.height - gameCardHome.frame.height)/2
            )
        )
        title.textColor = UIColor.black
        title.textAlignment = .center
        title.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 15)
        setTitle(title: "Singles 1: Arya Stark")
        self.addSubview(title)
        
        status = UILabel(
            frame: CGRect(
                x: 0, y: 0, width: self.frame.width, height: (self.frame.height - gameCardHome.frame.height)/2
            )
        )
        status.positionBelow(top: gameCardHome)
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
    
    func setGameCardHome(score: String) {
        gameCardHome.setScore(score: score)
    }
    
    func setSetCardHome(score: String) {
        setCardHome.setScore(score: score)
    }
    
    func setGameCardAway(score: String) {
        gameCardAway.setScore(score: score)
    }
    
    func setSetCardAway(score: String) {
        setCardAway.setScore(score: score)
    }
    
    func setScoreCards(gameScoreHome: String, gameScoreAway: String, setScoreHome: String, setScoreAway: String) {
        setGameCardHome(score: gameScoreHome)
        setGameCardAway(score: gameScoreAway)
        setSetCardHome(score: setScoreHome)
        setSetCardAway(score: setScoreAway)
    }
    
    func setMatch(match: Match) {
        setScoreCards(gameScoreHome: String(match.leftGames), gameScoreAway: String(match.rightGames), setScoreHome: String(match.leftSets), setScoreAway: String(match.rightSets))
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
