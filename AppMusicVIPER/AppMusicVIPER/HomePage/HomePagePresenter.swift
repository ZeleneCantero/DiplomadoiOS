//
//  homePagePresenter.swift
//  AppMusicVIPER
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 16/11/24.
//

import Foundation

protocol HomePagePresenterProtocol: AnyObject {
    func viewDidLoad()
    func artistSelected(at index: Int)
}

class HomePagePresenter: HomePagePresenterProtocol {
    
    weak var view: HomePageViewProtocol?
    var interactor: HomePageInteractorProtocol!
    var router: HomePageRouterProtocol!
    
    init() {}
    
    func viewDidLoad() {
        let artists = interactor.getArtists()
        view?.showArtists(artists)
    }
    
    func artistSelected(at index: Int) {
        let artists = interactor.getArtists()
        guard index < artists.count else { return }
        let selectedArtist = artists[index]
        router.navigateToArtistDetail(with: selectedArtist)
    }
}
