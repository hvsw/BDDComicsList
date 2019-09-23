//
//  CharactersListViewMock.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-23.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class CharactersListViewMock {
    var _didAskToDisplayErrorAlert: (title: String?, message: String?) = (nil,nil)
    var _didAskToDisplayActivityView: (didAsk: Bool, shouldDisplay: Bool?) = (false, nil)
    var _didAskToReloadListOfCharacters: Bool = false
}

extension CharactersListViewMock: CharactersListDisplayLogic {
    func displayErrorAlert(title: String, message: String) {
        _didAskToDisplayErrorAlert = (title, message)
    }
    func displayUIActivityView(_ display: Bool) {
        _didAskToDisplayActivityView = (true, display)
    }
    func reloadListOfCharacters() {
        _didAskToReloadListOfCharacters = true
    }
}
