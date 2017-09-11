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
    
    
    @IBAction func add(_ sender: Any) {
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let memeDetailVC = storyboard.instantiateViewController(withIdentifier: "memeidntifier") as! MemeeViewController
        self.navigationController!.pushViewController(memeDetailVC, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    
    @IBOutlet weak var tableView: UITableView!
     let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableidentity")!
        
        let memedata = memes[(indexPath as NSIndexPath).row]
        cell.textLabel!.text = "\(memedata.topText) - \(memedata.bottomText)"
        
        cell.imageView?.image = memedata.memedImage
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            memes.remove(at: indexPath.row)
           tableView.deleteRows(at: [indexPath], with: .none)
          appDelegate.memes.remove(at: indexPath.row)
           
        }
        
         self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Get the selected meme
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                

        
        
    }
    override func viewDidAppear(_ animated: Bool) {
                memes = appDelegate.memes
        

        self.tableView.reloadData()
            }
    
    
}
