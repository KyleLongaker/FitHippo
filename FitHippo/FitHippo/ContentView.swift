//
//  ContentView.swift
//  FitHippo
//
//  Created by BACS495 on 4/25/22.
//

import SwiftUI

class User: ObservableObject {
    @Published var name = "John Doe"
    @Published var age = 0
    @Published var weight = 0.0
    @Published var height = 0.0
    @Published var sex = 0 // Where female is 0 and male is 1
}


struct SettingsView: View{
    @EnvironmentObject var user: User

    var body: some View {
        VStack{
            Text("Settings")
                .font(.headline)
                .padding(.top, 100)
            
            // Input for calorie goal
            Text("Enter your calorie goal:")
            
            // Text field for calorie goal
            TextField("Calorie Goal", text: .constant(""))
                .padding(.top, 100)

        
            Text("Name: \(user.name)")
            Text("Age: \(user.age)")
            Text("Weight: \(user.weight)")
            Text("Height: \(user.height)")
            Text("Sex: \(user.sex)")
            Text("BMI: \(user.weight / (user.height * user.height))")
            Text("Calories: \(user.weight * 10)")
        }
        .environmentObject(user)
}
}
    

struct ContentView: View {
    @State var weight = 0

    var body: some View {
        // Navigation view for the main page
        NavigationView(){
            VStack{
                // Image view for the main page
                Image("FitHippo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .padding(.top, 100)
                // Text for the main page
                Text("Get Fit. Get Happy.")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 100)
            
                    .padding(.top, 100)

                WeightView()
                    .padding(.top, 100)


                // Navigation Links:
                // 1. Settings Page
                // 2. Running Page
                // 3. Biking Page
                // 4. Swimming Page

                NavigationLink(destination: SettingsView()){
                    Text("Settings")
                }
                .padding(.top, 100)
                NavigationLink(destination: WalkingView()){
                    Text("Walking")
                }
                .padding(.top, 100)
                NavigationLink(destination: RunningView()){
                    Text("Running")
                }
                .padding(.top, 100)
                NavigationLink(destination: CyclingView()){
                    Text("Cycling")
                }
                .padding(.top, 100)
                .navigationBarTitle("FitHippo", displayMode: .inline)
            }
        }
    }
}

struct WeightView: View {
    @State private var weight = ""

    var body: some View {
        VStack{
        // Get weight from user
        Text("Enter your weight: \(weight)")
            .font(.headline)
            .padding(.top, 100)
        // Text field for weight
        TextField("Weight", text: .constant(""))
            .padding(.top, 100)
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.horizontal)

    }
}

struct AboutView: View{

    var body: some View {
        NavigationView{
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 100)

                    TextField("Weight", text: .constant(""))

            }
        }
    }
}

struct WalkingView: View{

    var body: some View {
        NavigationView{
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 100)

                    TextField("Weight", text: .constant(""))

            }
        }
    }
}

struct RunningView: View{

    var body: some View {
        NavigationView{
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 100)

                    TextField("Weight", text: .constant(""))

            }
        }
    }
}

struct CyclingView: View{

    var body: some View {
        NavigationView{
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 100)

                    TextField("Weight", text: .constant(""))

            }
        }
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



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
