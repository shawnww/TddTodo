//
//  InputViewControllerTests.swift
//  Todo
//
//  Created by Shawn on 24/09/16.
//  Copyright © 2016 Spark. All rights reserved.
//

import XCTest
import CoreLocation

@testable import Todo

class InputViewControllerTests: XCTestCase {

    var sut: InputViewController!
    var placemark: MockPlacemark!

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main",bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "InputViewController") as! InputViewController
        _ = sut.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_HasTitleTextField() {
        XCTAssertNotNil(sut.titleTextField)
    }
    
    
    
//dateTextField, locationTextField, addressTextField, descriptionTextField, saveButton, and cancelButton

    func test_HasDateField() {
        XCTAssertNotNil(sut.dateTextField)
    }
    
    func test_HasLocationTextField() {
        XCTAssertNotNil(sut.locationTextField)
    }
    
    func test_HasDescriptionTextField(){
        XCTAssertNotNil(sut.descriptionTextField)
    }
    
    func test_HasSaveButton() {
        XCTAssertNotNil(sut.saveButton)
    }
    
    func test_HasCancelButton () {
        XCTAssertNotNil(sut.cancelButton)
    }
    
//    func testSave_UsesGeocoderToGetCoordinateFromAddress() {
//        sut.titleTextField.text = "Test Title"
//        sut.dateTextField.text = "02/22/2016"
//        sut.locationTextField.text = "Office"
//        sut.addressTextField.text = "Infinite Loop 1, Cupertino"
//        sut.descriptionTextField.text = "Test Description"
//        let mockGeocoder = MockGeocoder()
//        sut.geocoder = mockGeocoder
//        sut.itemManager = ItemManager()
//        sut.save()
//        placemark = MockPlacemark()
//        let coordinate = CLLocationCoordinate2DMake(37.3316851,
//                                                    -122.0300674)
//        placemark.mockCoordinate = coordinate
//        mockGeocoder.completionHandler?([placemark], nil)
//        let item = sut.itemManager?.itemAtIndex(0)
//        let testItem = ToDoItem(title: "Test Title",
//                                itemDescription: "Test Description",
//                                timeStamp: 1456095600,
//                                location: Location(name: "Office", coordinate: coordinate))
//        XCTAssertEqual(item, testItem)
//    }
    
}


extension InputViewControllerTests {
    class MockGeocoder: CLGeocoder {
        var completionHandler: CLGeocodeCompletionHandler?
        func geocode(addressString: String,completionHandler: @escaping CLGeocodeCompletionHandler) {
            self.completionHandler = completionHandler
        }
    }
    
    
    class MockPlacemark : CLPlacemark {
        var mockCoordinate: CLLocationCoordinate2D?
        override var location: CLLocation? {
            guard let coordinate = mockCoordinate else
            {
                return CLLocation()
            }
            return CLLocation(latitude: coordinate.latitude,
                              longitude: coordinate.longitude)
        }
    }
}
