//
//  ViewController.swift
//  TopApps
//
//  Created by praveen velanati on 6/22/19.
//  Copyright © 2019 praveen velanati. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var appNetwork: AppListNetwork!
    var feed: Feed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "AppTableViewCell", bundle: nil), forCellReuseIdentifier: "AppCell")
        tableView.delegate = self
        tableView.dataSource = self
        appNetwork = AppListNetwork()
        appNetwork.getAlltheTopApps { [weak self] (feed, error) in
            self?.feed = feed
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppCell", for: indexPath) as! AppTableViewCell
        let app = feed?.results[indexPath.row]
        cell.devLabel.text = app?.artistName ?? ""
        cell.nameLabel.text = app?.name ?? ""
        let url = URL(string: app?.artworkUrl100 ?? "")
        cell.appIconImageView.kf.setImage(with: url!)
        return cell
    }
    
    
}
