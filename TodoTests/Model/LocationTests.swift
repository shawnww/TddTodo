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
    
    func testEqual_ShouldBeEqual()  {
        let l1 = Location(name:  "location")
        let l2 = Location(name:  "location")
        
        XCTAssertEqual(l1, l2)
    }
    
    
    
    func performNotEqualTestWithLocationProperties(firstName: String,
                                                   secondName: String,
                                                   firstLongLat: (Double, Double)?,
                                                   secondLongLat: (Double, Double)?,
                                                   line:UInt = #line) {
        let firstCoord: CLLocationCoordinate2D?
        if let firstLongLat = firstLongLat {
            firstCoord = CLLocationCoordinate2D(latitude: firstLongLat.0, longitude: firstLongLat.1)
        }else{
            firstCoord = nil
        }
        let firstLocation = Location(name: firstName, coordinate: firstCoord)
        
        let secondCoord: CLLocationCoordinate2D?
        if let secondLongLat = secondLongLat {
            secondCoord = CLLocationCoordinate2D(latitude: secondLongLat.0, longitude: secondLongLat.1)
        }else{
            secondCoord = nil
        }
        let secondLocation = Location(name: secondName, coordinate: secondCoord)
        
        XCTAssertNotEqual(firstLocation, secondLocation,line: line)
    
    }
    
    func testEqual_WhenLatitudeDiffers_ShouldNotEqual() {
        performNotEqualTestWithLocationProperties("Home", secondName: "Home", firstLongLat: (0.0,1.0), secondLongLat: (0.0,0.0))
    }
    
    
    func testEqual_WhenLongtitudeDiffers_ShouldNotEqual() {
        performNotEqualTestWithLocationProperties("Home", secondName: "Home", firstLongLat: (1.0,0.0), secondLongLat: (0.0,0.0))
        }
    
    func testEqual_WhenOneHasLongLatOtherOneHaveNot_ShouldNotEqual(){
        performNotEqualTestWithLocationProperties("H", secondName: "H", firstLongLat: (1.0,1.0), secondLongLat: nil)
    }
    
    func testEqual_WhenTwoLocationHasDiffrentName_ShouldNotEqual()  {
        performNotEqualTestWithLocationProperties("AB", secondName: "CD", firstLongLat: (0.0,1.1), secondLongLat: (1.2,1.3))
    }
    
    
}
