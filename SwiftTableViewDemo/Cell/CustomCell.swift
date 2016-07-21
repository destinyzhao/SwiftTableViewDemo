//
//  CustomCell.swift
//  SwiftTableViewDemo
//
//  Created by Alex on 16/7/19.
//  Copyright © 2016年 Alex. All rights reserved.
//

import UIKit
import Kingfisher

typealias CellSelectBlock = (selected:Bool, row:Int) -> Void

class CustomCell: UITableViewCell {
    // 商品图片
    @IBOutlet weak var goodsImgView: UIImageView!
    // 商品名称
    @IBOutlet weak var goodsNameLbl: UILabel!
    // 商品价格
    @IBOutlet weak var goodsPriceLbl: UILabel!
    
    var btnSelect:UIButton!
    var deleteBtn:UIButton!
    var deleteView:UIView!
    
    var row:Int = 0
    var customSelected:Bool = false
    var cellSelectBlock:CellSelectBlock?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let view:UIView = UIView(frame:self.contentView.bounds)
        view.backgroundColor = UIColor.clearColor()
        self.backgroundView = view
        
        self.btnSelect = UIButton()
        self.btnSelect.setImage(UIImage(named: "message_selcet_n"), forState: UIControlState.Normal)
        self.btnSelect.addTarget(self, action: #selector(selectAction(_:)), forControlEvents:UIControlEvents.TouchUpInside)
        view.addSubview(btnSelect)
        
        /*自定义删除*/
        // 左侧删除按钮
        self.deleteBtn = UIButton()
        self.deleteBtn.setImage(UIImage(named: "message_selcet_s"), forState: UIControlState.Normal)
        self.deleteBtn.backgroundColor = UIColor.clearColor()
        //在cell中添加一个view
        self.deleteView = UIView()
        self.deleteView.backgroundColor = UIColor.grayColor()
        self.contentView.addSubview(deleteView)
        self.contentView.addSubview(deleteBtn)
    }
    
    override func layoutSubviews() {
        let cellWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
        let cellHeight = self.frame.size.height
        // 设置多选按钮frame
        self.btnSelect.frame = CGRectMake(0, (self.contentView.frame.size.height - 40)/2, 40, 40)
        // 设置删除按钮frame
        self.deleteBtn.frame = CGRectMake(cellWidth+10, (cellHeight-50)/2, 50, 50)
        // 设置删除View frame
        self.deleteView.frame = CGRectMake(cellWidth, 0, cellWidth, cellHeight)
    }
    
    func selectAction(sender:UIButton) {
        if (!customSelected) {
            self.customSelected = true;
            self.btnSelect.setImage(UIImage(named: "message_selcet_s"), forState: UIControlState.Normal)
        }else
        {
            self.customSelected = false;
            self.btnSelect.setImage(UIImage(named: "message_selcet_n"), forState: UIControlState.Normal)
        }
        
        if (cellSelectBlock != nil) {
            cellSelectBlock!(selected: customSelected,row: row)
        }
    }
    
    func showCellWithData(goods:GoodsModel) {
    
        goodsImgView.kf_setImageWithURL(NSURL(string: goods.goodsImgUrl)!)
        goodsNameLbl.text = goods.goodsName
        goodsPriceLbl.text = "价格:" + goods.goodsPrice
    }
    
    func selectedBtton(select:Bool) -> Void {
        if (select) {
            self.customSelected = true;
            self.btnSelect.setImage(UIImage(named: "message_selcet_s"), forState: UIControlState.Normal)
        }
        else
        {
            self.customSelected = false;
            self.btnSelect.setImage(UIImage(named: "message_selcet_n"), forState: UIControlState.Normal)
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
