//
//  ViewController.swift
//  Custom TableView Cell
//
//  Created by Wai Phyo  on 6/11/19.
//  Copyright © 2019 waiphyoaung. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var tbllist : UITableView!
    var name = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tbllist.tableFooterView = UIView.init(frame: .zero)
        tbllist.dataSource = self
         tbllist.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if let lbl = cell?.contentView.viewWithTag(101) as? UILabel{
            lbl.text = name[indexPath.row]
           
        }
        if let btn = cell?.contentView.viewWithTag(102) as? UIButton{
            btn.addTarget(self, action: #selector(deleteRow(_:)), for: .touchUpInside)
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    @IBAction func addRow(_sender : UIButton){
        name.insert("New Nmae" + String(name.count+1), at: 0);
        tbllist.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
    }
    
    @objc func deleteRow(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tbllist)
        guard let indexPath = tbllist.indexPathForRow(at: point) else{
            return
        }
        name.remove(at: indexPath.row)
        tbllist.deleteRows(at: [indexPath], with: .left)
    }


}

