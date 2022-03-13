//
//  AlertListCell.swift
//  EyeAlarm
//
//  Created by 김종엽 on 2022/03/01.
//

import UIKit
import SwiftUI

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
    
    @IBAction func alertsSwitchValueChanged(_ sender: UISwitch) {
        guard let data = UserDefaults.standard.value (forKey: "alerts") as? Data,
              var alerts = try? PropertyListDecoder().decode([Alert].self, from : data ) else { return }
        
        alerts[sender.tag].isOn = sender.isOn
        UserDefaults.standard.set(try? PropertyListEncoder().encode(alerts), forKey: "alerts")
        
    }
    
    
}

