//
//  CollectionViewController.swift
//  Memeappfinal
//
//  Created by Vidya Durvasula on 9/4/17.
//  Copyright © 2017 Vidya Durvasula. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var memes = [Meme]()
    
    @IBOutlet weak var add: UIBarButtonItem!
    
    @IBAction func addaction(_ sender: Any) {
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let memeDetailVC = storyboard.instantiateViewController(withIdentifier: "memeidntifier") as! MemeeViewController
        self.navigationController!.pushViewController(memeDetailVC, animated: true)
    }
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
   
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cellcollect = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionidentity", for: indexPath) as! DisplayViewCell
        let memedata = self.memes[(indexPath as NSIndexPath).row]
        
      //  cellcollect.topTextlabel.text = "\(memedata.topText)"
        cellcollect.backgroundColor = UIColor.white
        cellcollect.image.image = memedata.memedImage
        cellcollect.image.contentMode = .scaleAspectFit
        //cellcollect.bottomLabel.text = "\(memedata.bottomText)"
        return cellcollect
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let meme = appDelegate.memes[indexPath.row]
        
        // Get the Storyboard and View Controller
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let memeDetailVC = storyboard.instantiateViewController(withIdentifier: "memedetail") as! MemedeyailviewController
        
        // Valuate the top, bottom, and image vars
        
        memeDetailVC.valueTextFieldTop = meme.topText
        memeDetailVC.valueTextFieldBottom = meme.bottomText
        memeDetailVC.valueImageMain = meme.origImage
        
        //self.present(memeDetailVC, animated: true, completion: nil)
        self.navigationController!.pushViewController(memeDetailVC, animated: true)

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
                memes = appDelegate.memes
        self.collectionView.reloadData()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    
    
}
