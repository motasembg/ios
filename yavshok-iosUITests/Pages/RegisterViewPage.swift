//
//  RegisterViewPage.swift
//  yavshok-ios
//
//  Created by MOATSMBILAH ABOGSYSA on 24.07.2025.
//

import XCTest

final class RegisterViewPage {
    private let app: XCUIApplication

    //Locatos
    private var titleLabel: XCUIElement { app.staticTexts["registerTitle"] }
    private var emailField: XCUIElement { app.textFields["emailField"] }
    private var passwordField: XCUIElement { app.secureTextFields["passwordField"] }
    private var ageField: XCUIElement { app.textFields["ageField"] }
    private var registerButton: XCUIElement { app.buttons["registerButton"] }
    private var backButton: XCUIElement { app.buttons["backButton"] }
    private var validationError: XCUIElement { app.staticTexts["validationError"] }

    init(app: XCUIApplication) {
        self.app = app
    }

    //Assertions
    @discardableResult
    func assertOnPage(timeout: TimeInterval = 5) -> RegisterViewPage {
        XCTAssertTrue(titleLabel.waitForExistence(timeout: timeout),
                      "title not visible")
        return self
    }

    @discardableResult
    func assertValidationError(timeout: TimeInterval = 5) -> RegisterViewPage {
        XCTAssertTrue(validationError.waitForExistence(timeout: timeout),
                      "validation error not visible")
        return self
    }

    //Actions
    @discardableResult
    func enterEmail(_ email: String) -> RegisterViewPage {
        XCTAssertTrue(emailField.exists, "email field missing")
        emailField.tap()
        emailField.typeText(email)
        return self
    }

    @discardableResult
    func enterPassword(_ password: String) -> RegisterViewPage {
        XCTAssertTrue(passwordField.exists, "password field missing")
        passwordField.tap()
        passwordField.typeText(password)
        return self
    }

    @discardableResult
    func enterAge(_ age: String) -> RegisterViewPage {
        XCTAssertTrue(ageField.exists, "age field missing")
        ageField.tap()
        ageField.typeText(age)
        return self
    }

    @discardableResult
    func tapRegisterButton() -> RegisterViewPage {
        XCTAssertTrue(registerButton.exists, "register button missing")
        registerButton.tap()
        return self
    }

    @discardableResult
    func tapBackButton() -> RegisterViewPage {
        XCTAssertTrue(backButton.exists, "back button missing")
        backButton.tap()
        return self
    }
}
