//
//  AlertListCell.swift
//  EyeAlarm
//
//  Created by 김종엽 on 2022/03/01.
//

import UIKit

class AlertListCell: UITableViewCell {
    @IBOutlet weak var meridiemLable: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var alertSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func alertSwitchValueChanged(_ sender: Any) {
    }
}
