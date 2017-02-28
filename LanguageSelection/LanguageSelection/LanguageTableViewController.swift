//
//  LanguageTableViewController.swift
//  LanguageSelection
//
//  Created by NDM on 2/27/17.
//  Copyright © 2017 Rome Rock. All rights reserved.
//

import UIKit

class LanguageTableViewController: UITableViewController {

    
    var languages = [Language]()
    
    var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        titleLabel = UILabel()
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.white
        titleLabel.text = "SELECT_LANG".localized()
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
        
        setLanguage()
        
        NotificationCenter.default.addObserver(self, selector: #selector(LanguageTableViewController.setLanguage), name: .updateLanguage, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setLanguage() {
        titleLabel.text = "SELECT_LANG".localized()
        titleLabel.sizeToFit()
    }

    @IBAction func backPressed(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return languages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:LanguageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LanguageTableViewCell
        
        // Configure the cell...
        
        cell.languageLabel.text = languages[indexPath.row].languageName
        if languages[indexPath.row].languageCode == UserDefaults.standard.string(forKey: "currentLanguage")! {
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(languages[indexPath.row].languageCode, forKey: "currentLanguage")
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: .updateLanguage, object: nil)
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
