//
//  detailNoteView.swift
//  Notes
//
//  Created by StudentPM on 4/3/25.
//

import SwiftUI

struct detailNoteView: View {
    //variable that holds the note thats connected to the struct
    var note: Note
    var body: some View {
//        NavigationView{
            VStack{
                //The inside content of the note
                Text("\(note.content)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                    .frame(width: 350, height:600, alignment: .topLeading)
                    .background(Color(hex:"#f2f2f7"))
                    .cornerRadius(10)
            }
        //Title of the note
            .navigationTitle("\(note.title)")
//        }
    }
}

#Preview {
    detailNoteView(note: Note(title:"",content:""))
}
