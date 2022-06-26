//
//  StudentView.swift
//  swiftui-core-data
//
//  Created by Ali Eren Çelebi on 26.06.2022.
//

import SwiftUI

struct StudentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State var firstName = ""
    @State var lastName = ""
    @State var age = ""
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Student Details")){
                    TextField("First Name", text: $firstName)
                        .keyboardType(.default)
                    TextField("Last Name", text: $lastName)
                        .keyboardType(.default)
                }
                Section(header: Text("Age")){
                    TextField("Age", text: $age)
                        .keyboardType(.default)
                }
                Button(action: {
                    let newStudent = Student(context: viewContext)
                    newStudent.firstName = self.firstName
                    newStudent.lastName = self.lastName
                    newStudent.age = Int16(self.age)!
                    newStudent.id = UUID()
                    do{
                        try viewContext.save()
                        print("Student Saved")
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }){
                    Text("Add Student")
                }
            }
            .navigationTitle("Add Student")
        }
    }
}

struct StudentView_Previews: PreviewProvider {
    static var previews: some View {
        StudentView()
    }
}
