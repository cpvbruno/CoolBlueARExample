//
//  CoolBlue3DExampleUITests.swift
//  CoolBlue3DExampleUITests
//
//  Created by Bruno Pantaleão N. Gonçalves on 02/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import XCTest

class CoolBlue3DExampleUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func basicNavigationTest() {
        let app = XCUIApplication()
        app.buttons["Let's Go!"].tap()
        app.navigationBars["Products"].buttons["Refresh"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"100.99")/*[[".cells.containing(.staticText, identifier:\"Samsung TV\")",".cells.containing(.staticText, identifier:\"100.99\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tempus et nulla egestas commodo. Quisque imperdiet, turpis nec eleifend accumsan, diam est aliquam ex, eu vestibulum justo lectus molestie arcu. Donec finibus metus vitae suscipit finibus. Nam ut ipsum nisl. Etiam sed augue id velit vulputate ultrices vel ut metus. Suspendisse dui massa, egestas eu scelerisque quis, tempor in purus. Mauris ut maximus justo. Integer vestibulum eleifend gravida. Vivamus efficitur, felis ac sollicitudin pretium, est nibh gravida neque, lobortis tincidunt tellus ex eget mauris. In a metus magna. Sed in luctus tellus. Quisque sapien lectus, accumsan eget fringilla vitae, fermentum at nisi."].tap()
        
        let backToRealityButton = app.buttons["Back to reality"]
        backToRealityButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"400.99")/*[[".cells.containing(.staticText, identifier:\"LG TV\")",".cells.containing(.staticText, identifier:\"400.99\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tempus et nulla egestas commodo. Quisque imperdiet, turpis nec eleifend accumsan, diam est aliquam ex, eu vestibulum justo lectus molestie arcu. Donec finibus metus vitae suscipit finibus. Nam ut ipsum nisl. Etiam sed augue id velit vulputate ultrices vel ut metus. Suspendisse dui massa, egestas eu scelerisque quis, tempor in purus. Mauris ut maximus justo. Integer vestibulum eleifend gravida. Vivamus efficitur, felis ac sollicitudin pretium, est nibh gravida neque, lobortis tincidunt tellus ex eget mauris. In a metus magna. Sed in luctus tellus. Quisque sapien lectus, accumsan eget fringilla vitae, fermentum at nisi."].tap()
        backToRealityButton.tap()
        
        let tablesQuery2 = tablesQuery
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["400.99"]/*[[".cells.staticTexts[\"400.99\"]",".staticTexts[\"400.99\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"300.99")/*[[".cells.containing(.staticText, identifier:\" Sony TV\")",".cells.containing(.staticText, identifier:\"300.99\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tempus et nulla egestas commodo. Quisque imperdiet, turpis nec eleifend accumsan, diam est aliquam ex, eu vestibulum justo lectus molestie arcu. Donec finibus metus vitae suscipit finibus. Nam ut ipsum nisl. Etiam sed augue id velit vulputate ultrices vel ut metus. Suspendisse dui massa, egestas eu scelerisque quis, tempor in purus. Mauris ut maximus justo. Integer vestibulum eleifend gravida. Vivamus efficitur, felis ac sollicitudin pretium, est nibh gravida neque, lobortis tincidunt tellus ex eget mauris. In a metus magna. Sed in luctus tellus. Quisque sapien lectus, accumsan eget fringilla vitae, fermentum at nisi."].tap()
        backToRealityButton.tap()
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["Philips TV"]/*[[".cells.staticTexts[\"Philips TV\"]",".staticTexts[\"Philips TV\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["SLorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tempus et nulla egestas commodo. Quisque imperdiet, turpis nec eleifend accumsan, diam est aliquam ex, eu vestibulum justo lectus molestie arcu. Donec finibus metus vitae suscipit finibus. Nam ut ipsum nisl. Etiam sed augue id velit vulputate ultrices vel ut metus. Suspendisse dui massa, egestas eu scelerisque quis, tempor in purus. Mauris ut maximus justo. Integer vestibulum eleifend gravida. Vivamus efficitur, felis ac sollicitudin pretium, est nibh gravida neque, lobortis tincidunt tellus ex eget mauris. In a metus magna. Sed in luctus tellus. Quisque sapien lectus, accumsan eget fringilla vitae, fermentum at nisi."]/*[[".cells.staticTexts[\"SLorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tempus et nulla egestas commodo. Quisque imperdiet, turpis nec eleifend accumsan, diam est aliquam ex, eu vestibulum justo lectus molestie arcu. Donec finibus metus vitae suscipit finibus. Nam ut ipsum nisl. Etiam sed augue id velit vulputate ultrices vel ut metus. Suspendisse dui massa, egestas eu scelerisque quis, tempor in purus. Mauris ut maximus justo. Integer vestibulum eleifend gravida. Vivamus efficitur, felis ac sollicitudin pretium, est nibh gravida neque, lobortis tincidunt tellus ex eget mauris. In a metus magna. Sed in luctus tellus. Quisque sapien lectus, accumsan eget fringilla vitae, fermentum at nisi.\"]",".staticTexts[\"SLorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tempus et nulla egestas commodo. Quisque imperdiet, turpis nec eleifend accumsan, diam est aliquam ex, eu vestibulum justo lectus molestie arcu. Donec finibus metus vitae suscipit finibus. Nam ut ipsum nisl. Etiam sed augue id velit vulputate ultrices vel ut metus. Suspendisse dui massa, egestas eu scelerisque quis, tempor in purus. Mauris ut maximus justo. Integer vestibulum eleifend gravida. Vivamus efficitur, felis ac sollicitudin pretium, est nibh gravida neque, lobortis tincidunt tellus ex eget mauris. In a metus magna. Sed in luctus tellus. Quisque sapien lectus, accumsan eget fringilla vitae, fermentum at nisi.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        backToRealityButton.tap()
    }
    
}
