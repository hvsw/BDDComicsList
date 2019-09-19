//
//  ComicsListPresenterMock.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ComicsListPresenterMock {
    var _didAskToPresentResponseIsInvalid: Bool = false
    var _didAskToPresentNoInternetConnectionErrorMessage: Bool = false
    var _didAskToPresentFetchDataActivityIndicator: (didAsk: Bool, shouldPresent: Bool?) = (false, nil)
    var _didAskToPresentComics: (didAsk: Bool, sectionedComics: SectionedComics?) = (false, nil)
}

extension ComicsListPresenterMock: ComicsListPresentationLogic {
    func presentNoInternetConnectionErrorMessage() {
        _didAskToPresentNoInternetConnectionErrorMessage = true
    }
    func presentFetchDataActivityIndicator(_ shouldPresent: Bool) {
        _didAskToPresentFetchDataActivityIndicator = (true, shouldPresent)
    }
    func presentResponseIsInvalid() {
        _didAskToPresentResponseIsInvalid = true
    }
    func presentComics(sectionedComics: SectionedComics) {
        self._didAskToPresentComics = (true, sectionedComics)
    }
}
