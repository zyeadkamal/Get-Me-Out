//
//  ExplainTableViewCell.swift
//  Get Me Out
//
//  Created by Salah  on 30/05/2020.
//  Copyright © 2020 Salah . All rights reserved.
//

import UIKit

class ExplainTableViewCell: UITableViewCell {
    
    
    
    var places:Places?{
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
}

extension ExplainTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places?.data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! ExplainCollectionViewCell
            cell.data = self.places?.data[indexPath.row]
        return cell
    }
    
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width:140, height: 140)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let placeData = self.places?.data[indexPath.row]{
                
    let destinationVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Description") as! DescriptionViewController
            destinationVc.data = placeData
            
            
        }
    
        
        
   

        
    }
    

}
