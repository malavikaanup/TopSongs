//
//  HomeViewController.swift
//  TopSongs
//
//  Created by Malavika Akhilesh on 29/03/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var songListCollectionView: UICollectionView!
    @IBOutlet weak var songLimitButton: UIButton!
    
    private let viewModel = HomeViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        songListCollectionView.delegate = self
        songListCollectionView.dataSource = self
        
        self.view.addSubview(spinner)
        NSLayoutConstraint.activate([
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)])
        
        initViewModel()
        loadLimitButton()
    }
    
    func initViewModel() {
        Task {
            spinner.startAnimating()
            viewModel.songDelegate = self
            await viewModel.getSongsList(limit: 10)
        }
    }
    
    func loadLimitButton() {
        let optionOnClick = {(action: UIAction) in
            print(action.title)
            Task {
                self.spinner.startAnimating()
                await self.viewModel.getSongsList(limit: Int(action.title) ?? 10)
            }
        }
        
        self.songLimitButton.menu = UIMenu(children:[
            UIAction(title: "10", state: .on, handler: optionOnClick),
            UIAction(title: "25", handler:optionOnClick),
            UIAction(title: "50", handler: optionOnClick)
        ])
    }

}

extension HomeViewController: SongServices {
    @MainActor func reloadData() {
        print("Songs List Count ")
        print(viewModel.songsList.count)
        Task {
            self.spinner.stopAnimating()
            self.songListCollectionView.reloadData()
        }
    }
    
    @MainActor func showErrorAlert(error: ErrorCases?) {
        Task {
            self.spinner.stopAnimating()
            let alert = UIAlertController(title: "Error", message: error?.errorDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
        }
    }
    
    func recallSongsList(limit: Int) {
        Task {
            self.spinner.stopAnimating()
            await viewModel.getSongsList(limit: limit)
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.songsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.collectionViewCellID, for: indexPath) as? SongsCollectionViewCell
        cell?.loadImage(urlString: self.viewModel.songsList[indexPath.item].artworkUrl100)
        cell?.songNameLabel.text = self.viewModel.songsList[indexPath.item].name
        cell?.songArtistLabel.text = self.viewModel.songsList[indexPath.item].artistName
        cell?.releaseDateLabel.text = "Release Date: \(self.viewModel.songsList[indexPath.item].releaseDate ?? "")"
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 140.0)
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let playerVC = PlayerViewController()
        self.viewModel.selectedIndex = indexPath.item
        playerVC.viewModel = self.viewModel
        DispatchQueue.main.async {
            self.present(playerVC, animated: true)
        }
    }
}

