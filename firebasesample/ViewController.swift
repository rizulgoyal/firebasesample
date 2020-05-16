//
//  ViewController.swift
//  firebasesample
//
//  Created by Rizul goyal on 2020-05-14.
//  Copyright © 2020 Rizul goyal. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var ref: DatabaseReference! = Database.database().reference();

    @IBOutlet var textName: UITextField!
    
    @IBOutlet var textID: UITextField!
    
    @IBOutlet var textAge: UITextField!
    
    @IBAction func buttonAdd(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Employee Form", message: "Are you sure", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { action in
            
            let user = User(uid: self.textID.text!, name: self.textName.text!, age: self.textAge.text!);
               self.ref.child("users").child(user.uid).setValue(["username":user.name, "age":user.age, "uid":user.uid]);
            self.textName.text = "";
            self.textAge.text = "";
            self.textID.text = "";
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.ref.child("users").child(user.uid).setValue(["age":user.age]);
//        self.ref.child("users").child(user.uid).setValue(["uid":user.uid]);



        
        
        // Do any additional setup after loading the view.
    }


}

