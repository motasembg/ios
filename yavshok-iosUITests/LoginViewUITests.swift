//
//  yavshok_iosUITestsLaunchTests.swift
//  yavshok-iosUITests
//
//  Created by MOATSMBILAH ABOGSYSA on 24.07.2025.
//

import XCTest

final class LoginViewUITests: XCTestCase {
    var app: XCUIApplication!
    var loginView: LoginViewPage!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        // if MainView always appears first, navigate to login
        MainViewPage(app: app).tapNavigationButton()
        loginView = LoginViewPage(app: app)
    }

    func testSuccessfulLogin() {
        loginView
            .assertOnPage()
            .enterEmail("abogsysa@yandex.ru")
            .enterPassword("12345678m")
            .tapLoginButton()
        ProfileViewPage(app: app).assertOnPage()
    }

    func testValidationError() {
        loginView
            .assertOnPage()
            .enterEmail("amIMarvel@yandex.ru")
            .enterPassword("12345678m")
            .tapLoginButton()
            .assertValidationError()
    }

    func testBackNavigation() {
        loginView
            .assertOnPage()
            .tapBackButton()
        MainViewPage(app: app).assertOnPage()
    }

    func testOpenRegister() {
        loginView
            .assertOnPage()
            .tapRegisterButton()
        RegisterViewPage(app: app).assertOnPage()
    }
}
