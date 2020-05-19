//
//  RoutineTests.swift
//  hiit-workoutTests
//
//  Created by Mitchel Wassler on 5/18/20.
//  Copyright © 2020 Mitchel Wassler. All rights reserved.
//

import XCTest
@testable import hiit_workout

class RoutineTests: XCTestCase {
    
    var sut : Routine!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = Routine()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testBuildsRoutine() {
        let routine = sut.generate()
        XCTAssertEqual(routine.count, 4, "Picks 4 exercises")
        
    }
    
    func testGetsOneOfEachCatagory() {
        let routine = sut.generate()
        XCTAssertEqual(routine.filter {$0.catagory == "Back"}.count, 1, "Generates One Back exercise")
        XCTAssertEqual(routine.filter {$0.catagory == "Core"}.count, 1, "Generates One Core exercise")
        XCTAssertEqual(routine.filter {$0.catagory == "Cardio"}.count, 1, "Generates One Cardio exercise")
        XCTAssertEqual(routine.filter {$0.catagory == "Upper Body"}.count, 1, "Generates One Upper Body exercise")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
