//
//  ContactVC.swift
//  ContactListDemo
//
//  Created by Ashmika Gujarathi on 21/01/18.
//  Copyright © 2018 Ashmika. All rights reserved.
//

import UIKit
import SwiftSpinner



class ContactVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tblView: UITableView!
    
    let userNameArray = NSMutableArray()
    var DataArray = Array<Customer>()
    
    
    var SectionTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "Contact List"
        
        SwiftSpinner.show(duration: 1.0, title: "Loading Contact Details")
        
        
        ContactManager.sharedInstance.getCostumers(completion: { (response) in
            
            print(response)
            self.DataArray = response
                      for user in response
            {
                print(user)
                print(user.name)
                self.userNameArray .add(user.name ?? nil)
       
            }
            
            SwiftSpinner.hide()
         
            self.tblView.reloadData()
            
        }) { ( failure) in
            print(failure)
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return userNameArray.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = userNameArray.object(at: indexPath.row) as! String
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let DetailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        
        DetailVC.arrayData = [self.DataArray[indexPath.row]]
        self.navigationController?.pushViewController(DetailVC, animated: true)

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
