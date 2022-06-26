//
//  ContentView.swift
//  swiftui-core-data
//
//  Created by Ali Eren Çelebi on 25.06.2022.
//

import SwiftUI
import CoreData
struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Student.entity(), sortDescriptors: [])
    var students: FetchedResults<Student>
    
    @State var showStudent = false
    var body: some View {
        NavigationView{
            List {
                ForEach(students){ student in
                    HStack{
                        VStack(alignment: .leading){
                            NavigationLink(destination: DetailView(firstName: student.firstName!, lastName: student.lastName!, age: Int(student.age)), label: {
                                Text("\(student.firstName!) \(student.lastName!)")
                            })
                          
                        }
                    }
                    
                }
                .onDelete{ indexSet in
                    for index in indexSet {
                        viewContext.delete(students[index])
                    }
                    do {
                        try viewContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }
            
            }.navigationTitle("Students")
                .navigationBarItems(trailing: Button(action: {
                    showStudent = true
                }, label: {
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                }))
                .sheet(isPresented: $showStudent){
                    StudentView()
                }
                
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
