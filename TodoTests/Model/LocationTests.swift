//
//  LocationTests.swift
//  Todo
//
//  Created by Shawn Wu on 8/09/16.
//  Copyright © 2016 Spark. All rights reserved.
//

import XCTest
import CoreLocation

class LocationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_SetName()  {
        let lcoation = Location(name: "test name")
        XCTAssertEqual(lcoation.name, "test name")
    }
    
    func testInit_ShouldSetNameAndCoordinate(){
        let testCoordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "", coordinate: testCoordinate)

        
        XCTAssertEqual(testCoordinate.latitude, location.coordinate?.latitude)
    }
    
}
