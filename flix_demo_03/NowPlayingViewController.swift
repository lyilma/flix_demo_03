//
//  NowPlayingViewController.swift
//  flix_demo_03
//
//  Created by Leaynet Yilma on 10/4/18.
//  Copyright © 2018 Leaynet Yilma. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    let url = URL(string:"https://api.themoviedb.org/3/movie/{movie_id}?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
       let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error  {
                print (error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try!  JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                print(dataDictionary)
            }
        
        }
        task.resume()
    }
    

    

}
