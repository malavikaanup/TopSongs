//
//  PlayerViewController.swift
//  TopSongs
//
//  Created by Malavika Akhilesh on 29/03/24.
//

import UIKit

class PlayerViewController: UIViewController {
    
    weak var viewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "brown")
        print("Player VC loaded...")
    }
}
