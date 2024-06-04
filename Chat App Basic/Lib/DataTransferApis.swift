//
//  DataTransferApi.swift
//  Chat App Basic
//
//  Created by 강한결 on 5/31/24.
//

import Foundation

struct GetChatRoomDTO {
    let chatroomId: Int
    let chatroomImage: [String]
    let chatroomName: String
    var chatList: [Chat]
}

class DataTransferApis {
    init() {}
    
    private let chatroomList: [ChatRoom] = mockChatList
    
    func getAllChatRoom() -> [ChatRoom] {
        return chatroomList
    }
    
    func getChatRoomById(id: Int) -> GetChatRoomDTO {
        let findChatRoom = _filter(chatroomList, { $0.chatroomId == id })
                
        // 에러를 던져야 하지만, 아직은 새로운 인스턴스를 생성해서 던져주는 정도로만
        return  GetChatRoomDTO(
            chatroomId: findChatRoom[0].chatroomId,
            chatroomImage: findChatRoom[0].chatroomImage,
            chatroomName: findChatRoom[0].chatroomName,
            chatList: findChatRoom[0].chatList
        )
    }
    
    func getSingleChatById(id: Int, chatIndex: Int) -> Chat {
        let findChatRoom = _filter(chatroomList, {$0.chatroomId == id})
        
        return findChatRoom[0].chatList[chatIndex]
    }
}
