//
//  EditProfileUITests.swift
//  yavshok-ios
//
//  Created by MOATSMBILAH ABOGSYSA on 24.07.2025.
//

import XCTest

final class EditProfileUITests: XCTestCase {
    var app: XCUIApplication!
    var editProfile: EditProfilePage!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        // Navigate to ProfileView first
        MainViewPage(app: app).tapNavigationButton()
        LoginViewPage(app: app)
            .enterEmail("abogsysa@yandex.ru")
            .enterPassword("12345678m")
            .tapLoginButton()
        ProfileViewPage(app: app).tapEditProfile()
        editProfile = EditProfilePage(app: app)
    }

    func testEditNameAndSave() {
        editProfile
            .assertOnPage()
            .enterName("New iOS Name")
            .tapSaveButton()
//         ✅ after save, should return to ProfileView
        ProfileViewPage(app: app).assertOnPage()
    }

    func testCancelEdit() {
        editProfile
            .assertOnPage()
            .tapCancelButton()
        // ✅ should return to ProfileView without changes
        ProfileViewPage(app: app).assertOnPage()
    }
}
