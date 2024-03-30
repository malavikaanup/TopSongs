//
//  HomeViewController.swift
//  TopSongs
//
//  Created by Malavika Akhilesh on 29/03/24.
//

import UIKit

class HomeViewController: UIViewController {

    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initViewModel()
    }
    
    func initViewModel() {
        Task {
            viewModel.songDelegate = self
            await viewModel.getSongsList()
        }
    }

}

extension HomeViewController: SongServices {
    func reloadData() {
        print("Songs List Count ")
        print(viewModel.songsList.count)
    }
    
    @MainActor func showErrorAlert(error: ErrorCases?) {
        Task {
            let alert = UIAlertController(title: "Error", message: error?.errorDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
        }
        
    }
}

