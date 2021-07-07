//
//  ViewController.swift
//  Gesture
//
//  Created by DCS on 06/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let bimage: UIImageView = {
        let bimage = UIImageView()
        bimage.image = UIImage(named: "bg.jpg")
        return bimage
    }()

    private let myButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tap It Here",for: .normal)
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 30
        
        return button
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bimage)
        view.addSubview(myButton)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bimage.frame = CGRect(x: 0, y: view.safeAreaInsets.top,width: 380, height: 600)
        myButton.frame = CGRect(x:110, y: 420, width: 150, height: 60 )
    }
    
    @objc func handleButtonClick(){
        print("click!")
        
        let vc = Gestures()
        
        navigationController?.pushViewController(vc, animated: true)
    }

}

