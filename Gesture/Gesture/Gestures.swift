//
//  Gestures.swift
//  Gesture
//
//  Created by DCS on 07/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Gestures: UIViewController {
    

    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "bf.jpg")
        imageView.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        return imageView
    }()
    
    private let imagePicker:UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        return imagePicker
    }()
    
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "Tap On Square Box For"
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    private let myLabel1:UILabel = {
        let label = UILabel()
        label.text = "Choose To Gallery Image"
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
   
    
    @objc func handleButtonClick(){
        
    }
    override func viewDidLoad() {
        
        self.view.backgroundColor = .white
        title = "Gestures"
        super.viewDidLoad()
        print("run")
        view.addSubview(myImageView)
        view.addSubview(myLabel)
        view.addSubview(myLabel1)
       
         view.self.backgroundColor = .black
         imagePicker.delegate = self
        
        
       
        
        
        
        let tapGesture =  UITapGestureRecognizer(target: self, action: #selector(didTapView))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapGesture)
        
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(didPinchView))
        view.addGestureRecognizer(pinchGesture)
        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(didRotateView))
        view.addGestureRecognizer(rotationGesture)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeView))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeView))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeView))
        upSwipe.direction = .up
        view.addGestureRecognizer(upSwipe)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeView))
        downSwipe.direction = .down
        view.addGestureRecognizer(downSwipe)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPanView))
        view.addGestureRecognizer(panGesture)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myLabel.frame = CGRect(x: 20, y: view.height/2-240, width :view.width - 40, height: 40)
        myLabel1.frame = CGRect(x: 20, y: view.height/2-200, width :view.width - 40, height: 30)
        }
    
}

extension Gestures:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc private func didTapView(_ gesture:UITapGestureRecognizer){
        
        print("tapped at location: \(gesture.location(in: view))")
        print("gallery called")
        imagePicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imagePicker, animated: true)
        }
    }
    
    @objc private func didPinchView(_ gesture:UIPinchGestureRecognizer){
        
        myImageView.transform = CGAffineTransform(scaleX: gesture.scale, y: gesture.scale)
    }
    
    
    @objc private func didRotateView(_ gesture:UIRotationGestureRecognizer){
        
        myImageView.transform = CGAffineTransform(rotationAngle: gesture.rotation)
    }
    
    
    @objc private func didSwipeView(_ gesture:UISwipeGestureRecognizer){
        
        if gesture.direction == .left{
            UIView.animate(withDuration: 0.2, animations: {
                self.myImageView.frame = CGRect(x: self.myImageView.frame.origin.x - 40, y: self.myImageView.frame.origin.y, width: 200, height: 200)
            })
            
        } else if gesture.direction == .right{
            UIView.animate(withDuration: 0.2, animations: {
                self.myImageView.frame = CGRect(x: self.myImageView.frame.origin.x + 40, y: self.myImageView.frame.origin.y, width: 200, height: 200)
            })
            
        } else if gesture.direction == .up {
            UIView.animate(withDuration: 0.2, animations: {
                self.myImageView.frame = CGRect(x: self.myImageView.frame.origin.x, y: self.myImageView.frame.origin.y - 40, width: 200, height: 200)
            })
        } else if gesture.direction == .down{
            UIView.animate(withDuration: 0.2, animations: {
                self.myImageView.frame = CGRect(x: self.myImageView.frame.origin.x, y: self.myImageView.frame.origin.y + 40, width: 200, height: 200)
            })
        } else {
            
            print("Direction Could not be detect")
        }
    }
    
    @objc private func didPanView(_ gesture:UIPanGestureRecognizer){
        
        let x = gesture.location(in: view).x
        let y = gesture.location(in: view).y
        
        myImageView.center = CGPoint(x: x, y: y )
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            myImageView.image = selectedImage
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    
}
