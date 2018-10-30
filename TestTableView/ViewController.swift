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
    let list = ["Kevin","Mary","Jay","Steven"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //set ViewController as UITableViewDelegate's Delegate
        mTableView.delegate = self
        //set ViewController as UITableViewDataSource's Delegate
        mTableView.dataSource = self
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
    
}
