//
//  CellEditButton.swift
//  PersonReport
//
//  Created by Casey on 09/11/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import UIKit

class CellEditButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.imageView?.width = 20
        self.imageView?.heigth = 20
        self.imageView?.centerY = self.heigth/2
        self.imageView?.right = self.width-8
        
        
//        self.imageView?.snp.makeConstraints({ (make) in
//
//            make.right.equalToSuperview().offset(-8)
//            make.centerY.equalToSuperview()
//            make.width.equalTo(20)
//            make.height.equalTo(20)
//
//
//        })
        
       
        
    }

}
