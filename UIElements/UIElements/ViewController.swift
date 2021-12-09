//
//  ViewController.swift
//  UIElements
//
//  Created by DCS on 07/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let myLableHead:UILabel={
        let label=UILabel()
        label.text="Registration"
        label.textAlignment = .center
        label.font = UIFont(name:"ArialRoundedMTBold", size: 22)
        label.textColor = .black
        return label
    }()
    private let myName:UILabel={
        let label=UILabel()
        label.text="Name"
        label.textAlignment = .left
        label.font = UIFont(name:"ArialRoundedMTBold", size: 18)
        label.textColor = .black
        return label
    }()
    
    private let myTextName:UITextField={
        let textField=UITextField()
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        //textField.backgroundColor = .lightGray
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private let myAddress:UILabel={
        let label=UILabel()
        label.text="Address"
        label.textAlignment = .left
        label.font = UIFont(name:"ArialRoundedMTBold", size: 18)
        label.textColor = .black
        return label
    }()
    
    private let myTextVAdd:UITextView={
        let textView=UITextView()
        textView.textAlignment = .left
        textView.layer.cornerRadius = 5.0
        textView.layer.borderColor = UIColor.lightGray.cgColor
        
        textView.layer.borderWidth = 0.5
        return textView
    }()
    
    private let myLabelDOB:UILabel={
        let label=UILabel()
        label.text="Birthdate"
        label.textAlignment = .left
        label.font = UIFont(name:"ArialRoundedMTBold", size: 18)
        label.textColor = .black
        return label
    }()
    
    private let mydob:UIDatePicker={
        let datePicker=UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.timeZone = TimeZone(secondsFromGMT: 0)

        return datePicker
    }()
    
    private let myCity:UILabel={
        let label=UILabel()
        label.text="City"
        label.textAlignment = .left
        label.font = UIFont(name:"ArialRoundedMTBold", size: 18)
        label.textColor = .black
        return label
    }()
    
    private let pickerView = UIPickerView()
    private let pickerCity=["Surat","Valsad","Vapi","Baroda","Mumbai","Nasik"]
    
    
    private let myGender:UILabel={
        let label=UILabel()
        label.text="Gender"
        label.textAlignment = .left
        label.font = UIFont(name:"ArialRoundedMTBold", size: 18)
        label.textColor = .black
        return label
    }()

    private let mySwtich:UISwitch={
        let switcher=UISwitch()
        switcher.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
        return switcher
    }()
    
    private let myGMaleFemale:UILabel={
        let label=UILabel()
        label.textAlignment = .left
        label.font = UIFont(name:"ArialRoundedMTBold", size: 18)
        label.textColor = .black
        return label
    }()
    
    @objc func handleSwitch(){
        if(mySwtich.isOn){
            myGMaleFemale.text="Male";
        }else{
            myGMaleFemale.text="Female";
        }
    }
    
    private let mySalary:UILabel={
        let label=UILabel()
        label.text="Expected Salary"
        label.textAlignment = .left
        label.font = UIFont(name:"ArialRoundedMTBold", size: 18)
        label.textColor = .black
        return label
    }()
    
    private let mySlider:UISlider = {
        let slider = UISlider()
        slider.minimumValue=20000
        slider.maximumValue=80000
        slider.addTarget(self, action: #selector(handleSlider), for:.valueChanged)
        return slider
    }()
    @objc func handleSlider(){
        mySliderSalary.text="\(mySlider.value)"
    }
    private let mySliderSalary:UILabel={
        let label=UILabel()
        label.textAlignment = .left
        label.font = UIFont(name:"ArialRoundedMTBold", size: 18)
        label.textColor = .black
        return label
    }()
    
    private let myYearEx:UILabel={
        let label=UILabel()
        label.text="Year of Experiance"
        label.textAlignment = .left
        label.font = UIFont(name:"ArialRoundedMTBold", size: 18)
        label.textColor = .black
        return label
    }()
    
    private let myStepper:UIStepper={
        let stepper=UIStepper()
        stepper.minimumValue=0
        stepper.maximumValue=10
        stepper.addTarget(self, action: #selector(handleStepper), for:.valueChanged )
        return stepper
    }()
    
    @objc func handleStepper(){
        myLabelEx.text="\(Int(myStepper.value))"
    }
    private let myLabelEx:UILabel={
        let label=UILabel()
        label.textAlignment = .left
        label.font = UIFont(name:"ArialRoundedMTBold", size: 18)
        label.textColor = .black
        return label
    }()
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .green
        button.layer.cornerRadius = 16
        return button
    }()
    private let myProgressView:UIProgressView={
        let progressView=UIProgressView()
        progressView.trackTintColor    = .gray
        progressView.progressTintColor = .blue
        progressView.setProgress(0.0, animated: true)
        return progressView
    }()
    
    @objc private func nextPage(){
        UIView.animate(withDuration: 10.0, animations: {
            self.myProgressView.setProgress(1.0, animated: true)
        }){(done) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 10.0, execute: {
                let alert = UIAlertController(title: "Successful", message: "User Registered", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default){
                    (action:UIAlertAction!) in
                    let vc = NextPage()
                    self.navigationController?.pushViewController(vc, animated: true)
                    self.present(vc, animated: true, completion: nil)
                })
                
                self.present(alert, animated: true, completion: nil)
                
            })
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myLableHead)
        view.addSubview(myName)
        view.addSubview(myTextName)
        view.addSubview(myAddress)
        view.addSubview(myTextVAdd)
        view.addSubview(myLabelDOB)
        view.addSubview(mydob)
        view.addSubview(myCity)
        view.addSubview(pickerView)
        pickerView.dataSource=self
        pickerView.delegate=self
        view.addSubview(myGender)
        view.addSubview(mySwtich)
        view.addSubview(myGMaleFemale)
        view.addSubview(mySalary)
        view.addSubview(mySlider)
        view.addSubview(mySliderSalary)
        view.addSubview(myYearEx)
        view.addSubview(myStepper)
        view.addSubview(myLabelEx)
        view.addSubview(nextButton)
        view.addSubview(myProgressView)
        //view.addSubview(myProgressView)
        
    }

    override func viewDidLayoutSubviews() {
        
        myLableHead.frame=CGRect(x: 15, y: 20, width: view.frame.size.width-40, height: 60)
        
        myName.frame = CGRect(x: 10, y: myLableHead.bottom+15, width: 150, height: 30)
        myTextName.frame = CGRect(x: myName.right, y: myLableHead.bottom+15, width: 180, height: 30)
        
        
        myLabelDOB.frame = CGRect(x: 10, y: myName.bottom+30, width: 90, height: 30)
        mydob.frame = CGRect(x: myLabelDOB.right+20, y: myTextName.bottom+10, width: 250, height: 60)
        
        myAddress.frame = CGRect(x: 10, y: myLabelDOB.bottom+20, width: 150, height: 30)
        myTextVAdd.frame = CGRect(x: myAddress.right, y: mydob.bottom+10, width: 180, height: 30)
        
        myCity.frame = CGRect(x: 10, y: myAddress.bottom+30, width: 150, height: 30)
        pickerView.frame = CGRect(x: myCity.right, y: myTextVAdd.bottom+10, width: 180, height: 60)
        
        myGender.frame = CGRect(x: 10, y: myCity.bottom+30, width: 150, height: 30)
        mySwtich.frame = CGRect(x: myGender.right, y: pickerView.bottom+10, width: 180, height: 60)
        myGMaleFemale.frame = CGRect(x: mySwtich.right+10, y: pickerView.bottom, width: 180, height: 60)
        
        mySalary.frame = CGRect(x: 10, y: myGender.bottom+30, width: 150, height: 30)
        mySlider.frame = CGRect(x: mySalary.right, y: mySwtich.bottom+20, width: 180, height: 60)
        mySliderSalary.frame = CGRect(x: mySlider.right-80, y: mySlider.bottom-40, width: 180, height: 60)
        
        myYearEx.frame = CGRect(x: 10, y: mySalary.bottom+30, width: 150, height: 30)
        myStepper.frame = CGRect(x: myYearEx.right, y: mySlider.bottom+20, width: 180, height: 60)
        myLabelEx.frame = CGRect(x: myStepper.right+10, y: myStepper.bottom-40, width: 180, height: 60)
        
        nextButton.frame=CGRect(x: 250, y: myYearEx.bottom+50, width: 100, height: 40)
        
        myProgressView.frame=CGRect(x: view.safeAreaInsets.left, y: nextButton.bottom+20, width: view.frame.size.width, height: 40)
    }

}

extension ViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerCity[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerCity.count
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view as? UILabel { label = v }
        label.font = UIFont (name: "ArialRoundedMTBold", size: 15)
        label.text =  pickerCity[row]
        label.textAlignment = .center
        return label
    }
}
