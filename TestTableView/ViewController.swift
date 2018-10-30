//
//  ViewController.swift
//  TestTableView
//
//  Created by 粘光裕 on 2018/10/29.
//  Copyright © 2018年 com.open.lib. All rights reserved.
//

import UIKit
class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}


class ViewController: UIViewController {
    @IBOutlet weak var mTableView: UITableView!
    var list = ["Kevin","Mary","Jay","Steven"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //set ViewController as UITableViewDelegate's Delegate
        mTableView.delegate = self
        //set ViewController as UITableViewDataSource's Delegate
        mTableView.dataSource = self
        
        //應有一個按鈕來修改這個flag的Bool值,true就是代表在編輯模式下(可以重新排序),false表示在非編輯模式(可以左滑刪除)
        mTableView.isEditing = false

    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mTableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! CustomTableViewCell
        cell.mLabel.text = list[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "刪除") {
            action, index in
            self.list.remove(at: index.row)
            self.mTableView.reloadData()
        }
        return [deleteAction]
    }
    
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if mTableView.isEditing {
            return .none
        } else {
            return .delete
        }
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = list[sourceIndexPath.row]
        list.remove(at: sourceIndexPath.row)
        list.insert(itemToMove, at: destinationIndexPath.row)
    }
    
    
    
}
