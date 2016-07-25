//
//  RefreshTableViewController.swift
//  SwiftTableViewDemo
//
//  Created by Alex on 16/7/25.
//  Copyright © 2016年 Alex. All rights reserved.
//

import UIKit
import XWSwiftRefresh

class RefreshTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       self.regiterRefsher()
    }
    
    func regiterRefsher() -> Void {
        
        self.tableView.headerView = XWRefreshNormalHeader(target: self, action: #selector(loadNewData))
        
        self.tableView.headerView?.beginRefreshing()
        self.tableView.headerView?.endRefreshing()
       
        self.tableView.footerView = XWRefreshAutoNormalFooter(target: self, action: #selector(loadMoreData))
    }
    
    func loadNewData() -> Void {
        print("刷新")
        //延迟执行 模拟网络延迟，实际开发中去掉
        xwDelay(1) { () -> Void in
//            self.tableView.reloadData()
            self.tableView.headerView?.endRefreshing()
        }

    }
    
    func loadMoreData() -> Void {
        print("加载更多")
        xwDelay(1) { () -> Void in
//            self.tableView.reloadData()
            self.tableView.footerView?.endRefreshing()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier:String = "myCell"
        let cell = UITableViewCell(style: UITableViewCellStyle.Default,reuseIdentifier: identifier)
        cell.textLabel?.text = "cell-\(indexPath.row)"
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
