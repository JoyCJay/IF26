//
//  FollowersTableViewController.swift
//  projet_if26
//
//  Created by if26-grp1 on 13/12/2019.
//  Copyright © 2019 if26. All rights reserved.
//

import UIKit
import CoreData

var followers: [NSManagedObject] = []
var myIndex = 0

class FollowersTableViewController: UITableViewController {

    var refresher: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: #selector(FollowersTableViewController.populate), for: UIControl.Event.valueChanged)
        tableView.addSubview(refresher)
        
        followers = createArray()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func createArray() -> [NSManagedObject] {
        
        var tempFollowers: [NSManagedObject] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Followers")
        
        
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            print("followers: ", result.count)
            
            if result.count > 0 {
                for r in result as! [NSManagedObject] {
                    tempFollowers.append(r)
                }
            }
        } catch  {
            
        }
        
        /*let follower1 = Follower(name: "hao", level: 24, date: Date())
        let follower2 = Follower(name: "ttt", level: 45, date: Date())
        let follower3 = Follower(name: "rrr", level: 27, date: Date())
        
        tempFollowers.append(follower1)
        tempFollowers.append(follower2)
        tempFollowers.append(follower3)*/
        
        return tempFollowers
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return followers.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Followers"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let obj = followers[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "followerCell") as! FollowerCell
        
        // Configure the cell...
        
        let summonerName = obj.value(forKey: "summonerName")
        let level = obj.value(forKey: "level")
        let revisionDate = obj.value(forKey: "revisionDate")
        
        let follower = Follower(name: summonerName as! String, level: level as! Int16, date: revisionDate as! Date)
        
        cell.setFollower(follower: follower)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            context.delete(followers[indexPath.row])
            
            do{
                try context.save()
                followers.remove(at: indexPath.row)
                
                
                
                tableView.deleteRows(at: [indexPath], with: .fade)
            }catch{
                print("failed to delete follower")
            }
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @objc func populate() {
        followers.removeAll()
        followers = createArray()
        
        tableView.reloadData()
        refresher.endRefreshing()
        
    }
    

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
