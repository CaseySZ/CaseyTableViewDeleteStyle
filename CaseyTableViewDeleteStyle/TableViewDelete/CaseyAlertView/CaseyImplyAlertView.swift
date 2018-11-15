//
//  CaseyImplyAlertView.swift
//  PersonReport
//
//  Created by Casey on 10/11/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

import UIKit

class CaseyImplyAlertView: UIView {

    
    static var __implyAlertView:CaseyImplyAlertView = CaseyImplyAlertView()
    static func shareInstance()  -> CaseyImplyAlertView {
        
        return __implyAlertView
    }
    

    private var _callbackBlock: ((_ cancel:Bool)->Void)?
    
    
    private let _implyBackGroundView = UIView()
    private let _implyVisualEfView = UIVisualEffectView.init(effect: UIBlurEffect.init(style: UIBlurEffect.Style.extraLight)) //
    private let _implyDescLabel = UILabel()
    private let _implyStatusImageV = UIImageView()
    private let _sureButtton = UIButton()
    private let _cancelButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUIProperty()
        initLayoutSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    private func initUIProperty()  {
        
        _implyBackGroundView.backgroundColor = UIColor.clear
        self.addSubview(_implyBackGroundView)
        
        _implyVisualEfView.alpha = 0.9
        _implyBackGroundView.addSubview(_implyVisualEfView)
        
        _implyStatusImageV.image = UIImage.init(named: "错误提示icon.png")
        _implyBackGroundView.addSubview(_implyStatusImageV)
        
        
        _implyDescLabel.textColor = UIColor.init(rgb: 0x333333)
        _implyDescLabel.font = UIFont.systemFont(ofSize: 14)
        _implyBackGroundView.addSubview(_implyDescLabel)
        
        _cancelButton.setTitle("取消", for: .normal)
        _cancelButton.setTitleColor(UIColor.init(rgb: 0x333333), for: .normal)
        _cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        _cancelButton.addTarget(self, action: #selector(cancelEvent(_:)), for: .touchUpInside)
        _implyBackGroundView.addSubview(_cancelButton)
        
        
        _sureButtton.setTitle("确认", for: .normal)
        _sureButtton.setTitleColor(UIColor.init(rgb: 0x333333), for: .normal)
        _sureButtton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        _sureButtton.addTarget(self, action: #selector(sureEvent(_:)), for: .touchUpInside)
        _implyBackGroundView.addSubview(_sureButtton)
        
        
    }
    
    private func initLayoutSubview()    {
        
        _implyVisualEfView.snp.updateConstraints { (make) in
            
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
   
    
    
    private func deleteOpreationLayoutSubview(_ implyInfo:String){
        

        _sureButtton.isHidden = false
        _cancelButton.isHidden = false
        _implyDescLabel.text = implyInfo
        _implyStatusImageV.image = UIImage.init(named: "错误提示icon.png")
        
       
        let navBar = (UIApplication.shared.delegate?.window??.rootViewController as? UINavigationController)?.navigationBar
        let viewHeight = (navBar?.bottom ?? 64) + 104
        self.frame = CGRect.init(x: 0, y: 0, width: CScreenWidth, height: viewHeight)
        _implyBackGroundView.frame = CGRect.init(x: 0, y: viewHeight-104, width: CScreenWidth, height: 104)
        
        _implyStatusImageV.snp.removeConstraints()
        _implyDescLabel.snp.removeConstraints()
        _sureButtton.snp.removeConstraints()
        _implyDescLabel.snp.removeConstraints()
        
        
        _implyStatusImageV.snp.updateConstraints { (make) in

            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(32)
            make.width.equalTo(20)
            make.height.equalTo(20)

        }
        
        
        _implyDescLabel.snp.updateConstraints { (make) in
            
            make.left.equalToSuperview().offset(50)
            make.centerY.equalTo(_implyStatusImageV.snp.centerY)
            make.width.equalTo(200)
            make.height.equalTo(24)
            
        }
        
        
        _sureButtton.snp.updateConstraints { (make) in
            
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-15)
            make.width.equalTo(50)
            make.height.equalTo(20)
            
        }
        
        _cancelButton.snp.updateConstraints { (make) in
            
            make.right.equalTo(_sureButtton.snp.left).offset(-15)
            make.bottom.equalToSuperview().offset(-15)
            make.width.equalTo(50)
            make.height.equalTo(20)
            
        }
        
    }
    
    
    private func finishStyleLayoutSubView(_ implyInfo:String) {
        
        _sureButtton.isHidden = true
        _cancelButton.isHidden = true
        _implyDescLabel.text = implyInfo
        _implyStatusImageV.image = UIImage.init(named: "正确提示icon.png")
        
        self.frame = CGRect.init(x: 0, y: 0, width: CScreenWidth, height: CScreenHeight)
        let navBar = (UIApplication.shared.delegate?.window??.rootViewController as? UINavigationController)?.navigationBar
        
        _implyBackGroundView.frame = CGRect.init(x: 0, y: navBar?.bottom ?? 64 + 1, width: CScreenWidth, height: 80)
        
        _implyStatusImageV.snp.removeConstraints()
        _implyDescLabel.snp.removeConstraints()
        
        _implyStatusImageV.snp.updateConstraints { (make) in

            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(20)

        }

        _implyDescLabel.snp.updateConstraints { (make) in

            make.left.equalToSuperview().offset(50)
            make.centerY.equalTo(_implyStatusImageV.snp.centerY)
            make.width.equalTo(200)
            make.height.equalTo(24)

        }
        
        
    }
    
    //
    func showDeleteImply(_ implyInfo:String, block:@escaping (_ cancel:Bool)->Void)  {
        
        
        _callbackBlock = nil
        if self.superview != nil{
            self.removeFromSuperview()
        }
        
        _callbackBlock = block
        UIApplication.shared.windows.last?.addSubview(self)
        
        deleteOpreationLayoutSubview(implyInfo)
    }
    
    func showFinishImply(_ implyInfo:String, _ deley:Float = 1.5)  {
        
        if self.superview != nil{
            self.removeFromSuperview()
        }
        
        UIApplication.shared.windows.last?.addSubview(self)
        finishStyleLayoutSubView(implyInfo)
        self.perform(#selector(cancelEvent(_:)), with: nil, afterDelay: TimeInterval(deley))
    }
    
    
    @objc private  func cancelEvent(_ sender: UIButton) {
        
        self.removeFromSuperview()
        if let block = _callbackBlock {
            
            block(true)
        }
        _callbackBlock = nil
    }
    
    @objc private func sureEvent(_ sender: UIButton) {
        
        if let block = _callbackBlock {
            
            block(false)
        }
        _callbackBlock = nil
    }
}
