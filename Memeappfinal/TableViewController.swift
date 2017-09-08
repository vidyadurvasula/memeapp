//
//  TableViewController.swift
//  Memeappfinal
//
//  Created by Vidya Durvasula on 9/4/17.
//  Copyright © 2017 Vidya Durvasula. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var memes = [Meme]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableidentity")!
        
        let memedata = memes[(indexPath as NSIndexPath).row]
        cell.textLabel!.text = "\(memedata.topText) - \(memedata.bottomText)"
        
        cell.imageView?.image = memedata.memedImage
        return cell
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        self.tableView.reloadData()
    }
    
    
}
