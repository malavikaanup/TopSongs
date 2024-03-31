//
//  Constants.swift
//  TopSongs
//
//  Created by Malavika Akhilesh on 29/03/24.
//

import Foundation

final class Constants {
    static func urlString(limit: Int) -> String {
        return "https://rss.applemarketingtools.com/api/v2/ca/music/most-played/\(limit)/songs.json"
    }
//    static let urlString = "https://rss.applemarketingtools.com/api/v2/ca/music/most-played/50/songs.json"
    static let collectionViewCellID = "songsCellID"
    static let collectionViewHeaderID = "headerID"
    static let playerVCID = "PlayerViewController"
}
