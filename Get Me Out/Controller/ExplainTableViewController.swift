//
//  ExplainTableViewController.swift
//  Get Me Out
//
//  Created by Salah  on 30/05/2020.
//  Copyright © 2020 Salah . All rights reserved.
//

import UIKit

class ExplainTableViewController: UITableViewController {
    
    var categories = [CategoryElement]()
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // animateTable()
        
        tableView.separatorStyle = .none
        DispatchQueue.main.async {
              Service.shared.fetchGenericData(urlString: "http://v1.khargny.com/api/home_categories?lang=ar") { (info:Category) in
                      if info.statusCode == 200{
                          self.categories = info.categories
                          self.tableView.reloadData()
                      }
                  }
        }
      
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let navBar = navigationController?.navigationBar else { fatalError("Navigation controller does not exist.")
        }
        guard let tabBar = tabBarController?.tabBar else { fatalError("TabBar controller does not exist.")
               }
        navBar.firstViewAfterTabBar()
        navigationItem.largeTitleDisplayMode = .automatic
        tabBar.firstViewAfterTabBar()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let navBar = navigationController?.navigationBar else { fatalError("Navigation controller does not exist.")
        }

        navBar.secondaryViewController()
    }
    
    
    
    
    


  // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ExplainTableViewCell
        
            cell.places = self.categories[indexPath.row].places
            
        
            cell.categoryName.text = self.categories[indexPath.row].name
        
        
        return cell
    }

    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
}







//    func animateTable() {
//              tableView.reloadData()
//              let cells = tableView.visibleCells
//
//              let tableViewHeight = tableView.bounds.size.height
//
//              for cell in cells {
//                  cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
//              }
//
//              var delayCounter = 0
//              for cell in cells {
//                  UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
//                      cell.transform = CGAffineTransform.identity
//                  }, completion: nil)
//                  delayCounter += 1
//              }
//          }
