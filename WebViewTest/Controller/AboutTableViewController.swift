//
//  AboutTableViewController.swift
//  WebViewTest
//
//  Created by jia on 2019/11/18.
//  Copyright © 2019 jia. All rights reserved.
//

import UIKit
import SafariServices

class AboutTableViewController: UITableViewController {
    
    var sectionTitle = ["Feedback","Follow Us"]
    var sectionContent = [[(image:"store",text:"Rate us on App Store",link:"https://www.apple.com/itunes/charts/paid-apps/"),
                           (image:"chat",text:"Tell us your feedback",link:"http://www.appcoda.com/contact")],
                          [(image:"twitter",text:"Twitter",link:"https://twitter.com/appcodamobile"),(image:"facebook",text:"Facebook",link:"https://facebook.com/appcodamobile"),(image:"instagram",text:"Instagram",link:"https://www.instagram.com/appcodadotcom")]]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // the width shows too long in ipad
        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "Rubik-Medium", size: 40.0){
            navigationController?.navigationBar.largeTitleTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor(red: 231, green: 76, blue: 60, alpha: 1), NSAttributedString.Key.font:customFont ]
        }
        
        // remove the extra space of the tableview
        tableView.tableFooterView = UIView()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionTitle.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionContent[section].count
    }
    
    // set the section's title
    override func tableView(_ tableView:UITableView,titleForHeaderInSection section:Int) -> String?{
        return sectionTitle[section]
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AboutCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        // Configure the cell...
        let cellData = sectionContent[indexPath.section][indexPath.row]
        cell.textLabel?.text = cellData.text
        cell.imageView?.image = UIImage(named: cellData.image)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let link = sectionContent[indexPath.section][indexPath.row].link
        
        switch indexPath.section {
        // Leave us feedback section
        case 0:
            if indexPath.row == 0 {
                if let url = URL(string: link) {
                    UIApplication.shared.open(url)
                }
            } else if indexPath.row == 1{
                performSegue(withIdentifier: "showWebView", sender: self)
            }
        case 1:
            if let url = URL(string: link) {
                let safariController = SFSafariViewController(url: url)
                present(safariController,animated: true,completion: nil)
            }
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: false)

    }
    
    // find out the link，pass it to the web view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWebView" {
            if let destinationController = segue.destination as? WebViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                destinationController.targetURL = sectionContent[indexPath.section][indexPath.row].link
            }
        }
    }

}
