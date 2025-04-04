//
//  NewNoteView.swift
//  Notes
//
//  Created by StudentPM on 4/4/25.
//

import SwiftUI
struct Note{
    var title: String
    var content: String
    
    
}
struct NewNoteView: View {
    @Binding var arrayOfNotes: [Note]
    @State var noteName: String = ""
    @State var note: String = ""

    var body: some View{
//
//        NavigationView{
            VStack{
                TextField("   Title", text: $noteName)
                    .padding()
                    .background(Color(hex: "#f2f2f7"))
                    .font(.title2)
                    .cornerRadius(10)
                    .padding()
                TextEditor(text: $note)
                    .padding()
                    .background(Color(hex: "#f2f2f7"))
                    .cornerRadius(10)
                Button(action: {
                    addingTask()
                }, label: {
                    Text("Add Note")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
                .disabled(noteName.isEmpty)
                .disabled(note.isEmpty)
            }
            .navigationTitle("New Note")
//        }
    }
    func addingTask(){
        let newNote: Note = Note(title: noteName, content: note)
        arrayOfNotes.append(newNote)
    }
}

#Preview {
    NewNoteView(arrayOfNotes: .constant([]))
}
