//
//  LoginViewPage.swift
//  yavshok-ios
//
//  Created by MOATSMBILAH ABOGSYSA on 24.07.2025.
//

import XCTest

final class LoginViewPage {
    private let app: XCUIApplication

    //Locators
    private var titleLabel: XCUIElement { app.staticTexts["loginTitle"] }
    private var emailField: XCUIElement { app.textFields["emailField"] }
    private var passwordField: XCUIElement { app.secureTextFields["passwordField"] }
    private var loginButton: XCUIElement { app.buttons["loginButton"] }
    private var backButton: XCUIElement { app.buttons["backButton"] }
    private var registerButton: XCUIElement { app.buttons["registerButton"] }
    private var validationError: XCUIElement { app.staticTexts["validationError"] }

    init(app: XCUIApplication) {
        self.app = app
    }

    //Assertions
    @discardableResult
    func assertOnPage(timeout: TimeInterval = 5) -> LoginViewPage {
        XCTAssertTrue(titleLabel.waitForExistence(timeout: timeout),
                      "title not visible")
        return self
    }

    @discardableResult
    func assertValidationError(timeout: TimeInterval = 5) -> LoginViewPage {
        XCTAssertTrue(validationError.waitForExistence(timeout: timeout),
                      "validation error not visible")
        return self
    }

    //Actions
    @discardableResult
    func enterEmail(_ email: String) -> LoginViewPage {
        XCTAssertTrue(emailField.exists, "email field missing")
        emailField.tap()
        emailField.typeText(email)
        return self
    }

    @discardableResult
    func enterPassword(_ password: String) -> LoginViewPage {
        XCTAssertTrue(passwordField.exists, "password field missing")
        passwordField.tap()
        passwordField.typeText(password)
        return self
    }

    @discardableResult
    func tapLoginButton() -> LoginViewPage {
        XCTAssertTrue(loginButton.exists, "login button missing")
        XCTAssertTrue(loginButton.waitForExistence(timeout: 5))
        loginButton.tap()
        return self
    }

    @discardableResult
    func tapBackButton() -> LoginViewPage {
        XCTAssertTrue(backButton.exists, "back button missing")
        backButton.tap()
        return self
    }

    @discardableResult
    func tapRegisterButton() -> LoginViewPage {
        XCTAssertTrue(registerButton.exists, "register button missing")
        registerButton.tap()
        return self
    }
}
