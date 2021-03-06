//
//  AppStoryboard.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-22.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

enum AppStoryboard {

    enum Main: String {
        case name = "Main"
        
        enum Segue: String {
            case characterList = "CharacterListSegue"
            
            // TODO:: Can we use Generics here?
            func prepare(segue: UIStoryboardSegue, sender: Any?) {
                switch self {
                case .characterList:
                    if let connection = sender as? CharactersListModuleConnector,
                        let charactersListView = segue.destination as? CharactersListViewController {
                        connection.connectDependencies(charactersListViewController: charactersListView)
                    }
                }
            }
        }
        
        static func instance() -> UIStoryboard {
            return UIStoryboard(name: Main.name.rawValue, bundle: nil)
        }
    }
}
