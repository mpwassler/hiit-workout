//
//  ClockTests.swift
//  hiit-workoutTests
//
//  Created by Mitchel Wassler on 5/19/20.
//  Copyright © 2020 Mitchel Wassler. All rights reserved.
//

import XCTest
@testable import hiit_workout

class CountDownTests: XCTestCase {
    
    var sut : Clock!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = CountDown(minutes: 5, seconds: 0)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testStartsTimer() {
        sut.start { time in
            XCTAssertEqual(time, "05:00", "Displays the time in the correct format")
        }
    }
    
    func testCountsDown() {
        var timestring = ""
        let expectation = XCTestExpectation(description: "timer has run")
        sut.start { timestring = $0 }
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
            XCTAssertEqual(timestring, "04:55", "Counts down the time correctly")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 6)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
