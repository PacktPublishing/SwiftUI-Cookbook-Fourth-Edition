//
//  MyCountryUITests.swift
//  MyCountryUITests
//
//  Created by Juan Catalan on 9/12/26.
//

import XCTest

final class MyCountryUITests: XCTestCase {
  let app = XCUIApplication()

  override func setUpWithError() throws {
    continueAfterFailure = false
    app.launch()
  }

  func testButtonLabels() throws {
    let expectedLabels = ["US": "USA", "SP": "Spain", "FR": "France",
                          "IT": "Italy", "Reset": "Reset"]
    for (identifier, expectedLabel) in expectedLabels {
      let button = app.buttons[identifier]
      XCTAssertTrue(button.exists, "Button \(identifier) not present")
      XCTAssertEqual(button.label, expectedLabel)
    }
  }

  func testTextLabels() throws {
    let expectedLabels = ["Question": "What is your country of origin?",
                          "SelectedCountry": "USA",
                          "NumberOfTaps": "Number of taps: 0"]
    for (identifier, expectedLabel) in expectedLabels {
      let text = app.staticTexts[identifier]
      XCTAssertTrue(text.exists, "Text \(identifier) not present")
      XCTAssertEqual(text.label, expectedLabel)
    }
  }

  func testCountryButtonAction() throws {
    var counter = 0
    for identifier in ["SP", "FR", "IT", "US"] {
      let button = app.buttons[identifier]
      button.tap()
      counter += 1
      XCTAssertEqual(app.staticTexts["SelectedCountry"].label, button.label)
      XCTAssertEqual(app.staticTexts["NumberOfTaps"].label,
                     "Number of taps: \(counter)")
    }
  }

  func testResetButtonAction() throws {
    let spain = app.buttons["SP"]
    spain.tap()
    spain.tap()
    XCTAssertEqual(app.staticTexts["SelectedCountry"].label, "Spain")
    XCTAssertEqual(app.staticTexts["NumberOfTaps"].label, "Number of taps: 2")
    app.buttons["Reset"].tap()
    XCTAssertEqual(app.staticTexts["SelectedCountry"].label, "USA")
    XCTAssertEqual(app.staticTexts["NumberOfTaps"].label, "Number of taps: 0")
  }
}
