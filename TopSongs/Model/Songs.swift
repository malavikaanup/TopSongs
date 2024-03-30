//
//  Songs.swift
//  TopSongs
//
//  Created by Malavika Akhilesh on 29/03/24.
//

import Foundation

// MARK: - Songs
struct Songs: Codable {
    let feed: Feed?
}

// MARK: - Feed
struct Feed: Codable {
    let title: String?
    let id: String?
    let author: Author?
    let links: [Link]?
    let copyright, country: String?
    let icon: String?
    let updated: String?
    let results: [SongList]?
}

// MARK: - Author
struct Author: Codable {
    let name: String?
    let url: String?
}

// MARK: - Link
struct Link: Codable {
    let linkSelf: String?

    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
    }
}

// MARK: - Result
struct SongList: Codable {
    let artistName, id, name, releaseDate: String?
    let kind: String = "songs"
    let artistID: String?
    let artistURL: String?
    let contentAdvisoryRating: String = "Explicit"
    let artworkUrl100: String?
    let genres: [Genre]?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case artistName, id, name, releaseDate, kind
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case contentAdvisoryRating, artworkUrl100, genres, url
    }
}

// MARK: - Genre
struct Genre: Codable {
    let genreID: String?
    let name: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}
