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
    let cellScale:CGFloat=0.7
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
//        let screenSize=UIScreen.main.bounds.size
//        let cellWidth=floor(screenSize.width * cellScale)
//        let cellHight=floor(screenSize.height * cellScale)
//        let insetX=(view.bounds.width - cellWidth) / 0.2
//        let insetY=(view.bounds.height - cellHight) / 0.2
//        let layout=collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: cellWidth, height: cellHight)
//        collectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)

           
    }
    

    
}

extension HomeViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.category=categories[indexPath.row]
        
        return cell
    }
    

   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size=collectionView.frame.size
        return CGSize(width: size.width*cellScale, height: size.height*cellScale)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    }
    

    

}
extension HomeViewController:UIScrollViewDelegate,UICollectionViewDelegate{
        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//            let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
//               let cellWithIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
//               var offset = targetContentOffset.pointee
//               let index = (offset.x + scrollView.contentInset.left) / cellWithIncludingSpacing
//               let roundedIndex = round(index)
//               offset = CGPoint(x: roundedIndex * cellWithIncludingSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
//               targetContentOffset.pointee = offset
        
           }
}
