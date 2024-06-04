//
//  HelperFunctions.swift
//  Chat App Basic
//
//  Created by 강한결 on 6/3/24.
//

import Foundation

func _splitString(_ value: String, condition: String) -> [String] {
    return value.components(separatedBy: condition)
}

func _joinStringAsDate(_ value: String) -> String {
    return _splitString(value, condition: "-").joined(separator: ".")
}

func _joinStringAsTime(_ value: String) -> String {
    // 09:00 | 13:00
    let timeString = _splitString(value, condition: ":")
    let hour = Int(timeString[0])
    let minute = timeString[1]
    
    if let hour {
        return hour == 12 ? "\(hour):\(minute) 오후" : hour < 12 ? "\(hour):\(minute) 오전" : "\(hour - 12):\(minute) 오후"
    } else {
        return ""
    }
}
