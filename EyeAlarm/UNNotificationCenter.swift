//
//  UNNotificationCenter.swift
//  EyeAlarm
//
//  Created by 김종엽 on 2022/03/13.
//

import Foundation
import UserNotifications
// import UIKit

extension UNUserNotificationCenter {
    func addNotificatoinRequest(by alert : Alert ){
        let content = UNMutableNotificationContent()
        content.title = "수민아"
        content.body = "이제 일어나자"
        content.sound = .default
        content.badge = 1
        
        let component = Calendar.current.dateComponents([.hour, .minute], from: alert.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: alert.isOn)
        
        let request = UNNotificationRequest(identifier: alert.id, content: content, trigger: trigger)
        
        self.add(request, withCompletionHandler: nil)
        
    }
    
}
