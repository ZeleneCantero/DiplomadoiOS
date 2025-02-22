//
//  Untitled.swift
//  AppMusicVIPER
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 16/11/24.
//

import Foundation

protocol HomePageInteractorProtocol: AnyObject {
    func getArtists() -> [HomePageEntity]
}

class HomePageInteractor: HomePageInteractorProtocol {
    
    func getArtists() -> [HomePageEntity] {
        return [
            HomePageEntity(imageNameArtist: "camilo", buttonNameArtist: "Camilo"),
            HomePageEntity(imageNameArtist: "carlaMorrison", buttonNameArtist: "Carla Morrison"),
            HomePageEntity(imageNameArtist: "Humbe", buttonNameArtist: "Humbe"),
            HomePageEntity(imageNameArtist: "lanaDelRey", buttonNameArtist: "Lana Del Rey"),
            HomePageEntity(imageNameArtist: "rauwAlejandro", buttonNameArtist: "Rauw Alejandro")
        ]
    }
}
