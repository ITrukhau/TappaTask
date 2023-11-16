//
//  WATableViewCell.swift
//  TappaTask1
//
//  Created by Ilya Trukhau on 11/16/23.
//

import UIKit

class WATableViewCell: UITableViewCell {
    @IBOutlet private var randomImageView: UIImageView!

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var startDateLabel: UILabel!
    @IBOutlet private var endDateLabel: UILabel!
    @IBOutlet private var senderName: UILabel!
    @IBOutlet private var durationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
