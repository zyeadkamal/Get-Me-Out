//
//  HomeViewController.swift
//  Get Me Out
//
//  Created by Salah  on 24/03/2020.
//  Copyright © 2020 Salah . All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var categories = [
            Category(image: UIImage(named: "Entertainment")!, title: "Entertainment", colour: UIColor(red: 63/255.0, green: 71/255.0, blue: 88/255.0, alpha: 0.8)),
             Category(image: UIImage(named: "hotel")!, title: "Hotels", colour: UIColor(red: 240/255.0, green: 133/255.0, blue: 91/255.0, alpha: 0.8)),
             Category(image: UIImage(named: "malls")!, title: "Malls", colour: UIColor(red: 105/255.0, green: 80/255.0, blue: 227/255.0, alpha: 0.8)),
             Category(image: UIImage(named: "pyramids")!, title: "Tourism Places", colour: UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 0.8)),
             Category(image: UIImage(named: "restaurant-erh-la-salle-principal-c9a3b")!, title: "Restaurent", colour: UIColor(red: 250/255.0, green: 192/255.0, blue: 130/255.0, alpha: 0.8))
        ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate=self
        collectionView.dataSource=self
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: collectionView.frame.size.height-160)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 4.0)
        collectionView.collectionViewLayout = flowLayout
    }
    

    
}

extension HomeViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.category=categories[indexPath.row]
        
        return cell
    }
    

    

}


