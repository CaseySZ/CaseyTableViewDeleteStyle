//
//  ReportInfoCell.swift
//  PersonReport
//
//  Created by Casey on 07/11/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import UIKit

class DepositReportInfoCell: UITableViewCell {


    static let cellHeight:CGFloat = 90.0 // cell高度
    
    let _contentBgView = UIView()
    let _logImageView = UIImageView() // log ImageView
    let _payStyleNameLabel = UILabel() // 支付方式/类型
    let _payDateLabel = UILabel() // 支付日期+时间
    let _payMoneyLabel = UILabel() // 支付金额
    let _payStatusLabel = UILabel() // 支付状态
    
    
    let editButton =  CellEditButton() // 编辑状态：左边编辑View
    
    // 不可删除透明遮罩
    let _neverDeleteMaskView = UIVisualEffectView.init(effect: UIBlurEffect.init(style: UIBlurEffect.Style.extraLight)) //
    let _neverDeleteDescLabel = UILabel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initUIProperty()
        initLayoutSubViews()
    }
    
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        if let targertView = self.searchSubViewOfClassName("UITableViewCellEditControl") {
            
            targertView.isHidden = true
            editButton.isHidden = false
            _neverDeleteMaskView.isHidden = false
            
            editButton.removeFromSuperview()
            editButton.frame = targertView.frame
            self.addSubview(editButton)
            
            
        }else {
            
            editButton.isSelected = false
            editButton.isHidden = true
            _neverDeleteMaskView.isHidden = true
        }
        
    }
    
    func initUIProperty()  {
        
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        
        editButton.setImage(UIImage(named: "原点icon.png"), for: .normal)
        editButton.setImage(UIImage(named: "正确提示icon.png"), for: .selected)
        editButton.addTarget(self, action: #selector(editStatusSelectEvent(_:)), for: .touchUpInside)
        
        
        
        _contentBgView.backgroundColor = UIColor.init(rgb: 0x2A2E32)
        _contentBgView.layer.cornerRadius = 5
        self.contentView.addSubview(_contentBgView)
        
        
        _logImageView.image = UIImage.init(named: "在线支付.png")
        _contentBgView.addSubview(_logImageView)
        
        _payStyleNameLabel.font = UIFont.systemFont(ofSize: 16)
        _payStyleNameLabel.textColor = .white
        _payStyleNameLabel.textAlignment = .left
        _payStyleNameLabel.text = "银联支付"
        _contentBgView.addSubview(_payStyleNameLabel)
        
        _payDateLabel.text = "09-19 17:34"
        _payDateLabel.font = UIFont.systemFont(ofSize: 14)
        _payDateLabel.textColor = UIColor.init(rgb: 0x888888)
        _payDateLabel.textAlignment = .left
        _contentBgView.addSubview(_payDateLabel)
        
        
        
        _payMoneyLabel.text = "¥5,000.00"
        _payMoneyLabel.font = UIFont.systemFont(ofSize: 16)
        _payMoneyLabel.textColor = .white
        _payMoneyLabel.textAlignment = .right
        _contentBgView.addSubview(_payMoneyLabel)
        
        _payStatusLabel.text = "拒绝"
        _payStatusLabel.font = UIFont.systemFont(ofSize: 14)
        _payStatusLabel.textColor = UIColor.init(rgb: 0xFA2663)
        _payStatusLabel.textAlignment = .right
        _contentBgView.addSubview(_payStatusLabel)
        
        
        // 不可删除 遮罩
        _neverDeleteDescLabel.text = "不可删除"
        _neverDeleteDescLabel.textAlignment = .center
        _neverDeleteDescLabel.textColor = .white
        _neverDeleteDescLabel.font = UIFont.systemFont(ofSize: 14)
        _neverDeleteDescLabel.backgroundColor = UIColor.clear
        _neverDeleteMaskView.contentView.addSubview(_neverDeleteDescLabel)
        
        _neverDeleteMaskView.alpha = 0.9
        _contentBgView.addSubview(_neverDeleteMaskView)
    }
    
    func initLayoutSubViews()  {
        
        _contentBgView.snp.makeConstraints { (make) in
            
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-5)
            
        }
        
        _logImageView.snp.makeConstraints { (make) in
            
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.width.equalTo(25)
            make.height.equalTo(25)
            
        }
        
        
        _payStyleNameLabel.snp.makeConstraints { (make) in

            make.left.equalToSuperview().offset(65)
            make.width.equalTo(100)
            make.top.equalToSuperview().offset(15)
            make.height.equalTo(22)

        }
        
        _payDateLabel.snp.makeConstraints { (make) in

            make.left.equalToSuperview().offset(65)
            make.width.equalTo(100)
            make.bottom.equalToSuperview().offset(-15)
            make.height.equalTo(22)

        }

        _payMoneyLabel.snp.makeConstraints { (make) in

            make.right.equalToSuperview().offset(-15)
            make.left.equalTo(_payStyleNameLabel.snp.right).offset(5)
            make.top.equalToSuperview().offset(15)
            make.height.equalTo(22)
        }
        

        _payStatusLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-15)
            make.width.equalTo(90)
            make.bottom.equalToSuperview().offset(-15)
            make.height.equalTo(22)
        }
        
        
        // 不可删除 遮罩
        _neverDeleteDescLabel.snp.makeConstraints { (make) in
            
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        _neverDeleteMaskView.snp.makeConstraints { (make) in
            
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    
    @objc func editStatusSelectEvent(_ sender:UIButton)  {
        
        sender.isSelected = !sender.isSelected
        // 处理model逻辑
        
        
    }
    
}
