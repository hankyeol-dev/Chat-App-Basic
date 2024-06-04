//
//  ChatUIViewController.swift
//  Chat App Basic
//
//  Created by 강한결 on 5/31/24.
//

import UIKit

class ChatUIViewController: UIViewController {
    var viewData: GetChatRoomDTO?
    
    @IBOutlet var chatTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTable()
        
        navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(systemName: "arrow.uturn.backward.circle"), style: .plain, target: self, action: #selector(goBack)), animated: true)
    }
    
    func configureTable() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.register(UINib(nibName: OtherUserChat.identifier, bundle: nil), forCellReuseIdentifier: OtherUserChat.identifier)
        chatTableView.register(UINib(nibName: MyChat.identifier, bundle: nil), forCellReuseIdentifier: MyChat.identifier)
        chatTableView.rowHeight = UITableView.automaticDimension
        chatTableView.separatorColor = .clear
        
    }
    
    func setData(_ data: GetChatRoomDTO) {
        viewData = data
        
        if let viewData {
            navigationItem.title = viewData.chatroomName
        }
    }
    
    @objc func goBack(_ sender: UIBarItem) {
        navigationController?.popViewController(animated: true)
    }
}

extension ChatUIViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewData else { return 0 }
        return viewData.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let viewData else {
            let cell = chatTableView.dequeueReusableCell(withIdentifier: DefaultCell.identifier, for: indexPath)
            return cell
        }
        
        if viewData.chatList[indexPath.row].user == .user {
            let cell = chatTableView.dequeueReusableCell(withIdentifier: MyChat.identifier, for: indexPath) as! MyChat
            cell.setCellData(viewData.chatList[indexPath.row])
            return cell
        } else {
            let cell = chatTableView.dequeueReusableCell(withIdentifier: OtherUserChat.identifier, for: indexPath) as! OtherUserChat
            
            cell.setCellData(viewData.chatList[indexPath.row])
            
            return cell
        }
        
    }
    
    
    
}
