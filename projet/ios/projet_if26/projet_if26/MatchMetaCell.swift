//
//  MatchMetaCell.swift
//  projet_if26
//
//  Created by if26-grp1 on 17/12/2019.
//  Copyright © 2019 if26. All rights reserved.
//

import UIKit

class MatchMetaCell: UITableViewCell {
    
    @IBOutlet weak var matchIdLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var championLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    func setMatchMeta(matchMeta: Matchmeta) {
        matchIdLabel.text = matchMeta.matchId
        nameLabel.text = matchMeta.name
        dateLabel.text = matchMeta.date
        championLabel.text = matchMeta.champion
        resultLabel.text = matchMeta.result
        durationLabel.text = matchMeta.duration
    }
    
}
