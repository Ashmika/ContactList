//
//  DetailVC.swift
//  ContactListDemo
//
//  Created by Ashmika Gujarathi on 21/01/18.
//  Copyright © 2018 Ashmika. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet var lblCompany: UILabel!
    @IBOutlet var lblAddress: UILabel!
    @IBOutlet var lblPhoneNo: UILabel!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var lblName: UILabel!
    
    var arrayData = Array<Customer>()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.title = "User Info"
        
        print(arrayData)
        
        for user in arrayData
        {
            lblName.text = user.name
            lblEmail.text = user.email
            lblPhoneNo.text = user.phone
            lblAddress.text = String((user.address?.city)!)! + String((user.address?.street)!)! + String((user.address?.suite)!)! + String((user.address?.zipcode)!)!
            
            lblCompany.text = user.company?.name
            
        }
        
       
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
