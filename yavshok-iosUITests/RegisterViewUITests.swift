//
//  RegisterViewUITests.swift
//  yavshok-ios
//
//  Created by MOATSMBILAH ABOGSYSA on 24.07.2025.
//

import XCTest

final class RegisterViewUITests: XCTestCase {
    var app: XCUIApplication!
    var registerView: RegisterViewPage!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        MainViewPage(app: app).tapNavigationButton()
        LoginViewPage(app: app).tapRegisterButton()
        registerView = RegisterViewPage(app: app)
    }

    func testSuccessfulRegistration() {
        registerView
            .assertOnPage()
            .enterEmail("createme\(Int.random(in: 1000...9999))@yandex.ru")
            .enterPassword("MarvelSpidey")
            .enterAge("25")
            .tapRegisterButton()
        ProfileViewPage(app: app).assertOnPage()
    }

    func testValidationErrorForExistingUser() {
        registerView
            .assertOnPage()
            .enterEmail("abogsysa@yandex.ru")
            .enterPassword("12345678m")
            .enterAge("26")
            .tapRegisterButton()
            .assertValidationError()
    }

    func testBackButtonNavigation() {
        registerView
            .assertOnPage()
            .tapBackButton()
        LoginViewPage(app: app).assertOnPage()
    }
}
