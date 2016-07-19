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
    // Dic
    var dataArray = [AnyObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // xib cell
        //let nib = UINib(nibName: "CustomCellView", bundle: nil)
        //self.tableView.registerNib(nib, forCellReuseIdentifier: "CustomCell")
        
        self.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 初始化数据
    func loadData() -> Void {
        for i in 0...9 {
            var dic = [String:String]()
            dic["goodsImgUrl"] = "http://pic14.nipic.com/20110427/2944718_000916112196_2.jpg"
            dic["goodsName"] = "赵师傅红烧牦牛面\(i)"
            dic["goodsPrice"] = "20.0"
           
            dataArray.append(dic)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell .showCellWithDictionary(dataArray[indexPath.row] as! Dictionary<String, String>)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 76.0
    }


}

