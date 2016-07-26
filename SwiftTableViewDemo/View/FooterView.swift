//
//  FooterView.swift
//  SwiftTableViewDemo
//
//  Created by Alex on 16/7/26.
//  Copyright © 2016年 Alex. All rights reserved.
//

import UIKit

class FooterView: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        // 设headerView背景色
        self.backgroundView = UIView(frame: self.bounds)
        self.backgroundView!.backgroundColor = UIColor.yellowColor().colorWithAlphaComponent(0.5)
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
