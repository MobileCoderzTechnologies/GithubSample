//
//  GSUserDetailVC.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 17/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit

class GSUserDetailVC: UIViewController {

    var loginName:String! = "RajanMaheshwari"
    var user:User?
    
    @IBOutlet weak var userDetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.fetchUserDetails(loginName: loginName)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setup() {
        //To remove the top white line which came in iOS 11
//        if #available(iOS 11.0, *) {
//            userDetailTableView.contentInsetAdjustmentBehavior = .never
//        }
        self.title = self.loginName
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        navigationBar?.shadowImage = UIImage()
        
        self.userDetailTableView.register(UINib(nibName: "GSProfileHeaderTableCell", bundle: nil), forCellReuseIdentifier: "GSProfileHeaderTableCell")
        self.userDetailTableView.register(UINib(nibName: "GSProfileOverviewTableCell", bundle: nil), forCellReuseIdentifier: "GSProfileOverviewTableCell")
        self.userDetailTableView.register(UINib(nibName: "GSBioTableCell", bundle: nil), forCellReuseIdentifier: "GSBioTableCell")
        

    }
    
    func fetchUserDetails(loginName:String) {
        User.fetchUserDetails(loginName: loginName) { (user:User?, error:NSError?) in
            if error != nil {
                self.showToast(message: error!.localizedDescription)
                return
            }
            if let user = user {
                self.user = user
                DispatchQueue.main.async {
                    self.userDetailTableView.reloadData()
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
