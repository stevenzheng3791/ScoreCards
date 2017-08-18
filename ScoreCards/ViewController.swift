//
//  ViewController.swift
//  ScoreCards
//
//  Created by Steven Zheng on 7/13/17.
//  Copyright © 2017 szzheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var matchCardsTable : UITableView!
    var matches : [Match]!

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
        
        matches = [Match(), Match(), Match(), Match(), Match()]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(constants.matchCardCellHeight)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCard", for: indexPath as IndexPath) as! MatchCardTableViewCell
        
        let matchCard = MatchCard(
            frame: CGRect(
                x: CGFloat(constants.matchCardXOffset),
                y: CGFloat(constants.matchCardYOffset),
                width: cell.frame.width - 2 * CGFloat(constants.matchCardXOffset),
                height: cell.frame.height - 2 * CGFloat(constants.matchCardYOffset)
            )
        )
        
        matchCard.setMatch(match: matches[indexPath.row])
        cell.setMatchCard(matchCard: matchCard)
        resolveSimultaneousGestures(tableView: matchCardsTable, cell: cell)
        return cell
    }
    
    func resolveSimultaneousGestures(tableView: UITableView, cell: UITableViewCell) {
        /* Resolves the nested gesture recognizer issue between the table view and the cell */
        let cell = cell as! MatchCardTableViewCell
        for scoreCard in cell.matchCard!.scoreCards {
            for gestureRecognizer in tableView.gestureRecognizers! {
                gestureRecognizer.require(toFail: scoreCard.swipeUp)
            }
            for gestureRecognizer in tableView.gestureRecognizers! {
                gestureRecognizer.require(toFail: scoreCard.swipeDown)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addMatchCard(match: Match) {
        // Add the match with id to the matches array
        matches.append(match)
        matchCardsTable.reloadData()
    }
    
    func deleteMatchCard(match: Match) {
        // Delete the match with id from the matches array
        var index = 0
        for i in 0..<matches.count {
            if (matches[i].id == match.id) {
                index = i
                break
            }
        }
        matches.remove(at: index)
        matchCardsTable.reloadData()
    }
}
