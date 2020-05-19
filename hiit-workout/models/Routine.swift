//
//  Exercise.swift
//  hiit-workout
//
//  Created by Mitchel Wassler on 5/18/20.
//  Copyright © 2020 Mitchel Wassler. All rights reserved.
//

import Foundation

let catagories = [
    "Upper Body",
    "Back",
    "Core",
    "Cardio"
]

struct Exercise : Identifiable {
    var id = UUID()
    var name : String
    var reps : Int
    var catagory: String
    var barbell = false
}

class Routine {
    var exercises = [
        Exercise(name: "Overhead Press",            reps: 8,  catagory: catagories[0], barbell: true),
        Exercise(name: "Push Ups",                  reps: 10, catagory: catagories[0]),
        Exercise(name: "Dips",                      reps: 6,  catagory: catagories[0]),
        Exercise(name: "Kettlebell Swings",         reps: 6,  catagory: catagories[0]),
        Exercise(name: "Pull Ups",                  reps: 6,  catagory: catagories[1]),
        Exercise(name: "Barbell Rows",              reps: 8,  catagory: catagories[1], barbell: true),
        Exercise(name: "Bodyweight Rows",           reps: 6,  catagory: catagories[1]),
        Exercise(name: "Deadlifts",                 reps: 6,  catagory: catagories[1], barbell: true),
        Exercise(name: "FrontSquats",               reps: 6,  catagory: catagories[1], barbell: true),
        Exercise(name: "Captains Chair Leg Raises", reps: 10, catagory: catagories[2]),
        Exercise(name: "Butterfly Crunches",        reps: 20, catagory: catagories[2]),
        Exercise(name: "Medicine Ball Crunches",    reps: 20, catagory: catagories[2]),
        Exercise(name: "Box Jumps",                 reps: 10, catagory: catagories[3]),
        Exercise(name: "Burpees",                   reps: 10, catagory: catagories[3]),
        Exercise(name: "Jump Rope",                 reps: 50, catagory: catagories[3]),
    ]
    
    func getExerciseForCatagory(_ catId: Int) -> Exercise {
        self.exercises.filter { $0.catagory == catagories[catId] }.randomElement()!
    }
    
    func generate() -> [Exercise] {
        var routine: [Exercise] = []
        for count in 0...3 {
            let exercise = self.getExerciseForCatagory(count)
            routine.append(exercise)
        }
        return routine
    }
    

}
