//
//  ViewController.swift
//  Clming
//
//  Created by Seulki Lee on 2022/07/31.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {

    @IBOutlet weak var mainTableView: UITableView!
    
    let entries = [(title: "클라이밍1", price: "50,000 ~", time: "주중 9:00~18:00"),
                   (title: "클라이밍2", price: "50,000 ~", time: "주중 9:00~18:00"),
                   (title: "클라이밍3", price: "50,000 ~", time: "주중 9:00~18:00")]
    var searchResults : [(title: String, price:String, time:String)] = []
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        mainTableView.delegate = self
        mainTableView.dataSource = self
        navigationSetting()
    }
    
    
    //네비게이션세팅부분 Title부분
    @objc func navigationSetting() {

        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "홈";
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        self.navigationItem.titleView = nil
        
        let search = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchNavigation))
        let setting = UIBarButtonItem(image: UIImage(systemName: "gearshape") , style: .plain, target: self, action: #selector(settingViewController))
        navigationItem.rightBarButtonItems = [setting, search]
     
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        
        searchController.isActive = false
        mainTableView.reloadData()
        
    }
    //search 부분
    @objc func searchNavigation(){
        self.navigationItem.titleView = searchController.searchBar
        navigationItem.rightBarButtonItems = nil
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward") , style: .plain, target: self, action: #selector(navigationSetting))
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        // If the search bar contains text, filter our data with the string
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            // Reload the table view with the search result data.
            mainTableView.reloadData()
        }
    }
    
    func filterContent(for searchText: String) {
            // Update the searchResults array with matches
            // in our entries based on the title value.
            searchResults = entries.filter({ (title: String, price:String, time:String) -> Bool in
                let match = title.range(of: searchText, options: .caseInsensitive)
                // Return the tuple if the range contains a match.
                return match != nil
            })
        }

    
    //세팅부분
    @objc func settingViewController(){
        //tabview로 넣을것
    }
    
    //table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive ? searchResults.count : entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entry = searchController.isActive ? searchResults[indexPath.row] : entries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainTableViewCell
        
        cell.titleLbl.text = entry.title
        cell.priceLbl.text = entry.price
        cell.titmeLbl.text = entry.time
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        guard let nextVC = self.navigationController?.viewControllers(identifier: "ShowIMGViewController") else {return}
//        self.present(nextVC, animated: true)
//        
        let secondVC = ShowIMGViewController()
        secondVC.showTitle = entries[indexPath.row].title
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    

}


