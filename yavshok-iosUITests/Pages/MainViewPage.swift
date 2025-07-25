//
//  MainViewPage.swift
//  yavshok-ios
//
//  Created by MOATSMBILAH ABOGSYSA on 24.07.2025.
//

import XCTest

final class MainViewPage {
    private let app: XCUIApplication

    // Locators
    private var titleLabel: XCUIElement { app.staticTexts["mainTitle"] }
    private var emailInput: XCUIElement { app.textFields["emailInput"] }
    private var checkButton: XCUIElement { app.buttons["checkButton"] }
    private var navigationButton: XCUIElement { app.buttons["navigationButton"] }

    //Messages Backroll!
    private var successText: XCUIElement { app.staticTexts["successText"] }
    private var failureText: XCUIElement { app.staticTexts["failureText"] }
    private var errorMessage: XCUIElement { app.staticTexts["errorMessage"] }

    //constructor our app
    init(app: XCUIApplication) {
        self.app = app
    }

    //Assertions
    @discardableResult //This function returns something, but if i don’t use that returned value, it’s fine, dont make error!
    func assertOnPage(timeout: TimeInterval = 5) -> MainViewPage {
        XCTAssertTrue(titleLabel.waitForExistence(timeout: timeout),
                      "MainView title not found")
        return self
    }

    @discardableResult
    func assertSuccessState(timeout: TimeInterval = 5) -> MainViewPage {
        XCTAssertTrue(successText.waitForExistence(timeout: timeout),
                      "Success text not visible")
        return self
    }

    @discardableResult
    func assertFailureState(timeout: TimeInterval = 5) -> MainViewPage {
        XCTAssertTrue(failureText.waitForExistence(timeout: timeout),
                      "Failure text not visible")
        return self
    }

    @discardableResult
    func assertErrorShown(timeout: TimeInterval = 5) -> MainViewPage {
        XCTAssertTrue(errorMessage.waitForExistence(timeout: timeout),
                      "Error message not visible")
        return self
    }

    //Actions
    @discardableResult
    func enterEmail(_ email: String) -> MainViewPage {
        XCTAssertTrue(emailInput.exists, "Email input not found")
        emailInput.tap()
        emailInput.typeText(email)
        return self
    }

    @discardableResult
    func tapCheckButton() -> MainViewPage {
        XCTAssertTrue(checkButton.exists, "Check button not found")
        checkButton.tap()
        return self
    }

    @discardableResult
    func tapNavigationButton() -> MainViewPage {
        XCTAssertTrue(navigationButton.exists, "Navigation button not found")
        navigationButton.tap()
        return self
    }
}
