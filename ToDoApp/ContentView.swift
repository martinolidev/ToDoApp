//
//  ContentView.swift
//  ToDoApp
//
//  Created by Martin Martinez on 15/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MainView()
        }
        .padding()
    }
}

struct MainView: View {
    //A state property to allow dynamic changes on the date
    @State var currentDate = Date()
    //Colors
    @State var colorPalette: [Color] = [.indigo, .mint, .cyan, .pink, .teal]
    
    @State var todoItems: [String] = ["SwiftUI Practice", "Watch lesson 3 of CS193P"]
    
    var body: some View {
        titleBar
        ScrollView {
            toDoCard.frame(height: 100)
                .foregroundColor(.yellow)
        }
        addButton
    }
    
    var addButton: some View {
        HStack {
            Spacer()
            Button {
                //
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 80, height: 60)
                    .foregroundColor(.indigo)
                    .overlay(
                        Image(systemName: "plus.square.dashed")
                            .foregroundColor(.white)
                            .imageScale(.large)
                            .font(.title)
                            .bold()
                    )
            }
        }
    }
    
    //Add a random color to the added chore
    func getTheColors(from colorPalette: [Color]) -> Color? {
        return colorPalette.randomElement()
    }
    
    var toDoCard: some View {
        Group {
            ForEach(todoItems, id: \.self) {
                index in RoundedRectangle(cornerRadius: 10)
                Text(index).foregroundStyle(.white)
            }
        }
    }
    
    //Formats currentDate using given date format, returns formatted string
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: currentDate)
    }
    
    var titleBar: some View {
        HStack {
            Text("To do")
                .font(.largeTitle)
                .bold()
            Spacer()
            Text(getCurrentDate())
                .font(.title3)
                .bold()
        }
    }
}

#Preview {
    ContentView()
}
