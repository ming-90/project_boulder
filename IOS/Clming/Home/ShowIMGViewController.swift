//
//  ShowIMGViewController.swift
//  Clming
//
//  Created by Seulki Lee on 2022/08/06.
//

import UIKit


class ShowIMGViewController: UIViewController {

    let picker = UIImagePickerController()
    @IBOutlet weak var showIMG: UIImageView!
    var showTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
        navigationSetting()
        imgSetting()
    }
    
    
    //네비게이션세팅부분 Title부분
    @objc func navigationSetting() {

        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "";
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        self.navigationItem.titleView = nil
        
        let share = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(addNavigation))
        let add1 = UIBarButtonItem.init(customView: label)
        navigationItem.leftBarButtonItems = [share, add1]
        
        
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNavigation))
        let setting = UIBarButtonItem(image: UIImage(systemName: "text.chevron.right") , style: .plain, target: self, action: #selector(settingViewController))
        navigationItem.rightBarButtonItems = [setting, add]
     
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    @objc func searchNavigation(){

    }

    @objc func settingViewController(){
 
    }
    
    func imgSetting() {
//        showIMG.image = UIImage(named: "IMG_8322")
    }

    @objc func addNavigation() {
        
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

extension ShowIMGViewController : UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
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

            let secondVC = SelectViewController()
//            secondVC.aaa = image //이미지가 안넘어감
            dismiss(animated: true, completion: nil)
            self.navigationController?.pushViewController(secondVC, animated: true)

        }
    }
}
