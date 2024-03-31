//
//  SongsCollectionViewCell.swift
//  TopSongs
//
//  Created by Malavika Akhilesh on 29/03/24.
//

import UIKit

class SongsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var songArtistLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var cellIndicator: UIActivityIndicatorView!
    
    func loadImage(urlString: String?) {
        guard let _urlString = urlString else {
            self.songImageView.image = UIImage(systemName: "profile")
            self.cellIndicator.stopAnimating()
            return
        }
        TSImageLoader.shared.downloadImage(_urlString) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.songImageView.image = UIImage(data: data)
                    self?.cellIndicator.stopAnimating()
                }
            case .failure(_):
                self?.cellIndicator.stopAnimating()
                break
            }
        }
    }
}
