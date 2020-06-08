//
//  tasnefatViewController.swift
//  Get Me Out
//
//  Created by zeyad on 6/4/20.
//  Copyright © 2020 Salah . All rights reserved.
//

import UIKit

class tasnefatViewController: UIViewController {
    
    let service = Service()
    var categories = [WelcomCategory]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
//        DispatchQueue.main.async {
            Service.shared.fetchGenericData(urlString: "http://v1.khargny.com/api/category") { (info:Welcome) in
                if info.statusCode == 200{
                    self.categories = info.categories
                    self.collectionView.reloadData()
                }
            }
        }
//    }
    
    
    
}

extension tasnefatViewController : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tasnefatCollectionViewCell", for: indexPath) as! tasnefatCollectionViewCell

            if let url = URL(string: self.categories[indexPath.item].imageurl){
            do{
                let data = try Data(contentsOf: url)
                cell.cellImage.image = UIImage(data: data)
            }
            catch{
                print("error getting images")
            }
        }
        
            cell.cellLabel.text = self.categories[indexPath.item].name
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 5, bottom: 1, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bound = collectionView.bounds
        let height = self.view.frame.height
        let width = self.view.frame.width
        let cellSize = (height < width) ? bound.height/2 : bound.width/2
        return CGSize(width: cellSize - 5.5 , height: cellSize - 5.5)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToTypeVC", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TypeViewController
        if let indexpath = collectionView.indexPathsForSelectedItems{
            let stringCatID = String(categories[indexpath[0].row].id)
            destinationVC.catID = stringCatID
            destinationVC.titleName = categories[indexpath[0].row].name
            
            
        }
        
    }
    
}
