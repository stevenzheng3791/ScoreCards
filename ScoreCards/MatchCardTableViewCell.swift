//
//  MatchCardTableViewCell.swift
//  ScoreCards
//
//  Created by Steven Zheng on 8/12/17.
//  Copyright © 2017 szzheng. All rights reserved.
//

import UIKit

class MatchCardTableViewCell: UITableViewCell {

    var matchCard : MatchCard!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setMatchCard(matchCard: MatchCard) {
        /* Attach the matchCard to this cell */
        self.matchCard = matchCard
        self.addSubview(matchCard)
    }

}
