//
//  ComicsListSpecs.swift
//  BDDComicsListMacOSTests
//
//  Created by William Hass on 2019-09-17.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import Quick
import Nimble

//*ViewController -> Conforma "DisplayLogic", e tem uma propriedade `interactor: BusinessLogic`
//
//*Interactor -> Conforma "BusinessLogic", e tem uma propriedade `presenter: PresentationLogic`
//
//*Presenter -> Conforma "PresentationLogic" e tem uma propriedade `view: DisplayLogic`s

class ComicsListSpecs: QuickSpec {
    
    var dataGatewayMock: ComicsListDataGatewayMock!
    var presenterMock: ComicsListPresenterMock!
    var interactor: ComicsListInteractor!
    
    override func spec() {
        beforeSuite {
            let dataGatewayMock = ComicsListDataGatewayMock()
            let presenterMock = ComicsListPresenterMock()
            let interactor = ComicsListInteractor(presenter: presenterMock, dataGateway: dataGatewayMock)
            
            self.dataGatewayMock = dataGatewayMock
            self.presenterMock = presenterMock
            self.interactor = interactor
        }
        describe("Given that I don't have internet connection") {
            beforeEach {
                self.dataGatewayMock._fetchComicsResultMock = .noInternetConnection
            }
            context("When it tries to load the comics") {
                beforeEach {
                    self.presenterMock._didAskToPresentNoInternetConnectionErrorMessage = false
                }
                it("Then present a message informing that there is no internet connection") {
                    expect(self.presenterMock._didAskToPresentNoInternetConnectionErrorMessage).to(beTrue())
                }
                it("Should not present a UI activity inticator") {
                    // TODO: Assert
                }
            }
            context("And the list of comics has one or more items") {
                beforeEach {
                }
                context("When I tap on a comic title") {
                    it("Then present a message informing that there is no internet connection") {
                        // TODO: Assert
                    }
                }
            }
        }
        
        describe("Given that I have internet connection") {
            context("When the comics list response is invalid") {
                beforeEach {
                }
                it("Should present an error message informing that the content couldn't be read") {
                    // TODO: Assert
                }
            }
            context("When the comics list response is valid") {
                beforeEach {
                }
                it("Should present a list of Marvel Comics titles grouped by the first letter of the comic's title") {
                    // TODO: Assert
                }
            }
            context("When it tries to load the comics") {
                beforeEach {
                }
                it("Should present a UI activity inticator") {
                    // TODO: Assert
                }
            }
            context("When it finished loading the comics") {
                it("Should hide the UI activity inticator") {
                    // TODO: Assert
                }
            }
            context("And the list of comics has one or more items") {
                context("When I tap on a comic title") {
                    beforeEach {
                    }
                    context("And the response is invalid") {
                        beforeEach {
                        }
                        it("Should present a message informing that it can not present the list of characters") {
                            // TODO: Assert
                        }
                    }
                    context("And the response is valid") {
                        beforeEach {
                        }
                        it("Then present a list with the name of the characters of that comic") {
                            // TODO: Assert
                        }
                    }
                }
            }
        }
    }
}
