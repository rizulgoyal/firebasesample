//
//  ListTableViewCell.swift
//  firebasesample
//
//  Created by Rizul goyal on 2020-05-15.
//  Copyright © 2020 Rizul goyal. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet var label3: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
