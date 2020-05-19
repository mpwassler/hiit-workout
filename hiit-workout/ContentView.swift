//
//  ContentView.swift
//  hiit-workout
//
//  Created by Mitchel Wassler on 5/18/20.
//  Copyright © 2020 Mitchel Wassler. All rights reserved.
//

import SwiftUI

func startWorkout() -> Void {
    
}

struct WorkoutView: View {
    @State var exercises : [Exercise]?
    
    var body: some View {
        VStack {
            listDispay
        }.onAppear {
            let routine = Routine()
            self.exercises = routine.generate()
        }
    }
    
    private var listDispay: some View {
        guard let exercises = self.exercises else {
            return AnyView(EmptyView())
        }
        return AnyView( ForEach(exercises) { item in
          HStack {
            VStack(alignment: .leading) {
                Text(item.name).font(.title)
                Text(item.catagory).font(.subheadline)
            }
            Spacer()
            Text("\(item.reps)")
          }.padding()
          
        })
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
          NavigationLink(
            destination: WorkoutView()) {
              Text("Start")
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
