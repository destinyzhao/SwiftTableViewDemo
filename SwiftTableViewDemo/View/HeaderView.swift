//
//  HeaderView.swift
//  SwiftTableViewDemo
//
//  Created by Alex on 16/7/26.
//  Copyright © 2016年 Alex. All rights reserved.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        /*xcode 提示Setting the background color on UITableViewHeaderFooterView has been deprecated. Please use contentView.backgroundColor instead.
         检查xib BackGround 设置为 Default
         */
        
        // 设headerView背景色
        self.backgroundView = UIView(frame: self.bounds)
        self.backgroundView!.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
