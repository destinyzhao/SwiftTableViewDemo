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
        self.btnSelect.setImage(UIImage.init(named: "message_selcet_n"), forState: UIControlState.Normal)
        self.btnSelect.addTarget(self, action: #selector(selectAction(_:)), forControlEvents:UIControlEvents.TouchUpInside)
        view.addSubview(btnSelect)
    }
    
    override func layoutSubviews() {
        self.btnSelect.frame = CGRectMake(0, (self.contentView.frame.size.height - 40)/2, 40, 40)
    }
    
    func selectAction(sender:UIButton) {
        if (!customSelected) {
            self.customSelected = true;
            self.btnSelect.setImage(UIImage.init(named: "message_selcet_s"), forState: UIControlState.Normal)
        }else
        {
            self.customSelected = false;
            self.btnSelect.setImage(UIImage.init(named: "message_selcet_n"), forState: UIControlState.Normal)
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
            self.btnSelect.setImage(UIImage.init(named: "message_selcet_s"), forState: UIControlState.Normal)
        }
        else
        {
            self.customSelected = false;
            self.btnSelect.setImage(UIImage.init(named: "message_selcet_n"), forState: UIControlState.Normal)
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
