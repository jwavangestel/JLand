//
//  ContentView.swift
//  JLand
//
//  Created by Jan van gestel on 18/03/2021.
//

import SwiftUI

struct ContentView: View {
    let jsonData = """
        {   "status"        : "Success",
            "statusCode"    : 123,
            "document"      :
               {
                "count" : 1,
                "profiles" :
                    [
                        {
                            "name" : "Haneef",
                            "email": "haneef@gmail.com"
                        }
                    ]
                }
        }
    """

    struct Response: Codable {
        var status: String
        var statusCode: Int
        var document: Document
    }

    // MARK: - Document
    struct Document: Codable {
        var count: Int
        var profiles: [Profile]
    }

    // MARK: - Profile
    struct Profile: Codable {
        var name, email: String
    }
    
   
    
    var body: some View {
        VStack {

            
            Button("Decode json") {
  
                let data = Data(jsonData.utf8 )
                let decoder = JSONDecoder()
                

                if let response = try? decoder.decode(Response.self, from: data) {
                    print("status       : ", response.status)
                    print("statuscode   :" , response.statusCode)
                    print("document -> profiles -> name : ", response.document.profiles[0].name)
                    print(response.document.profiles[0].email)
                }

            }
            Text("aap")
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
