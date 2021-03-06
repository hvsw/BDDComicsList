//
//  ComicsListBusinessLogic.swift
//  BDDComicsList
//
//  Created by William Hass on 2019-09-18.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol ComicsListBusinessLogic {
    func loadListOfComics()
    func comicSelected(comic: Comic)
}
