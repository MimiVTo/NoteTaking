//
//  NewNoteView.swift
//  Notes
//
//  Created by StudentPM on 4/4/25.
//

import SwiftUI
struct Note{
    //How it connects together, variables to hold onto the title and contents to be appended like the dictionary one
    var title: String
    var content: String
}
struct NewNoteView: View {
    // THE VARIABLES -----------------
    @Binding var arrayOfNotes: [Note]
    @State var noteName: String = ""
    @State var note: String = ""

    var body: some View{
//
//        NavigationView{
            VStack{
                //The text field for the user to put a title for the note
                TextField("   Title", text: $noteName)
                //design part
                    .padding()
                    .background(Color(hex: "#f2f2f7"))
                    .font(.title2)
                    .cornerRadius(10)
                    .padding()
                //content inside of the note
                TextEditor(text: $note)
                    .padding()
                    .background(Color(hex: "#f2f2f7"))
                    .cornerRadius(10)
                //button to add it
                Button(action: {
                    addingTask()
                }, label: {
                    Text("Add Note")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
                //Extra credit #2 --------------
                .disabled(noteName.isEmpty)
                .disabled(note.isEmpty)
            }
            .navigationTitle("New Note")
//        }
    }
    func addingTask(){
        //Adds the task using the note struct
        let newNote: Note = Note(title: noteName, content: note)
        arrayOfNotes.append(newNote)
    }
}

#Preview {
    NewNoteView(arrayOfNotes: .constant([]))
}
