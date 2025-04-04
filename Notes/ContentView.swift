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
        //Starts off in this navigation view which affects other ones
        NavigationView{

            VStack{
                VStack{
                    if arrayOfNotes.isEmpty{
                        //empty because it's not gonna show anything
                    }
                    else{
                        //Once there's something in the list, this list shows up
                        List{
                            ForEach(arrayOfNotes.indices, id: \.self){i in
                                NavigationLink(destination: {
                                    //links to show a detailed note view, basically easier to see
                                    detailNoteView(note: arrayOfNotes[i])
                                }){
                                    //The note title and note inside like the content
                                    Text("\(arrayOfNotes[i].title)\n\(arrayOfNotes[i].content)")
                                }
                            }
                            //Little thing I added for fun
                            .onDelete(perform: deleteOne)
                        }
                    }
                }
                VStack{
                    //Spacer to add some space between the list and the button
                    Spacer()
                    NavigationLink(destination:{
                        //sends them to make a new note
                        NewNoteView(arrayOfNotes:$arrayOfNotes)
                    }){
                        Text("Add Task")
                        //label with the design
                            .padding()
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width:500, height:100)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    //No empty space below
                    .background(.blue)
                }
            }
            //title of page
            .navigationTitle("Notes")
        }
    }
    func deleteOne(offset: IndexSet){
        //Deleting function for fun
        arrayOfNotes.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
