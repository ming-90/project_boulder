//
//  SelectViewController.swift
//  Clming
//
//  Created by Seulki Lee on 2022/08/07.
//

import UIKit

class SelectViewController: UIViewController {
    
    @IBOutlet weak var selectIMG: UIImageView!
    var aaa : UIImage? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true

        navigationSetting()
    }
    
    @objc func navigationSetting() {

        self.navigationItem.title = "선택"
        
        let setting = UIBarButtonItem(image: UIImage(systemName: "checkmark") , style: .plain, target: self, action:#selector(seveClick))
        navigationItem.rightBarButtonItems = [setting]
     
        self.navigationController?.navigationBar.tintColor = UIColor.white

    }
    
    @objc func seveClick() {
        let alert = UIAlertController(title: "저장", message: "저장되었습니다.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }



}
