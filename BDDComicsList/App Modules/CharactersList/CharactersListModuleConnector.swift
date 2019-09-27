//
//  CharactersListModuleConnector.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class CharactersListModuleConnector {
    
    var preConnection: ()->Void = { }
    
    let comic: Comic
    let shouldUseMockData: Bool
    
    init(comic: Comic, shouldUseMockData: Bool) {
        self.comic = comic
        self.shouldUseMockData = shouldUseMockData
    }

    func connectDependencies(charactersListViewController: CharactersListViewController) {
        self.preConnection()

        // Data Layer
        let remoteData: CharactersListRemoteDataLogic = {
            if self.shouldUseMockData {
                return MockedCharactersListData()
            } else {
                let httpDataLoader = HTTPDataLoader()
                let marvelAPIURLBuilder = MarvelAPIURLBuilder(apiKeys: MarvelAPICredentials.defaultKeys)
                return CharactersListRemoteData(marvelAPIURLBuilder: marvelAPIURLBuilder, httpDataLoader: httpDataLoader)
            }
        }()
        let dataGateway = CharactersListDataGateway(remoteData: remoteData)
        
        CharactersListModuleDependencies().injectDependencies(charactersListViewController: charactersListViewController, dataGateway: dataGateway, comic: self.comic)
        
        // Business Logic
        let interactor = CharactersListInteractor(comic: self.comic, dataGateway: dataGateway)
        
        // Presentation layer
        let presenter = CharactersListPresenter(interactor: interactor)
        
        // Dependency Injection
        charactersListViewController.eventHandler = presenter
        charactersListViewController.dataSource = presenter
        presenter.view = charactersListViewController
        interactor.presentation = presenter
    }
}
