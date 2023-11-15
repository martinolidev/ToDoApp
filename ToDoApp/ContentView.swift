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
    
    //Formats currentDate using given date format, returns formatted string
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: currentDate)
    }
    
    var body: some View {
        titleBar
        ScrollView {
            toDoCard
        }
    }
    
    var toDoCard: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.indigo)
                .frame(height: 70)
            Text("Ejemplo 1")
                .foregroundStyle(Color(.white))
                .font(.title)
                .bold()
                .padding()
        }
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
