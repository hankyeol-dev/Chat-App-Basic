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
        
        configureView()
        configureTable()
        configureSearchBar()
    }
    
    func configureView() {
        //
    }
    
    func configureTable() {
        chatRoomTable.delegate = self
        chatRoomTable.dataSource = self
        chatRoomTable.rowHeight = 80
        chatRoomTable.register(UINib(nibName: SingleProfileCell.identifier, bundle: nil), forCellReuseIdentifier: SingleProfileCell.identifier)
        chatRoomTable.register(UINib(nibName: DoubleProfileCell.identifier, bundle: nil), forCellReuseIdentifier: DoubleProfileCell.identifier)
        chatRoomTable.register(UINib(nibName: TripleProfileCell.identifier, bundle: nil), forCellReuseIdentifier: TripleProfileCell.identifier)
        chatRoomTable.register(UINib(nibName: MoreThanTripleProfileCell.identifier, bundle: nil), forCellReuseIdentifier: MoreThanTripleProfileCell.identifier)
    }
    
    func configureSearchBar() {
        chatRoomSearchBar.delegate = self
    }

}

extension MainUIViewController: UISearchBarDelegate {
    
}

extension MainUIViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTransfer.getAllChatRoom().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = dataTransfer.getChatRoomById(id: indexPath.row + 1)

        switch data.chatroomImage.count {
        case 1:
            let cell = chatRoomTable.dequeueReusableCell(withIdentifier: SingleProfileCell.identifier, for: indexPath) as! SingleProfileCell
            
            cell.setData(data)
            
            return cell
        case 2:
            let cell = chatRoomTable.dequeueReusableCell(withIdentifier: DoubleProfileCell.identifier, for: indexPath) as! DoubleProfileCell
            
            cell.setData(data)
            
            return cell
        case 3:
            let cell = chatRoomTable.dequeueReusableCell(withIdentifier: TripleProfileCell.identifier, for: indexPath) as! TripleProfileCell
            
            cell.setData(data)
            
            return cell
        default:
            let cell = chatRoomTable.dequeueReusableCell(withIdentifier: MoreThanTripleProfileCell.identifier, for: indexPath) as! MoreThanTripleProfileCell
            
            cell.setData(data)
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: ChatUIViewController.identifier) as! ChatUIViewController
        
        vc.setData(dataTransfer.getChatRoomById(id: indexPath.row + 1))
        
        navigationController?.pushViewController(vc, animated: true)
        
        chatRoomTable.reloadRows(at: [indexPath], with: .none)
    }
}
