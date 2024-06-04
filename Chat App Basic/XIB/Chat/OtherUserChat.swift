//
//  OtherUserChat.swift
//  Chat App Basic
//
//  Created by 강한결 on 6/3/24.
//

import UIKit

class OtherUserChat: UITableViewCell {
    
    var cellData: Chat?

    @IBOutlet var userName: UILabel!
    @IBOutlet var userChat: UILabel!
    @IBOutlet var userChatTime: UILabel!
    @IBOutlet var userProfile: UIImageView!
    
    @IBOutlet var chatBox: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        chatBox._roundChatBox()
        userName._chatName()
        userChat._chatMsg()
        userChatTime._chatTime(direction: .right)
        userProfile._roundedProfileImage(12)
    }

    func setCellData(_ data: Chat) {
        cellData = data
        
        if let cellData {
            userName.text = cellData.user.rawValue
            userChat.text = cellData.message
            userChatTime.text = _joinStringAsTime(_splitString(cellData.date, condition: " ")[1])
            userProfile.image = UIImage(named: cellData.user.rawValue)
            
        }
    }
    
}
