//
//  CollectionViewController.swift
//  Memeappfinal
//
//  Created by Vidya Durvasula on 9/4/17.
//  Copyright © 2017 Vidya Durvasula. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    var memes = [Meme]()
    
    
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
   
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionidentity", for: indexPath) as! DisplayViewCell
        let memedata = self.memes[(indexPath as NSIndexPath).row]
        
        cell.topTextlabel.text = "\(memedata.topText)"
        cell.backgroundColor = UIColor.black
        cell.image.image = memedata.memedImage
        cell.bottomLabel.text = "\(memedata.bottomText)"
        
        return cell
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        self.collectionView.reloadData()
                
    }
    
    
    
}
