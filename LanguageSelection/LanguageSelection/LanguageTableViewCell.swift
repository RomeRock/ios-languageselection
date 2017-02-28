//
//  LanguageTableViewCell.swift
//  LanguageSelection
//
//  Created by NDM on 2/27/17.
//  Copyright © 2017 Rome Rock. All rights reserved.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {

    @IBOutlet var selectionView: UIView!
    @IBOutlet var languageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.selectionView.isHidden = !selected
    }

}
