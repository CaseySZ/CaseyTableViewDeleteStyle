//
//  ViewController.swift
//  PersonReport
//
//  Created by Casey on 07/11/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import UIKit
//import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.init(rgb: 0x28323B)
        // self.navigationController?.navigationBar.isTranslucent = true
        
        self.title = " 个人中心 UI"
        
        UIApplication.shared.delegate?.window??.addSubview(self.view)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let vc = PersonReportInfoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

