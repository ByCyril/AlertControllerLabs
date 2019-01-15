//
//  MyAlert.swift
//  AlertControllersLab
//
//  Created by Cyril Garcia on 1/14/19.
//  Copyright © 2019 Cyril Garcia. All rights reserved.
//

import UIKit

class MyAlert: UIViewController {
    
    private var containerView: UIView!
    private var actionContainer: UIStackView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.alertSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func alertSetup() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
        
        self.addDismissTapGesture()
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        self.containerView = {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width - 50, height: 200))
            view.center = CGPoint(x: width / 2, y: height / 2)
            view.backgroundColor = .white
            
            self.actionContainer = UIStackView(frame: CGRect(x: 0, y: view.frame.height - 50, width: view.frame.width, height: 50))
            self.actionContainer.distribution = .fillEqually

            view.addSubview(self.actionContainer)
            return view
        }()
        
        self.view.addSubview(self.containerView)
        
    }
    
    private func addDismissTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MyAlert.dismissAlert))
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
    }
    
    private func appendToContainer(_ button: UIButton) {
        self.actionContainer.addArrangedSubview(button)
    }
    
    @objc func dismissAlert() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func createButton(_ title: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 75))
        button.backgroundColor = UIColor.clear
        button.setTitle(title, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .orange
        return button
    }
    
    public func addAction(buttonTitle: String, action: Selector?, with target: Any?) {
        let button = self.createButton(buttonTitle)
        button.addTarget(target ?? self, action: action ?? #selector(MyAlert.dismissAlert), for: .touchUpInside)
    
        self.appendToContainer(button)
    }
    
    
    
    
}
