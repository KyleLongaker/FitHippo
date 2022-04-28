//
//  ContentView.swift
//  FitHippo
//
//  Created by BACS495 on 4/25/22.
//

import SwiftUI
    

struct ContentView: View {
    @EnvironmentObject var user: User
    
    func checkData() -> Bool {
        if user.weight <= 30 || user.height <= 15 || user.age <= 1 {
        return true
      }
    
    return false
        
    }

    var body: some View {
        // Navigation view for the main page
        NavigationView(){
            VStack{
                // Image view for the main page
                // Text for the main page
                
                Text("FitHippo")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Get Fit. Get Happy.")
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                
                Image("hippo")
                    .resizable()
                    .scaledToFit()

                HStack{
                    NavigationLink(destination: SettingsView()){
                        Text("Settings")
                    }
                    NavigationLink(destination: AboutView()){
                        Text("About")
                    }
                }
                
                HStack{
                    NavigationLink(destination: WalkingView()){
                        Text("Walking")
                    }.disabled(checkData())
                    NavigationLink(destination: RunningView()){
                        Text("Running")
                    }.disabled(checkData())
                    NavigationLink(destination: CyclingView()){
                        Text("Cycling")
                    }.disabled(checkData())
                }

                // Navigation Links:
                // 1. Settings Page
                // 2. Running Page
                // 3. Biking Page
                // 4. Swimming Page
                
                .navigationBarTitle("FitHippo", displayMode: .inline)
            }
        }
    }
}


struct SettingsView: View{
    @EnvironmentObject var user: User

    var body: some View {
        VStack{
            Text("Settings")
                .font(.headline)
                .padding(.top, 100)
        
        // Input for weight
            Form{
                HStack{
                    Stepper("Your weight (pounds)", onIncrement: {
                        user.weight += 1
                                }, onDecrement: {
                                    user.weight -= 1
                                })
                    Text("\(user.weight)")
                }.padding(.horizontal)
                
                // Input for height
                HStack{
                    Stepper("Your height (inches)", onIncrement: {
                        user.height += 1
                                }, onDecrement: {
                                    user.height -= 1
                                })
                    Text("\(user.height)")
                }.padding(.horizontal)
            
                // Input for age
                HStack{
                    Stepper("Your age (years)", onIncrement: {
                        user.age += 1
                                }, onDecrement: {
                                    user.age -= 1
                                })
                    Text("\(user.age)")
                }.padding(.horizontal)
                
            
            if user.weight <= 30 || user.height <= 15 || user.age <= 1 {
                Text("Please input correct data. Expecting weight >= 30 pounds, height >= 15 inches and age >= 1 year.")
              }

                Text("\n\n\nPlease note that we do not collect user data.")
                    .font(.caption2)
            }.navigationBarTitle("Settings")
            
            
//            Text("Age: \(user.age)")
//            Text("Weight: \(user.weight)")
//            Text("Height: \(user.height)")
//            Text("Sex: \(user.sex)")
//            Text("BMI: \(user.weight / (user.height * user.height))")
//            Text("Calories: \(user.weight * 10)")
        }
        .environmentObject(user)
    }
}

struct AboutView: View{

    var body: some View {
        let description = "This is an about screen."
        let version = 1.0
        NavigationView{
            VStack {
                Text("About the dev:")
                Text(description).font(.callout).padding(.horizontal, 50)
                Text("")
                Text("Version info:")
                Text("Up to date (v \(version))").font(.callout).padding(.horizontal, 50)
                Text("Last Updated: 4/27/2022").font(.callout).padding(.horizontal, 50)
            }
        }.navigationBarTitle("About", displayMode: .inline)
    }
}


// Create excersize views
// Every view should have
// 1. A title
// 2. A body description of the excersize
// 3. A picture of the excersize
// 4. A text timer displaying the time left
// 5. A selector for the number of minutes to do the excersize
// 6. A text field for the number of calories burnt
// 7. A button to start the excersize

struct WalkingView: View{
    
    @EnvironmentObject var user: User
    
    var times = ["10", "15", "30"]
    @State private var selectedTime = "10"
    @State private var showAlert = false
    @State private var calories = 0.0

    var body: some View {
        NavigationView{
            VStack {
                Text("Walk like a hippo!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image("run").resizable().scaledToFit()
                
                Picker("Select a workout time (minutes)", selection: $selectedTime) {
                    ForEach(times, id: \.self) {
                        Text($0)
                    }
                }
                
                // Due to time constraints the actual number of
                // calories burned has not been implemented.
                
                Button("Calculate") {
                    showAlert = true
                    calories=(((Double.random(in: 2...10)*(Double(user.weight)*0.45))*3.5)/200)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("At the end of your \(selectedTime) walk... "),
                        message: Text("You will have burned \(calories) calories.")
                    )
                }
            }
        }
    }
}

struct RunningView: View{
    
    @EnvironmentObject var user: User
    
    var times = ["10", "15", "30"]
    @State private var selectedTime = "10"
    @State private var showAlert = false
    @State private var calories = 0.0

    var body: some View {
        NavigationView{
            VStack {
                Text("Run like a hippo!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image("run").resizable().scaledToFit()
                
                Picker("Select a workout time (minutes)", selection: $selectedTime) {
                    ForEach(times, id: \.self) {
                        Text($0)
                    }
                }
                
                // Due to time constraints the actual number of
                // calories burned has not been implemented.
                
                Button("Calculate") {
                    showAlert = true
                    calories=(((Double.random(in: 5...23)*(Double(user.weight)*0.45))*3.5)/200)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("At the end of your \(selectedTime) run... "),
                        message: Text("You will have burned \(calories) calories.")
                    )
                }
            }
        }
    }
}

struct CyclingView: View{
    
    @EnvironmentObject var user: User
    
    var times = ["10", "15", "30"]
    @State private var selectedTime = "10"
    @State private var showAlert = false
    @State private var calories = 0.0

    var body: some View {
        NavigationView{
            VStack {
                Text("Cycle like a hippo!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image("bike").resizable().scaledToFit()
                
                Picker("Select a workout time (minutes)", selection: $selectedTime) {
                    ForEach(times, id: \.self) {
                        Text($0)
                    }
                }
                
                // Due to time constraints the actual number of
                // calories burned has not been implemented.
                
                Button("Calculate") {
                    showAlert = true
                    calories=(((Double.random(in: 3.5...16)*(Double(user.weight)*0.45))*3.5)/200)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("At the end of your \(selectedTime) cycle... "),
                        message: Text("You will have burned \(calories) calories.")
                    )
                }
            }
        }
    }
}

// Define globals

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView().environmentObject(User())
    }
}

class User: ObservableObject {
    @Published public var name = "John Doe"
    @Published public var age = 36
    @Published public var weight = 181
    @Published public var height = 162
}
