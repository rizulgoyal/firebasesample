//
//  ListEmployeeTableViewController.swift
//  firebasesample
//
//  Created by Rizul goyal on 2020-05-15.
//  Copyright © 2020 Rizul goyal. All rights reserved.
//

import UIKit
import Firebase

class ListEmployeeTableViewController: UITableViewController {
    
    var animals = ["dcvervgr", "edfr3f3rfdc", "edr3f4rvt"]
    public var employees = [User]()
    

    @IBOutlet var listTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self;
        listTableView.dataSource = self;
        let ref = Database.database().reference().child("users");


        
        ref.observe(.childAdded, with: { (snapshot) in
             if let userDict = snapshot.value as? [String:Any] {

                  //Do not cast print it directly may be score is Int not string
                let name = userDict["username"] as? String ?? "";
                let uid = userDict["uid"] as? String ?? ""
                let age = userDict["age"] as? String ?? ""

                let user = User(uid: uid, name: name, age: age);
                self.employees.append(user);
                  print(userDict["username"] ?? [])
                print(self.employees.count)
             }
        }
    )
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return employees.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListTableViewCell

        let curruser = employees[indexPath.row]
        print(employees.count)

        // set the text from the data model
        cell.label1.text = curruser.name;

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
