//
//  CustomTableView.swift
//  SwiftTableViewDemo
//
//  Created by Alex on 16/7/25.
//  Copyright © 2016年 Alex. All rights reserved.
//

import UIKit
import SnapKit

class CustomTableView: UITableView {
    
    var bgView:UIView!
    var imgView:UIImageView!
    var tipsLbl:UILabel!
    var _tips:String = ""
    var _noDataImage:UIImage!
    var _hideBgImgView:Bool = false
    var _hideTips:Bool = false

    var tips:String{
        get{
            return _tips
        }
        set{
            _tips = newValue
            tipsLbl.text = _tips
        }
    }
    
    var hideBgImgView:Bool{
        get {
            return _hideBgImgView
        }
        set{
            _hideBgImgView = newValue
            imgView.hidden = _hideBgImgView
        }
    }
    
    var hideTips:Bool{
        get{
            return _hideTips
        }
        set{
            _hideTips = newValue
            tipsLbl.hidden = _hideTips
        }
    }
    
    var noDataImage:UIImage{
        get{
            return _noDataImage
        }
        set {
            
            _noDataImage = newValue
            imgView.image = _noDataImage
            
            imgView.snp_makeConstraints { (make) in
                make.centerX.equalTo(bgView)
                make.centerY.equalTo(bgView).offset(-90)
                make.width.equalTo(newValue.size.width)
                make.height.equalTo(newValue.size.height)
            }
            
            tipsLbl.snp_makeConstraints { (make) in
                make.top.equalTo(imgView.snp_bottom).offset(10.0)
                make.right.equalTo(-10)
                make.left.equalTo(10)
                make.height.equalTo(30)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initSetting()
    }
    
    func initSetting() -> Void {
        
        bgView = UIView()
        self.backgroundView = bgView
        
        imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = true
        bgView.addSubview(imgView)
        
        tipsLbl = UILabel()
        tipsLbl.font = UIFont.systemFontOfSize(15.0)
        tipsLbl.textColor = UIColor.blackColor()
        tipsLbl.textAlignment = NSTextAlignment.Center
        bgView.addSubview(tipsLbl)
    }
    
    override func reloadData() {
        super.reloadData()
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.01 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            var count = 0
            let sectionsCount = self.numberOfSections
            
            for i in 0..<sectionsCount{
                count += self.numberOfRowsInSection(i)
            }
            
            if(count == 0){
                self.backgroundView?.hidden = false
            }
            else{
                self.backgroundView?.hidden = true
            }
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
