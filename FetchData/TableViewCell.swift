//
//  TableViewCell.swift
//  FetchData
//
//  Created by Macbook on 30/06/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var namelbl: UILabel!
    
    @IBOutlet weak var capitallbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
