//
//  DepositReportView.swift
//  PersonReport
//
//  Created by Casey on 07/11/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import UIKit


// 存款View
class DepositReportView: UIView ,  UITableViewDelegate, UITableViewDataSource {

    
    private let _tableView = ReportTableView()
    private let _deleteBottomMenuView = DeleteBottomMenuView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        initUIProperty()
        initLayoutSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initUIProperty()  {
        
        
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.separatorStyle = .none
        _tableView.estimatedRowHeight = 0;
        _tableView.backgroundColor = UIColor.clear
        self.addSubview(_tableView)
        
        _deleteBottomMenuView.backgroundColor = UIColor.init(rgb: 0x141723)
        _deleteBottomMenuView.allSelectButton.addTarget(self, action: #selector(self.allSelectDeteteEvent(_sender:)), for: .touchUpInside)
        _deleteBottomMenuView.deleteButton.addTarget(self, action: #selector(self.deteteEvent(_sender:)), for: .touchUpInside)
        
        
    }
    
    private func initLayoutSubview(){
        
        
        _tableView.snp.updateConstraints { (make) in
            
            make.top.equalToSuperview();
            make.right.equalToSuperview();
            make.left.equalToSuperview();
            make.bottom.equalToSuperview();
        }
        
        _deleteBottomMenuView.isHidden = true
    }
    
    // 编辑模式下的布局
    private func editStyleLayoutSubview()  {
        
        _tableView.snp.updateConstraints { (make) in
            
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().offset(-48)
        }
        
        if _deleteBottomMenuView.superview == nil {
            self.addSubview(_deleteBottomMenuView)
        }
        _deleteBottomMenuView.isHidden = false
        
        _deleteBottomMenuView.snp.updateConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(48)
        }
        
    }
  
    
    //MARK: 界面编辑状态
    private var _isEditStatus:Bool = false // 默认view是不编辑状态的
    var isEditStatus:Bool {
        
        get{
            
            return _isEditStatus
            
        }set{
            
            _isEditStatus = newValue
            
            if _isEditStatus {
                
                _tableView.setEditing(false, animated: false)
                _tableView.setEditing(true, animated: true)
                editStyleLayoutSubview()
                
            }else{
                
                _tableView.setEditing(false, animated: true)
                initLayoutSubview()
            }
            
            
            _tableView.reloadData()
            
        }
        
    }
    
    
    // MARK: 全选和删除事件
    @objc private func allSelectDeteteEvent(_sender: UIButton) {
        
        
    }
    
    @objc private func deteteEvent(_sender: UIButton) {
        
        CaseyImplyAlertView.shareInstance().showDeleteImply("确定删除您选中的信息吗?") { (cancel) in
            
            if !cancel {
                
                CaseyImplyAlertView.shareInstance().showFinishImply("您的删除操作已完成")
                self.isEditStatus = false
                
            }
            
        }
        
    }
    
    
    //MARK: TableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rowCount = 10
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return DepositReportInfoCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "ReportInfoCell")
        if cell == nil {
            
            cell = DepositReportInfoCell.init(style: .default, reuseIdentifier: "ReportInfoCell")
            cell?.selectionStyle = .none
            
        }
        return cell ?? UITableViewCell();
    }
 
    // delete status
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        
       
        if indexPath.row%2 == 0{
            _tableView.currentCellDeteteStyle = false
            return "不可\n删除" 
        }else{
            _tableView.currentCellDeteteStyle = true
            return "删除"
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        if self.isEditStatus {
            return .insert
        }else{
            return .delete
        }
        // return UITableViewCell.EditingStyle(rawValue: UITableViewCell.EditingStyle.delete.rawValue | UITableViewCell.EditingStyle.insert.rawValue)!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
        }
    }
    
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //UISwipeActionPullView
    }
    
}








