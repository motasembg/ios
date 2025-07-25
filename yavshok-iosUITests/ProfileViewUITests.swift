//
//  ProfileViewUITests.swift
//  yavshok-ios
//
//  Created by MOATSMBILAH ABOGSYSA on 24.07.2025.
//

import XCTest

final class ProfileViewUITests: XCTestCase {
    var app: XCUIApplication!
    var profileView: ProfileViewPage!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        // If ProfileView appears after login, do a login first:
        MainViewPage(app: app).tapNavigationButton()
        LoginViewPage(app: app)
            .enterEmail("abogsysa@yandex.ru")
            .enterPassword("12345678m")
            .tapLoginButton()
        profileView = ProfileViewPage(app: app)
    }

    func testProfileElements() {
        profileView
            .assertOnPage()
            .assertPhotosLoaded()
    }

    func testEditProfileButton() {
        profileView
            .assertOnPage()
            .tapEditProfile()
    }

    func testLogout() {
        profileView
            .assertOnPage()
            .tapLogout()
        MainViewPage(app: app).assertOnPage()
    }
}
