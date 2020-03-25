//
//  ExploreTableViewCell.swift
//  Get Me Out
//
//  Created by Salah  on 12/03/2020.
//  Copyright © 2020 Salah . All rights reserved.
//

import UIKit

class ExploreTableViewCell: UITableViewCell {
    @IBOutlet weak var shadowCell: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        editBorder()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func editBorder(){
        collectionView.dataSource=self
        collectionView.delegate=self
        shadowCell.layer.cornerRadius = 3
        shadowCell.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha: 1.0).cgColor
        shadowCell.layer.shadowOffset = CGSize(width: 0, height: 1.75)
        shadowCell.layer.shadowRadius = 1.7
        shadowCell.layer.shadowOpacity = 0.45
    }
    
}

extension ExploreTableViewCell:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as!ExploreCollectionViewCell
        cell.editCellView()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160.0, height: 192.0)
    }
    
    
}
