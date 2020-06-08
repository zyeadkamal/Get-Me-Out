//
//  CategoryViewController.swift
//  Get Me Out
//
//  Created by Salah  on 30/03/2020.
//  Copyright © 2020 Salah . All rights reserved.
//

import UIKit

class TypeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var catPlaces = [Datum1]()
    var page: Int = 1
    var lastPage : Int = 0
    var titleName : String? {
        didSet{
            title = self.titleName
        }
    }
    var catID : String? {
        didSet {
            fetchData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate=self
        collectionView.dataSource=self
        
        guard let navBar = navigationController?.navigationBar else{
            fatalError("Navigation controller does not exist.")
        }
        
        navBar.tintColor = UIColor.white
        
        
    }
    
    // MARK: - Navigate among pages
    @IBAction func next(_ sender: UIBarButtonItem) {
        
        
        switch sender.title {
        case "Next >":
            page = page + 1
        case "< Prev":
            page = page - 1
        default:
            fetchData()
        }
        
        if page > 0 {
            if page <= lastPage {
                let stringPage = String(page)
                print(stringPage)
                fetchData(numOfPage: stringPage)
            }else{
                fetchData()
                page = 1
            }
            
        }else{
            page = lastPage
            let stringPage = String(page)
            print(stringPage)
            fetchData(numOfPage: stringPage)
        }
    }
    
    
    // MARK: - Fetching data
    func fetchData(numOfPage : String = "1"){
        DispatchQueue.main.async {
            Service.shared.fetchTypeData(catID: self.catID!,numOfPage: numOfPage) { (info) in
                if info.statusCode == 200{
                    self.catPlaces = info.places.data
                    self.lastPage = info.places.lastPage
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
}

extension TypeViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catPlaces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCell", for: indexPath) as! TypeCollectionViewCell
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        
        cell.categoryImage.layer.cornerRadius = 5
        cell.categoryImage.layer.masksToBounds = true
        
        if let url = URL(string: catPlaces[indexPath.item].imageurl){
            do{
                let data = try Data(contentsOf: url)
                cell.categoryImage.image = UIImage(data: data)
            }
            catch{
                print("error getting images")
            }
        }
        
        cell.name.text = catPlaces[indexPath.item].name
        cell.rate.rating = catPlaces[indexPath.item].rateAvg
        cell.numOfRater.text = "\(catPlaces[indexPath.item].numOfRater) نقييم"
        
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          
          performSegue(withIdentifier: "goToDescription", sender: self)
          
      }
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          let destinationVC = segue.destination as! DescriptionViewController
          if let indexpath = collectionView.indexPathsForSelectedItems{
             
            destinationVC.placeName = catPlaces[indexpath[0].row].name
            destinationVC.descriptionText = catPlaces[indexpath[0].row].shortDesc
            destinationVC.ratAvrg = catPlaces[indexpath[0].row].rateAvg
            destinationVC.numOfRates = String(catPlaces[indexpath[0].row].numOfRater)
            destinationVC.imageURL = catPlaces[indexpath[0].row].imageurl


              
              
          }
          
      }
    
    
}

extension TypeViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bound = collectionView.bounds
        let height = self.view.frame.height
        let width = self.view.frame.width
        let cellSize = (height < width) ? bound.height/2 : bound.width/2
        return CGSize(width: cellSize - 10 , height: cellSize - 10)    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
    
}
