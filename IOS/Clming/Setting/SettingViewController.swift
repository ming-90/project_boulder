//
//  SettingViewController.swift
//  Clming
//
//  Created by Seulki Lee on 2022/08/06.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationSetting()
    }
    
    
    //네비게이션세팅부분 Title부분
    @objc func navigationSetting() {

        self.navigationItem.title = "설정"
        navigationItem.rightBarButtonItems = nil
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }

    func svaeSetting() {
        
    }
}
