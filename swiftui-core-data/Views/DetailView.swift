//
//  DetailView.swift
//  swiftui-core-data
//
//  Created by Ali Eren Çelebi on 26.06.2022.
//

import SwiftUI

struct DetailView: View {
    
    var firstName: String
    var lastName: String
    var age: Int
    
    
    var body: some View {
      
        List{

            Section(header: Text("fırst name")){
                Text(self.firstName)
                    .fontWeight(.bold)
                    .font(.system(size:20))
            }
   
        
            Section(header: Text("last name")){
                Text(self.lastName)
                    .fontWeight(.bold)
                    .font(.system(size:20))
            }
            Section(header: Text("age")){
                Text(String(self.age))
                    .fontWeight(.bold)
                    .font(.system(size:20))
            }
            
        }
        .navigationTitle("Student Data")
           
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(firstName: "John", lastName: "Doe", age: 22)
    }
}
