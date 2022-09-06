//
//  MyPageViewController.swift
//  Clming
//
//  Created by Seulki Lee on 2022/08/06.
//

import UIKit

class MyPageViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    let picker = UIImagePickerController()
    @IBOutlet weak var myIMG: UIImageView!
    @IBOutlet weak var lavelView: UIView!
    
    @IBOutlet weak var noIMGLable: UILabel!
    @IBOutlet weak var showPicker: UITextField!
    let fruits = ["사과", "배", "포도", "망고", "딸기", "바나나", "파인애플"]
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationSetting()
        picker.delegate = self
       //myIMG.image = UIImage(named: "IMG_8322")
        if ((myIMG.image) != nil) {
            noIMGLable.text = ""
        }
        
        //피컵
        showPicker.tintColor = .clear
        createPickerView()
        dismissPickerView()
    }
    

    @objc func navigationSetting() {

        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "내 정보";
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        self.navigationItem.titleView = nil
        
        let setting = UIBarButtonItem(image: UIImage(systemName: "checkmark") , style: .plain, target: self, action:#selector(seveClick))
        navigationItem.rightBarButtonItems = [setting]
     
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        myIMG.layer.cornerRadius = myIMG.frame.width/2
        myIMG.clipsToBounds = true
        
        //view round
        lavelView.layer.cornerRadius = 10.0
        lavelView.layer.borderWidth = 0.5
        lavelView.clipsToBounds = true
        
        showPicker.layer.cornerRadius = 10.0
        showPicker.layer.borderWidth = 0.5
        showPicker.clipsToBounds = true

    }

    @objc func seveClick() {
//        let alert = UIAlertController(title: "저장", message: "저장되었습니다.", preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
        
        
        APIConstans.connectTest()
    }
    
//    //스와이프별
//    @IBAction func starPointChanged(_ sender: UISlider) {
//
//        let roundValue = round(sender.value)
//
//        for index in 0 ... 7 {
//
//            if let starImage = view.viewWithTag(index) as? UIImageView {
//
//                if index <= Int(roundValue) {
//                    starImage.image = UIImage(named: "Star")
//                }else{
//                    starImage.image = UIImage(named: "BlankStar")
//                }
//            }
//
//        }
//
//        //별점
//        print(String(roundValue))
//    }
    
    //피커뷰
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }


      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          return fruits.count
      }


      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return fruits[row]
      }


      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          showPicker.text = fruits[row]
      }


      func createPickerView() {
          let pickerView = UIPickerView()
          pickerView.delegate = self
          showPicker.inputView = pickerView
      }

      func dismissPickerView() {
          let toolBar = UIToolbar()
          toolBar.sizeToFit()
          let button = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(selectPickerView))
          toolBar.setItems([button], animated: true)
          toolBar.isUserInteractionEnabled = true
          showPicker.inputAccessoryView = toolBar
      }
    
    @objc func selectPickerView() {
        self.view.endEditing(true)
    }
    
    @IBAction func myIMGClick(_ sender: Any) {
        let alert = UIAlertController(title: "Select one", message: nil, preferredStyle: .actionSheet)
        let library = UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()}
        let camera = UIAlertAction(title: "카메라", style: .default) { (action) in self.openCamera()}
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}

extension MyPageViewController : UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    func openLibrary() {
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    func openCamera() {
        picker.sourceType = .camera
        present(picker, animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            myIMG.image = image
            dismiss(animated: true, completion: nil)
            noIMGLable.text = ""
            
        }
    }
}
