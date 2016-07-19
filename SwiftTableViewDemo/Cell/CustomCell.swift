//
//  CustomCell.swift
//  SwiftTableViewDemo
//
//  Created by Alex on 16/7/19.
//  Copyright © 2016年 Alex. All rights reserved.
//

import UIKit
import Kingfisher

class CustomCell: UITableViewCell {
    // 商品图片
    @IBOutlet weak var goodsImgView: UIImageView!
    // 商品名称
    @IBOutlet weak var goodsNameLbl: UILabel!
    // 商品价格
    @IBOutlet weak var goodsPriceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func showCellWithDictionary(dic:Dictionary<String,String>) {
    
        goodsImgView.kf_setImageWithURL(NSURL(string: dic["goodsImgUrl"]!)!)
        goodsNameLbl.text = dic["goodsName"]
        goodsPriceLbl.text = "价格:" + dic["goodsPrice"]!
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
