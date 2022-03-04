//
//  AlertListViewController.swift
//  EyeAlarm
//
//  Created by 김종엽 on 2022/03/01.
//

import UIKit

class AlertListViewController: UITableViewController{
    
    var alertlist : [Alert] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "AlertListCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "AlertListCell")
    }
    @IBAction func addAlertButtonAction(_ sender: UIBarButtonItem) {
    }
}

extension AlertListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alertlist.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "일어날 시간"
        default:
            return nil
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlertListCell", for: indexPath) as? AlertListCell else {
            return UITableViewCell()
        }
        cell.alertSwitch.isOn = alertlist[indexPath.row].isOn
        cell.timeLabel.text = alertlist[indexPath.row].time
        cell.meridiemLable.text = alertlist[indexPath.row].meridiem
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle{
        case .delete:
            //노티피케이션 삭제 구현
            return
        default:
            break
        }
    }
    
}
