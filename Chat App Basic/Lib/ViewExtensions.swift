//
//  LabelExtensions.swift
//  Chat App Basic
//
//  Created by 강한결 on 6/3/24.
//

import UIKit

enum ChatDirection: Int {
    case right
    case left
}

extension UILabel {
    func _chatRoomName() {
        self.font = .boldSystemFont(ofSize: 12)
        self.textAlignment = .left
        self.numberOfLines = 1
    }
    
    func _chatRoomDate() {
        self.font = .systemFont(ofSize: 12)
        self.textColor = .systemGray3
        self.textAlignment = .right
        self.numberOfLines = 1
    }
    
    func _chatRoomMsg() {
        self.font = .systemFont(ofSize: 12)
        self.textColor = .systemGray3
        self.textAlignment = .left
        self.numberOfLines = 0
    }
    
    func _chatName() {
        self.font = .boldSystemFont(ofSize: 13)
        self.textColor = .darkGray
    }
    
    func _chatMsg() {
        self.numberOfLines = 0
        self.font = .systemFont(ofSize: 10)
    }
    
    func _chatTime(direction: ChatDirection) {
        self.numberOfLines = 1
        self.textColor = .darkGray
        self.font = .systemFont(ofSize: 8)

        if direction.rawValue == 0 {
            self.textAlignment = .right
        } else {
            self.textAlignment = .left
        }
    }
}

extension UIImageView{
    func _roundedProfileImage(_ radius: CGFloat) {
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = radius
        self.backgroundColor = .systemGray6
    }
}

extension UIView {
    func _roundChatBox() {
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 0.4
    }
}
