//
//  MainUIViewController.swift
//  Chat App Basic
//
//  Created by 강한결 on 5/31/24.
//

import UIKit

class MainUIViewController: UIViewController {
    
    let dataTransfer = DataTransferApis()

    @IBOutlet var chatRoomSearchBar: UISearchBar!
    @IBOutlet var chatRoomTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        chatRoomSearchBar.delegate = self
        chatRoomTable.delegate = self
        chatRoomTable.dataSource = self
        chatRoomTable.register(UINib(nibName: ChatRoomViewCell.identifier, bundle: nil), forCellReuseIdentifier: ChatRoomViewCell.identifier)
        
        chatRoomTable.rowHeight = 120
    }

}

extension MainUIViewController: UISearchBarDelegate {
    
}

extension MainUIViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTransfer.getAllChatRoom().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatRoomTable.dequeueReusableCell(withIdentifier: ChatRoomViewCell.identifier, for: indexPath) as! ChatRoomViewCell
        
        cell.setCellData(dataTransfer.getChatRoomById(id: indexPath.row))
        
        return cell
    }
    
    
}
