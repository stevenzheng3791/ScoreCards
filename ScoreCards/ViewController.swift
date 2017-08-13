//
//  ViewController.swift
//  ScoreCards
//
//  Created by Steven Zheng on 7/13/17.
//  Copyright © 2017 szzheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate {

    //var scoreCard : ScoreCard!
    
    var matchCardsTable : UITableView!
    var matches : [Int]!

    let constants = Constants()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load background
        let backdrop = self.view.makeBackdrop(color: constants.backdropColor)
        self.view.addSubview(backdrop)
        
        // Load table
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let tableWidth: CGFloat = self.view.frame.width
        let tableHeight: CGFloat = self.view.frame.height
        matchCardsTable = UITableView(frame: CGRect(x: 0, y: barHeight, width: tableWidth, height: tableHeight - barHeight))
        matchCardsTable.register(MatchCardTableViewCell.self, forCellReuseIdentifier: "matchCard")
        matchCardsTable.dataSource = self
        matchCardsTable.delegate = self
        matchCardsTable.backgroundColor = UIColor.clear
        matchCardsTable.separatorColor = UIColor.clear
        backdrop.addSubview(matchCardsTable)
        
        matches = [1, 2, 3, 4, 5]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(constants.matchCardCellHeight)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCard", for: indexPath as IndexPath) as! MatchCardTableViewCell
        cell.matchCard = MatchCard(frame: CGRect(x: 10, y: 20, width: cell.contentView.frame.width - 20, height: 200))
        cell.addSubview(cell.matchCard!)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none

        for scoreCard in cell.matchCard!.scoreCards {
            for gestureRecognizer in matchCardsTable.gestureRecognizers! {
                gestureRecognizer.require(toFail: scoreCard.swipeUp)
            }
            for gestureRecognizer in matchCardsTable.gestureRecognizers! {
                gestureRecognizer.require(toFail: scoreCard.swipeDown)
            }
        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

