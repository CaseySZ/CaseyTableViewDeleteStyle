//
//  DeleteBottomMenuView.swift
//  PersonReport
//
//  Created by Casey on 09/11/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import UIKit

class DeleteBottomMenuView: UIView {

    
    let allSelectButton = UIButton()
    let deleteButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUIProperty()
        initLayoutSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initUIProperty()  {
        
        allSelectButton.setTitle("全选", for: .normal)
        allSelectButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        allSelectButton.setTitleColor(.white, for: .normal)
        allSelectButton.contentVerticalAlignment = .center
        self.addSubview(allSelectButton)
        
        
        deleteButton.setImage(UIImage.init(named: "删除-2.png"), for: .normal)
        deleteButton.contentVerticalAlignment = .center
        self.addSubview(deleteButton)
    }
    
    
    private func initLayoutSubview()  {
        
        allSelectButton.snp.makeConstraints { (make) in
            
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(48)
            make.width.equalTo(82)
            
        }
        
        deleteButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(48)
            make.width.equalTo(82)
        }
    }
    
}
