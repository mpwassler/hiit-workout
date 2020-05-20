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
            Spacer()
            controls
        }.onAppear {
            let routine = Routine()
            self.exercises = routine.generate()
            let clock = CountDown(minutes: 5, seconds: 0) 
            clock.start { clock in
                    
            }
        }
    }
    
    private var controls: some View {
      return AnyView( HStack {
        Button(action: startWorkout) {
            Text("Start Workout")
        }
      }.padding())
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
           .overlay(
              RoundedRectangle(cornerRadius: 8)
                  .stroke(Color.black, lineWidth: 1)
          ).padding()
          
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
