//
//  ContentView.swift
//  BookwormTutorial
//
//  Created by Danjuma Nasiru on 31/01/2023.
//

import SwiftUI


struct PushBtn : View{
    let title: String
    @Binding var isOn : Bool
    
    var onColors = [Color.red, Color.blue]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View{
        Button(title){
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(colors: isOn ? onColors : offColors, startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}


struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students : FetchedResults<Student>
    
    @State private var rememberMe = false
    
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        VStack{
            
            List(students){student in
                Text(student.name ?? "unknown")
            }
            
            Button("Add"){
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
               
                try? moc.save()
                
                //moc.delete(students[0])
                
            }
            
//            PushBtn(title: "Remember me", isOn: $rememberMe)
//
//            Text(rememberMe ? "on" : "off")
//
//            TextEditor(text: $notes)
//                .padding(.horizontal, 5)
//                .border(LinearGradient(colors: [.red, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing), width: 2)
//                .frame( height: 200)
//                .padding()
//                .navigationTitle("Notes")
                
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
