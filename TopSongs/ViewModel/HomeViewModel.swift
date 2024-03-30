//
//  HomeViewModel.swift
//  TopSongs
//
//  Created by Malavika Akhilesh on 29/03/24.
//

import Foundation

protocol SongServices: AnyObject {
    func reloadData()
    func showErrorAlert(error: ErrorCases?)
}


final class HomeViewModel {
    var songsList: [SongList] = [] {
        didSet {
            self.songDelegate?.reloadData()
        }
    }
    var isLoading: Bool =  false
    var shouldShowAlert = false {
        didSet {
            if shouldShowAlert {
                self.songDelegate?.showErrorAlert(error: self.error)
            }
        }
    }
    private var error: ErrorCases?
    weak var songDelegate: SongServices?
    
    func getSongsList() async{
        isLoading = true
        do {
            self.songsList = try await NetworkManager.getSongs()
            self.isLoading = false
        } catch(let err) {
            error = ErrorCases.custom(error: err)
            self.shouldShowAlert = true
            self.isLoading = false
        }
    }
    
}
