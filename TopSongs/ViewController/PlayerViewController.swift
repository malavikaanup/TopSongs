//
//  PlayerViewController.swift
//  TopSongs
//
//  Created by Malavika Akhilesh on 29/03/24.
//

import UIKit
//import WebKit

class PlayerViewController: UIViewController {
    
    weak var viewModel: HomeViewModel?
    
//    private let webView: WKWebView = {
//        let webView = WKWebView()
//        webView.translatesAutoresizingMaskIntoConstraints = false
//        return webView
//    }()
    
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let songNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Futura", size: 20.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Futura", size: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Futura", size: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playPauseButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let volumeSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.value = 0.5
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if self.view.subviews.count == 0 {
            self.configureSubViews()
        }
        addButtonTargets()
    }
    
    private func addButtonTargets() {
//        volumeSlider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
//        playPauseButton.addTarget(self, action: #selector(didTapPlayButton(_:)), for: .touchUpInside)
//        nextButton.addTarget(self, action: #selector(didTapNextButton(_:)), for: .touchUpInside)
//        backButton.addTarget(self, action: #selector(didTapBackButton(_:)), for: .touchUpInside)
    }
    
    func configureSubViews() {
        
        self.view.addSubview(albumImageView)
        self.view.addSubview(songNameLabel)
        self.view.addSubview(artistNameLabel)
        self.view.addSubview(albumNameLabel)
        
//        self.view.addSubview(webView)
        
//        self.view.addSubview(playPauseButton)
//        self.view.addSubview(backButton)
//        self.view.addSubview(nextButton)
//        self.view.addSubview(volumeSlider)
        
        NSLayoutConstraint.activate([
            albumImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            albumImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            albumImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            albumImageView.heightAnchor.constraint(equalToConstant: self.view.frame.width-40.0),
            
            songNameLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 10),
            songNameLabel.leadingAnchor.constraint(equalTo: albumImageView.leadingAnchor),
            songNameLabel.trailingAnchor.constraint(equalTo: albumImageView.trailingAnchor),
//            songNameLabel.heightAnchor.constraint(equalToConstant: 25.0),
            
            artistNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: 10),
            artistNameLabel.leadingAnchor.constraint(equalTo: songNameLabel.leadingAnchor),
            artistNameLabel.trailingAnchor.constraint(equalTo: songNameLabel.trailingAnchor),
//            artistNameLabel.heightAnchor.constraint(equalToConstant: 20.0),
            
            albumNameLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 10),
            albumNameLabel.leadingAnchor.constraint(equalTo: artistNameLabel.leadingAnchor),
            albumNameLabel.trailingAnchor.constraint(equalTo: artistNameLabel.trailingAnchor),
            albumNameLabel.heightAnchor.constraint(equalToConstant: 20.0),
            
//            webView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10.0),
//            webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20.0)
//            playPauseButton.centerXAnchor.constraint(equalTo: albumNameLabel.centerXAnchor, constant: 0),
//            playPauseButton.centerYAnchor.constraint(equalTo: albumNameLabel.centerYAnchor, constant: 50.0),
//            playPauseButton.widthAnchor.constraint(equalToConstant: 50.0),
//            playPauseButton.heightAnchor.constraint(equalToConstant: 50.0),
//            
//            backButton.topAnchor.constraint(equalTo: playPauseButton.topAnchor),
//            backButton.widthAnchor.constraint(equalToConstant: 50.0),
//            backButton.heightAnchor.constraint(equalToConstant: 50.0),
//            backButton.trailingAnchor.constraint(equalTo: playPauseButton.leadingAnchor, constant: -40.0),
//            
//            nextButton.topAnchor.constraint(equalTo: playPauseButton.topAnchor),
//            nextButton.leadingAnchor.constraint(equalTo: playPauseButton.trailingAnchor, constant: 40.0),
//            nextButton.widthAnchor.constraint(equalToConstant: 50.0),
//            nextButton.heightAnchor.constraint(equalToConstant: 50.0),
//            
//            volumeSlider.leadingAnchor.constraint(equalTo: albumNameLabel.leadingAnchor),
//            volumeSlider.trailingAnchor.constraint(equalTo: albumNameLabel.trailingAnchor),
//            volumeSlider.heightAnchor.constraint(equalToConstant: 30.0),
//            volumeSlider.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80.0)
            
        ])
        
        
        populateFields()
//        loadAudio()
    }
    
    func populateFields() {
        guard let viewModel = self.viewModel else {
            return
        }
        let song = viewModel.songsList[viewModel.selectedIndex]
        let imageURLString = song.artworkUrl100
        guard let _urlString = imageURLString else {
            self.albumImageView.image = UIImage(systemName: "profile")
            return
        }
        TSImageLoader.shared.downloadImage(_urlString) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.albumImageView.image = UIImage(data: data)
                }
            case .failure(_):
                break
            }
        }
        
        songNameLabel.text = song.name
        artistNameLabel.text = song.artistName
        albumNameLabel.text = "\(song.genres?.first?.name ?? "")\t Released on: \(song.releaseDate ?? "")"
    }
    
//    func loadAudio() {
//        guard let viewModel = self.viewModel else {
//            return
//        }
//        let song = viewModel.songsList[viewModel.selectedIndex]
//        guard let urlString = song.url, let url = URL(string: urlString) else {
//            return
//        }
//        webView.load(URLRequest(url: url))
//    }
    
    
//    @objc func didTapPlayButton(_ button: UIButton) {
//        
//    }
//
//    @objc func didTapNextButton(_ button: UIButton) {
//        
//    }
//    
//    @objc func didTapBackButton(_ button: UIButton) {
//        
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
}
