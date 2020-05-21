//
//  ContentView.swift
//  hiit-workout
//
//  Created by Mitchel Wassler on 5/18/20.
//  Copyright © 2020 Mitchel Wassler. All rights reserved.
//

import SwiftUI
import AVFoundation


struct WorkoutView: View {
    @State var exercises : [Exercise]?
    @State var timeLeft = "05:00"
    @State var set = 1
    @State var isStarted = false
    @State var isResting = false
    let totalSets = 3
    
    var clock = CountDown(minutes: 5, seconds: 0)
    
    func startRest() -> Void {
        isResting = true
        clock.start (onUpdate: { timeString in
            self.timeLeft = timeString
        }) {
            AudioServicesPlaySystemSound(SystemSoundID(1020))
            self.clock.reset()
            self.isResting = false
            self.set += 1
            self.startWorkout()
        }
    }
    
    func startWorkout() -> Void {
        isStarted = true
        clock.start (onUpdate: { timeString in
            self.timeLeft = timeString
        }) {
            AudioServicesPlaySystemSound(SystemSoundID(1322))
            if self.set <= self.totalSets {
                self.clock.reset()
                self.startRest()
            }
        }
    }
    
    func pauseWorkout() -> Void {
        isStarted = false
        clock.stopTimer()
    }
    
    var body: some View {
        ZStack {
             Color(red: 38 / 255, green: 38 / 255, blue: 38 / 255)
                 .edgesIgnoringSafeArea(.all)
             VStack {
                 stopWatch
                 listDispay
                 Spacer()
                 controls
             }.onAppear {
                 let routine = Routine()
                 self.exercises = routine.generate()
             }.onDisappear {
                self.clock.stopTimer()
                self.timeLeft = "05:00"
                self.clock.reset()
                self.set = 1
                self.isStarted = false
                self.isResting = false
             }
         }
         .navigationBarTitle("", displayMode: .inline)
         
    }
    
    private var stopWatch: some View {
      return AnyView( HStack {
        Text(isResting ? "Rest" : "Set \(set) / \(totalSets)")
            .font(.title)
            .foregroundColor(Color.white)
        Spacer()
        Text(timeLeft)
            .font(.title)
            .foregroundColor(Color.white)
      }.padding()
        .background(
            Color.black
              .edgesIgnoringSafeArea(.all)
        )
      )
    }
    
    private var controls: some View {
      return AnyView( HStack {
        if isStarted {
            Button(action: { self.pauseWorkout() }) {
                Image(systemName: "pause.fill")
                .frame(width: 100, height: 100)
                .foregroundColor(Color.white)
                .background(Color.black)
                .clipShape(Circle())
            }
        } else {
            Button(action: { self.startWorkout() }) {
                Image(systemName: "play.fill")
                .frame(width: 100, height: 100)
                .foregroundColor(Color.white)
                .background(Color.black)
                .clipShape(Circle())
            }
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
                Text(item.name)
                    .font(.title)
                    .foregroundColor(Color.white)
                Text(item.catagory)
                    .font(.subheadline)
                    .foregroundColor(Color.white)
            }
            Spacer()
            Text("\(item.reps)")
                .foregroundColor(Color.white)
          }.padding()
          Divider()
          .frame(height: 1)
          .background(Color.black)
        })
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 38 / 255, green: 38 / 255, blue: 38 / 255)
                    .edgesIgnoringSafeArea(.all)
                NavigationLink(
                  destination: WorkoutView()) {
                    Text("Go")
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .clipShape(Circle())
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
