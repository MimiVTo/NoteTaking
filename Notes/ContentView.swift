//
//  ContentView.swift
//  Notes
//
//  Created by StudentPM on 4/3/25.
//

import SwiftUI

struct ContentView: View {
    @State var arrayOfNotes: [Note] = []
    
    var body: some View {
        
        NavigationView{

            VStack{
                if arrayOfNotes.isEmpty{
                    Spacer()
                }
                else{
                    List{
                        ForEach(arrayOfNotes.indices, id: \.self){i in
                            Text("\(arrayOfNotes[i].title)\n\(arrayOfNotes[i].content)")
                        }
                        .onDelete(perform: deleteOne)
                    }
                }
                NavigationLink(destination:{
                    NewNoteView(arrayOfNotes:$arrayOfNotes)
                }){
                    Text("Add Task")
                        .font(.title)
                        .padding()
                        .frame(width:500, height:100)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Notes")
        }
    }
    func deleteOne(offset: IndexSet){
        arrayOfNotes.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
