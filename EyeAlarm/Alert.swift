//
//  Alert.swift
//  EyeAlarm
//
//  Created by JongYeup Kim on 2022/03/02.
//

import Foundation
struct Alert : Codable {
    var id : String  = UUID().uuidString
    let date : Date
    let isOn : Bool
    
    var time : String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm"
        return timeFormatter.string(from: date)
        
    }
    
    var meridiem : String {
        let meridiemFormatter = DateFormatter()
        meridiemFormatter.dateFormat = "a"
        meridiemFormatter.locale = Locale(identifier: "kor")
        return meridiemFormatter.string(from: date)
    }
}
