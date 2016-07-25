//
//  ViewController.swift
//  SwiftTableViewDemo
//
//  Created by Alex on 16/7/19.
//  Copyright © 2016年 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    // Tableview
    @IBOutlet weak var tableView: UITableView!
    // title 数组
    var dataArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 初始化数据
    func loadData() -> Void {
        dataArray = ["TableView多选和左滑自定义删除","下拉刷新","自定义TableView"]
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier:String = "myCell"
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,reuseIdentifier: identifier)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        if (dataArray.count > 0 && indexPath.row < dataArray.count) {
            cell.textLabel?.text = dataArray[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegueWithIdentifier("EditTableViewVC", sender: nil)
        case 1:
            self.performSegueWithIdentifier("RefreshTableVC", sender: nil)
        case 2:
            self.performSegueWithIdentifier("CustomTableVC", sender: nil)
        default: break
            
        }
    }
    
}

