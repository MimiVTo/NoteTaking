//
//  detailNoteView.swift
//  Notes
//
//  Created by StudentPM on 4/3/25.
//

import SwiftUI

struct detailNoteView: View {
    var note: Note
    var body: some View {
        NavigationView{
            VStack{
                Text("\(note.content)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                    .frame(width: 350, height:650)
                    .background(Color(hex:"#f2f2f7"))
                    .cornerRadius(10)
            }
            .navigationTitle("\(note.title)")
        }
    }
}

#Preview {
    detailNoteView(note: Note(title:"",content:""))
}
