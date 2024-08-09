//
//  SelectYourSub.swift
//  client 2
//
//  Created by Piyush saini on 09/08/24.
//

import SwiftUI

struct SelectYourSub: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let subscriptions = [
        "netflix", "primevideo", "hulu", "max", "peacock", "disney", "discovery", "youtubetv"
    ]
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                HStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 7)
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 7)
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 7)
                        .foregroundColor(.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.white)
                        )
                }
                .padding(.horizontal)
                
                // Title
                Text("Select Your Subscriptions")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                
                SearchBar()
                    .padding(.vertical, 10)
                
                ScrollView{
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: -20), count: 2), spacing: 20) {
                        ForEach(subscriptions, id: \.self) { subscription in
                            SubscriptionIcon(name: subscription)
                        }
                    }
                    .padding(.horizontal)
                }
                
                HStack(spacing: 20) {
                    Spacer()
                    Button(action: {
                        // Skip action
                    }) {
                        Text("Skip for now")
                            .font(.headline)
                            .frame(width: 100, height: 10)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(.blue)
                                    .foregroundColor(.clear)
                            )
                    }
                    
                    Button(action: {
                        // Next action
                    }) {
                        Text("Next")
                            .font(.headline)
                            .frame(width: 100, height: 10)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(50)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom))
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white) // Set back button color to white
                        Text("Back")
                            .foregroundColor(.white) // Set back button text color to white
                    }
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(.white)
                            .foregroundColor(.clear)
                    )
                }
            }
        }
    }
}

struct SubscriptionIcon: View {
    let name: String
    
    var body: some View {
        VStack {
            Image(name)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
        }
        .frame(width: 150, height: 150)
        .overlay(
            Circle()
                .stroke(.blue, lineWidth: 10)
        )
        .background(Circle().stroke(Color.blue, lineWidth: 8))
        .background(Color.black)
        .cornerRadius(75)
    }
}

struct SearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding([.leading, .trailing])
            TextField("Search for more subscriptions", text: $searchText)
                .frame(height: 15)
                .padding()
                .cornerRadius(10)
                .foregroundColor(.white)
                .autocapitalization(.none)
        }
        .background(Color.black.opacity(0.7))
        .cornerRadius(10)
        .padding(.horizontal, 5)
        .padding(.bottom,3)
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SelectYourSub()
    }
}
