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
    var type = [Type]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate=self
        collectionView.dataSource=self
        type.append(Type(name: "hotel", image: UIImage(named: "hotel")!, rate: 1.0))
        type.append(Type(name: "hotel", image: UIImage(named: "hotel")!, rate: 3.0))
        type.append(Type(name: "hotel", image: UIImage(named: "hotel")!, rate: 3.0))
        type.append(Type(name: "hotel", image: UIImage(named: "hotel")!, rate: 3.0))
        type.append(Type(name: "hotel", image: UIImage(named: "hotel")!, rate: 3.0))
        type.append(Type(name: "hotel", image: UIImage(named: "hotel")!, rate: 3.0))
        type.append(Type(name: "hotel", image: UIImage(named: "hotel")!, rate: 3.0))
        type.append(Type(name: "hotel", image: UIImage(named: "hotel")!, rate: 3.0))
        
    }
    

    
}

extension TypeViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return type.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCell", for: indexPath) as! TypeCollectionViewCell
        
        cell.type=type[indexPath.row]
        
        return cell
    }
    
    
}

extension TypeViewController:UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 5, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width:170, height: 170)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }



}
