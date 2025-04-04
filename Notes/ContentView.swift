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
                VStack{
                    if arrayOfNotes.isEmpty{
                        Spacer()
                    }
                    else{
                        List{
                            ForEach(arrayOfNotes.indices, id: \.self){i in
                                NavigationLink(destination: {
                                    detailNoteView(note: arrayOfNotes[i])
                                }){
                                    Text("\(arrayOfNotes[i].title)\n\(arrayOfNotes[i].content)")
                                }
                            }
                
                            .onDelete(perform: deleteOne)
                        }
                    }
                }
                VStack{
                    Spacer()
                    NavigationLink(destination:{
                        NewNoteView(arrayOfNotes:$arrayOfNotes)
                    }){
                        Text("Add Task")
                            .padding()
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width:500, height:100)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    .background(.blue)
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
