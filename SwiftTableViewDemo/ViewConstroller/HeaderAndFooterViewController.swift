//
//  HeaderAndFooterViewController.swift
//  SwiftTableViewDemo
//
//  Created by Alex on 16/7/26.
//  Copyright © 2016年 Alex. All rights reserved.
//

import UIKit

class HeaderAndFooterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.regiterHeaderAndFooterXib()
    }
    
    func regiterHeaderAndFooterXib() -> Void {
        tableView.registerNib(UINib(nibName: "HeaderView",bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderView")
        tableView.registerNib(UINib(nibName: "FooterView",bundle: nil), forHeaderFooterViewReuseIdentifier: "FooterView")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let indetifier = "myCell"
        let cell = UITableViewCell(style: UITableViewCellStyle.Default,reuseIdentifier: indetifier)
        cell.textLabel?.text = "cell-" + "\(indexPath.section)-" + "\(indexPath.row)"
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier("HeaderView") as! HeaderView
        headerView.titleLbl.text = "Header-" + "\(section)"
        return headerView
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier("FooterView") as! FooterView
        footerView.titleLbl.text = "Footer-" + "\(section)"
        return footerView
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
