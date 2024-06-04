//
//  TripleProfileCell.swift
//  Chat App Basic
//
//  Created by 강한결 on 6/3/24.
//

import UIKit

class TripleProfileCell: UITableViewCell {
    @IBOutlet var cellTitle: UILabel!
    @IBOutlet var cellDate: UILabel!
    @IBOutlet var cellMsg: UILabel!
    @IBOutlet var cellProfileImages: [UIImageView]!
    
    var cellData: GetChatRoomDTO?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellTitle._chatRoomName()
        cellDate._chatRoomDate()
        cellMsg._chatRoomMsg()
        cellProfileImages.forEach {
            $0._roundedProfileImage(8)
        }
    }

    func setData(_ data: GetChatRoomDTO) {
        cellData = data
        
        if let cellData {
            cellTitle.text = cellData.chatroomName
            cellMsg.text = cellData.chatList.last?.message
            
            let dateText = cellData.chatList.last?.date ?? ""
            cellDate.text = _joinStringAsDate(_splitString(dateText, condition: " ")[0])
            
            for i in 0..<cellData.chatroomImage.count {
                cellProfileImages[i].image = UIImage(named: cellData.chatroomImage[i])
            }
        }
    }
    
}
