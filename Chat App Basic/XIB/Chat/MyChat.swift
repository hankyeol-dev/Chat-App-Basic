//
//  MyChat.swift
//  Chat App Basic
//
//  Created by 강한결 on 6/3/24.
//

import UIKit

class MyChat: UITableViewCell {
    
    var cellData: Chat?

    @IBOutlet var chatTime: UILabel!
    @IBOutlet var myChat: UILabel!
    @IBOutlet var myChatBox: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myChatBox._roundChatBox()
        myChatBox.backgroundColor = .systemGray6
        myChat._chatMsg()
        chatTime._chatTime(direction: .left)
        
    }

    func setCellData(_ data: Chat) {
        cellData = data
        
        if let cellData {
            myChat.text = cellData.message
            chatTime.text = _joinStringAsTime(_splitString(cellData.date, condition: " ")[1])
        }
    }
    
}
