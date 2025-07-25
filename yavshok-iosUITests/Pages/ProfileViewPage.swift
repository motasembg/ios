//
//  ProfileViewPage.swift
//  yavshok-ios
//
//  Created by MOATSMBILAH ABOGSYSA on 24.07.2025.
//

import XCTest

final class ProfileViewPage {
    private let app: XCUIApplication

    //Locators
    private var profileImage: XCUIElement { app.images["profileImage"] }
    private var userNameLabel: XCUIElement { app.staticTexts["userName"] }
    private var logoutButton: XCUIElement { app.buttons["logoutButton"] }
    private var editProfileButton: XCUIElement { app.buttons["editProfileButton"] }

    // MARK: - Init
    init(app: XCUIApplication) {
        self.app = app
    }

    // MARK: - Assertions
    @discardableResult
    func assertOnPage(timeout: TimeInterval = 5) -> ProfileViewPage {
        XCTAssertTrue(profileImage.waitForExistence(timeout: timeout), "profile image not found")
        XCTAssertTrue(userNameLabel.exists, "username not found")
        return self
    }

    @discardableResult
    func assertPhotosLoaded(count: Int = 4) -> ProfileViewPage {
        for i in 1...count {
            XCTAssertTrue(profileImage.exists, "photo\(i) not found")
        }
        return self
    }

    // MARK: - Actions
    @discardableResult
    func tapLogout() -> ProfileViewPage {
        XCTAssertTrue(logoutButton.exists, "logout button missing")
        logoutButton.tap()
        return self
    }

    @discardableResult
    func tapEditProfile() -> ProfileViewPage {
        XCTAssertTrue(editProfileButton.exists, "edit profile button missing")
        editProfileButton.tap()
        return self
    }
}

