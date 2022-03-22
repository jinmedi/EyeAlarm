//
//  AlertListViewController.swift
//  EyeAlarm
//
//  Created by 김종엽 on 2022/03/01.
//

import UIKit
import UserNotifications
import AVFoundation

//var audio : AVPlayer!


class AlertListViewController: UITableViewController{
    
    var alerts : [Alert] = []
    let userNotificationCenter = UNUserNotificationCenter.current()
    let timeSelector: Selector = #selector(AlertListViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime: String?
    var mTimer: Timer?
    
  //  @IBOutlet weak var currentTimeLabel: UILabel!
//    @IBOutlet weak var currentTimeLabel: UILabel!
    
  //  @IBOutlet weak var StackView: UIStackView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let authrizationOptions = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
        
        userNotificationCenter.requestAuthorization(options: authrizationOptions)
        { _, error in
            if let error = error {
                print("ERROR : notification authrization request \(error.localizedDescription)")
            }
        }
        
        let nibName = UINib(nibName: "AlertListCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "AlertListCell")
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
      //  let uiView = UIView.
        
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        alerts = alertList()
    }
    
    @IBAction func addAlertButtonAction(_ sender: UIBarButtonItem) {
        guard let addAlertVC = storyboard?.instantiateViewController(withIdentifier: "AddAlertViewController") as? AddAlertViewController else { return }
        
        addAlertVC.pickedDate = {[weak self] date in
            guard let self = self else { return}
            
            var alertList = self.alertList()
            let newAlert = Alert(date: date, isOn: true)

            alertList.append(newAlert)
            alertList.sort { $0.date < $1.date}
            
            self.alerts = alertList
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alerts), forKey: "alerts")
            self.userNotificationCenter.addNotificatoinRequest(by: newAlert)
            
            self.tableView.reloadData()
        }
        self.present(addAlertVC, animated: true, completion: nil)
        

    }
    func alertList() -> [Alert] {
        guard let data = UserDefaults.standard.value(forKey: "alerts") as? Data,
              let alerts = try? PropertyListDecoder().decode([Alert].self, from: data) else { return []}
        return alerts
    }
    
    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
      //  currentTimeLabel.text = "현재시간:" + formatter.string(from: date as Date)
        let currentTime = formatter.string(from: date as Date)
//        print(alerts.self)
//        print(alerts)
        for i in 0...alerts.self.count-1  {
//            print(alerts.self.count)
            var indexNum : Int = 0
             print(alerts[i].time)
            if(alerts[i].time == currentTime){
                print("지금이 바로 알람시간")
                alarmMonitor()
            }else{
                indexNum += 1
                print("지금은 알람시간이 아님")
            }
        }
    }
}

extension AlertListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alerts.count
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
        cell.alertSwitch.isOn = alerts[indexPath.row].isOn
        cell.timeLabel.text = alerts[indexPath.row].time
        cell.meridiemLable.text = alerts[indexPath.row].meridiem
        
        cell.alertSwitch.tag = indexPath.row
        
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
            self.alerts.remove(at: indexPath.row)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alerts),forKey: "alerts")
            //노티피케이션 삭제 구현
            userNotificationCenter.removePendingNotificationRequests(withIdentifiers: [alerts[indexPath.row].id])
            self.tableView.reloadData()
            return
        default:
            break
        }
    }
    func alarmMonitor (){
        guard let addAlarmVC = storyboard?.instantiateViewController(withIdentifier: "AlarmViewController") as? AlarmViewController else { return }
        //[alerts[IndexPath.row].time]
      //  self.alerts
        
        self.present(addAlarmVC, animated: true, completion: nil)
    }
 
    
}

