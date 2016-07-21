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
    // 商品数组
    var dataArray = [AnyObject]()
    // 选中商品数组
    var selectDataArray = [AnyObject]()
    // 编辑按钮
    @IBOutlet weak var editorButtonItem: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // xib load cell
        //let nib = UINib(nibName: "CustomCellView", bundle: nil)
        //self.tableView.registerNib(nib, forCellReuseIdentifier: "CustomCell")
        
        self.tableView.allowsSelectionDuringEditing = true
        self.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 初始化数据
    func loadData() -> Void {
        for i in 0...29 {
            let goods = GoodsModel()
            goods.goodsId = "\(i)"
            goods.goodsName = "赵师傅红烧牦牛面\(i)"
            goods.goodsImgUrl = "http://pic14.nipic.com/20110427/2944718_000916112196_2.jpg"
            goods.goodsPrice = "20.0"
            
            dataArray.append(goods)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier:String = "CustomCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! CustomCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.row = indexPath.row
        let goods = dataArray[indexPath.row] as! GoodsModel
        cell.showCellWithData(goods)
        
        cell.cellSelectBlock = { (selected:Bool, row:Int) in
            if (selected) {
                print("selected:\(selected)" + "row:\(row)")
                self.selectDataArray.append(self.dataArray[indexPath.row])
            }
            else
            {
                print("selected:\(selected)" + "row:\(row)")
                // removeObject Array扩展方法
                self.selectDataArray.removeObject(goods)
            }
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 76.0
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {

        let cell:CustomCell = cell as! CustomCell
        let goods = dataArray[indexPath.row] as! GoodsModel

        if (selectDataArray as NSArray).containsObject(goods) {
            cell.selectedBtton(true)
        }
        else
        {
            cell.selectedBtton(false)
        }
    
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 编辑状态下多选
        if (self.tableView.editing) {
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! CustomCell
            cell.selectAction(cell.btnSelect)
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Insert
    }
    
    @IBAction func editorBtnClicked(sender: UIButton) {
        if (!self.tableView.editing) {
            self.tableView.setEditing(true, animated: false)
            editorButtonItem.setTitle("完成", forState: UIControlState.Normal)
            self.tableView .reloadData()
        }
        else
        {
            self.tableView.setEditing(false, animated: false)
            editorButtonItem.setTitle("编辑", forState: UIControlState.Normal)
            self.tableView.reloadData()
        }
    }

}

