//
//  File.swift
//  EyeAlarm
//
//  Created by 김종엽 on 2022/03/06.
//

import Foundation
import UserNotifications

extension UNUserNotificationCenter{
    func addNotificationRequest(by alert: Alert) {
        let content = UNMutableNotificationContent()
        content.title = "일어나자"
        content.body = "수민아, 너는 민족 중흥의 역사적 사명을 띄고 이 땅에 태어났다. 동창이 밝았으니 이제 읽어나자꾸나"
        content.sound = .default
        content.badge = 1
  
        let component = Calendar.current.dateComponents(<#T##components: Set<Calendar.Component>##Set<Calendar.Component>#>, from: <#T##Date#>)
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: alert.isOn)
        let request = UNNotificationRequest(identifier: alert.id, content: content, trigger: trigger)
        
    }

}
