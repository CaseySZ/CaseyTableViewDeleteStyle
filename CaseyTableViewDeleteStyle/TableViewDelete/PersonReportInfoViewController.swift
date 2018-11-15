//
//  PersonReportViewController.swift
//  PersonReport
//
//  Created by Casey on 07/11/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import UIKit
import SnapKit

// 40  48  
class PersonReportInfoViewController: UIViewController, UIScrollViewDelegate {
    
    
    let _depositReportView = DepositReportView()
    let _navRightButton:UIButton = UIButton()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TableView 删除Style"
        self.view.backgroundColor = UIColor.init(rgb: 0x28323B)
    
        initUIProperty()
        initLayoutSubview()
    }

    private func initUIProperty()  {
        
        _navRightButton.frame = CGRect.init(x: 0, y: 0, width: 60, height: 44)
        _navRightButton.setTitleColor(.white, for: .normal)
        _navRightButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        _navRightButton.setTitle("编辑", for: .normal)
        _navRightButton.addTarget(self, action: #selector(self.eidtStatusEvent(_:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: _navRightButton)
        
        
        self.view.addSubview(_depositReportView)
        
        
    }
    
    
    private func initLayoutSubview()  {
        

        _depositReportView.snp.makeConstraints { (make) in
            
            make.top.left.right.bottom.equalToSuperview()
            
        }

    }
    
    
   
    //MARK: 编辑状态button事件
    @objc private func eidtStatusEvent(_ sender:UIButton?) {
        
      
        _depositReportView.isEditStatus = !_depositReportView.isEditStatus
        
        
    }
    
    private func changeEidtButtonTitle(index:Int)  {
        
        var editStutus = false
        switch index {
        case 0: // 存款界面
            editStutus = _depositReportView.isEditStatus
        default:
            break
        }
        if editStutus {
            _navRightButton.setTitle("取消", for: .normal)
        }else{
            _navRightButton.setTitle("编辑", for: .normal)
        }
    }
    
    
    func finishEditEvent()  {
        
        _navRightButton.setTitle("编辑", for: .normal)
    }
    
    
}
