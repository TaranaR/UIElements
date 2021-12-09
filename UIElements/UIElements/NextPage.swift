//
//  NextPage.swift
//  UIElements
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class NextPage: UIViewController {

    private let myActivityIndicatorView:UIActivityIndicatorView={
        let activity=UIActivityIndicatorView()
        activity.color = .blue
        return activity
    }()
    
    private let myImageView:UIImageView={
        let imageView=UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds=true
        
        return imageView
    }()
    
    private let imagePicker:UIImagePickerController={
        let ip=UIImagePickerController()
        ip.allowsEditing=false
        return ip
    }()
    
    private let myLableHead:UILabel={
        let label=UILabel()
        label.text="Upload Profile"
        label.textAlignment = .center
        label.font = UIFont(name:"ArialRoundedMTBold", size:20)
        label.textColor = .black
        return label
    }()
    
    let progress = Progress(totalUnitCount: 5)
    
    private let toolBar:UIToolbar={
        let toolBar=UIToolbar()
        let space=UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let gallery=UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(handleGallery))
        let camera=UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(handleCamera));        toolBar.items=[space,gallery,camera]
        return toolBar
    }()
    @objc private func handleGallery(){
       
        imagePicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imagePicker, animated: true)
        }
    }
    @objc private func handleCamera(){
        //print("camera called")
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
            DispatchQueue.main.async {
                self.present(self.imagePicker, animated: true)
            }
        }
    }
    
    func callActivityIndicator(){
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            (timer) in
            guard self.progress.isFinished ==  false else{
                timer.invalidate()
                self.myActivityIndicatorView.stopAnimating()
                self.myActivityIndicatorView.isHidden = false
                //self.myActivityIndicatorView.color = .white
                return
            }
            self.myActivityIndicatorView.startAnimating()
            self.progress.completedUnitCount += 1
        }
    }
    
    private let submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.addTarget(self, action: #selector(savePage), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .green
        button.layer.cornerRadius = 16
        return button
    }()
    
    @objc private func savePage(){
        let vc = FinalPage()
        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(myActivityIndicatorView)
        callActivityIndicator()
        view.addSubview(toolBar)
        view.addSubview(myImageView)
        view.addSubview(myLableHead)
        view.addSubview(submitButton)
        
    }

    override func viewDidLayoutSubviews() {
        let toolBarHeight:CGFloat = view.safeAreaInsets.top + 40.0
        toolBar.frame=CGRect(x: 0, y: 0, width: view.frame.size.width, height: toolBarHeight)
        
        myImageView.frame=CGRect(x: 20, y: 200, width: view.frame.size.width - 40, height: 200)
        myActivityIndicatorView.frame = CGRect(x: 170, y: 400, width: 20, height: 20)
        myLableHead.frame=CGRect(x: 15, y: 130, width: view.frame.size.width-40, height: 60)
        submitButton.frame=CGRect(x: 250, y:550, width: 100, height: 40)
    }
}
extension NextPage: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectImage = info[.originalImage] as? UIImage{
            print(selectImage)
            myImageView.image=selectImage
        }
        
        picker.dismiss(animated: true)
        
    }
}
