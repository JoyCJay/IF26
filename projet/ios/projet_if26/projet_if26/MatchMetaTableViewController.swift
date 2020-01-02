//
//  MatchMetaTableViewController.swift
//  projet_if26
//
//  Created by if26-grp1 on 17/12/2019.
//  Copyright © 2019 if26. All rights reserved.
//

import UIKit
import CoreData

class MatchMetaTableViewController: UITableViewController {

    var summonerName = ""
    var MatchMetas: [NSManagedObject] = []
    
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.summonerName = followers[myIndex].value(forKey: "summonerName") as! String
        
        print("summonerName: ",self.summonerName)
        
        MatchMetas = createArray()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func createArray() -> [NSManagedObject] {
        
        var tempMatchMetas: [NSManagedObject] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //
        let predicate = NSPredicate(format: "summonerName == %@", self.summonerName)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MatchMeta")
        fetchRequest.predicate = predicate
        
        do {
            tempMatchMetas = try context.fetch(fetchRequest) as! [NSManagedObject]
            print(tempMatchMetas.count)
        } catch {
            
        }
        
        return tempMatchMetas
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let object = MatchMetas[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "matchMetaCell") as! MatchMetaCell
        
        // Configure the cell...
        
        let matchId = object.value(forKey: "matchId")
        let summonerName = object.value(forKey: "summonerName")
        let champion = object.value(forKey: "champion")
        let matchDate = object.value(forKey: "matchDate")
        let duration = object.value(forKey: "duration")
        let result = object.value(forKey: "result")
        
        let matchMeta = Matchmeta(matchId: matchId as! String, name: summonerName as! String, date: matchDate as! String, champion: champion as! String, result: result as! String, duration: duration as! String)
        
        cell.setMatchMeta(matchMeta: matchMeta)
        
        return cell
    }
    
    @IBAction func backOnAction(_ sender: UIButton) {
        performSegue(withIdentifier: "segueBack", sender: self)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
