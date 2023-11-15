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
    @State var newItem = ""
    @State var todoItems: [String] = []
    @State var showAlert: Bool = false
    
    var body: some View {
        titleBar
        if todoItems.isEmpty {
            placeHolder
        } else {
            Text("Tap to remove").bold()
            ScrollView {
                toDoCardContainer
            }
        }
        addButton
    }
    
    var placeHolder: some View {
        VStack {
            Spacer()
            Text("Add something!")
                .font(.largeTitle)
                .bold()
            Spacer()
        }
    }
    
    var addButton: some View {
        HStack {
            TextField("Tell me something magical!", text: $newItem)
                .textCase(nil)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
            Button {
                if !newItem.isEmpty {
                    todoItems.append(newItem)
                    newItem = ""
                } else {
                    showAlert.toggle()
                }
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 80, height: 60)
                    .foregroundColor(.black)
                    .overlay(
                        Image(systemName: "plus.square.dashed")
                            .foregroundColor(.white)
                            .imageScale(.large)
                            .font(.title)
                            .bold()
                    )
            }
        }
        .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Empty Field!"),
                            message: Text("Please enter something in the field."),
                            dismissButton: .default(Text("Ok"))
                        )
                    }
    }
    
    var toDoCardContainer: some View {
        Group {
            ForEach(0..<todoItems.count, id: \.self) {
                index in todoCard(content: todoItems[index]).onTapGesture(perform: {
                    todoItems.remove(at: index)
                })
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

struct todoCard: View {
    //Colors
    @State var colorPalette: [Color] = [.indigo, .mint, .cyan, .pink, .teal, .orange, .purple, .green]
    
    //Add a random color to the added chore
    func getTheColors(from colorPalette: [Color]) -> Color? {
        return colorPalette.randomElement()
    }
    
    let content: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 70)
                .foregroundColor(getTheColors(from: colorPalette))
            Text(content)
                .foregroundStyle(.white)
                .font(.title2)
                .padding()
                .bold()
        }
    }
}

#Preview {
    ContentView()
}
