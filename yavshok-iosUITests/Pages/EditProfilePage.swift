//
//  EditProfilePage.swift
//  yavshok-ios
//
//  Created by MOATSMBILAH ABOGSYSA on 24.07.2025.
//

import XCTest

//for clean the text fields
extension XCUIElement {
    func clearAndTypeText(_ text: String) {
        tap()
        guard let stringValue = self.value as? String else {
            typeText(text)
            return
        }
        // Delete
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        typeText(deleteString)
        // type new one
        typeText(text)
    }
}

final class EditProfilePage {
    
    private let app: XCUIApplication

    //Locators
    private var nameField: XCUIElement { app.textFields["nameField"] }
    private var saveButton: XCUIElement { app.buttons["saveButton"] }
    private var cancelButton: XCUIElement { app.buttons["cancelButton"] }

    //constructor our app
    init(app: XCUIApplication) {
        self.app = app
    }

    //Assertions
    @discardableResult
    func assertOnPage(timeout: TimeInterval = 5) -> EditProfilePage {
        XCTAssertTrue(nameField.waitForExistence(timeout: timeout),
                      "name field not visible")
        return self
    }

    //Actions
    @discardableResult
    func enterName(_ newName: String) -> EditProfilePage {
        XCTAssertTrue(nameField.exists, "name field missing")
        nameField.tap()
        nameField.clearAndTypeText(newName)
        return self
    }

    @discardableResult
    func tapSaveButton() -> EditProfilePage {
        XCTAssertTrue(saveButton.exists, "save button missing")
        saveButton.tap()
        return self
    }

    @discardableResult
    func tapCancelButton() -> EditProfilePage {
        XCTAssertTrue(cancelButton.exists, "cancel button missing")
        cancelButton.tap()
        return self
    }
}
