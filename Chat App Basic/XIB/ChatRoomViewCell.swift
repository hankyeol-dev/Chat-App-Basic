//
//  ChatRoomViewCell.swift
//  Chat App Basic
//
//  Created by 강한결 on 5/31/24.
//

import UIKit

class ChatRoomViewCell: UITableViewCell {

    @IBOutlet var chatRoomTitles: [UILabel]!
    @IBOutlet var chatRoomUpdateDate: [UILabel]!
    @IBOutlet var chatRoomLastChat: [UILabel]!
    
    @IBOutlet var chatRoomUserImages: [UIImageView]!
    
    var cellData: GetChatRoomDTO?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureTitles()
        configureDateAndLastChat()
    }
    
    func configureTitles() {
        if let cellData {
            chatRoomTitles.forEach {
                $0.font = .boldSystemFont(ofSize: 24)
                $0.textColor = .systemGreen
                $0.text = cellData.chatroomName
            }
        }
    }
    
    func configureDateAndLastChat() {
        if let cellData {
            chatRoomUpdateDate.forEach {
                $0.font = .systemFont(ofSize: 15)
                $0.textColor = .darkGray
                $0.text = cellData.chatList.last?.date
            }
            chatRoomLastChat.forEach {
                $0.font = .systemFont(ofSize: 15)
                $0.textColor = .darkGray
                $0.text = cellData.chatList.last?.message
            }
        }
    }
    
    func setCellData(_ cellData: GetChatRoomDTO) {
        self.cellData = cellData;
    }
}
