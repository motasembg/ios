//
//  yavshok_iosUITests.swift
//  yavshok-iosUITests
//
//  Created by MOATSMBILAH ABOGSYSA on 24.07.2025.
//

import XCTest

final class MainViewUITests: XCTestCase {
    var app: XCUIApplication!
    var mainView: MainViewPage!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        mainView = MainViewPage(app: app)
    }

    func testCheckEmailShowsSuccessState() {
        mainView
            .assertOnPage()
            .enterEmail("abogsysa@yandex.ru")
            .tapCheckButton()
            .assertSuccessState()
    }

    func testCheckEmailShowsFailureState() {
        mainView
            .assertOnPage()
            .enterEmail("amIMarvel@yandex.ru")
            .tapCheckButton()
            .assertFailureState()
    }

    func testNavigateToLogin() {
        mainView
            .assertOnPage()
            .tapNavigationButton()
    }
}
