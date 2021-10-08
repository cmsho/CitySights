//
//  BusinessTitle.swift
//  City Sights App
//
//  Created by Colton Shoenberger on 10/3/21.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        
        VStack (alignment: .leading) {
            // Business name
            Text(business.name!)
                .font(.title2)
                .bold()
            
            // Address

            if business.location?.displayAddress != nil {
                ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                    Text(displayLine)
                }
            }
            
            
            // Rating
            Image("regular_\(business.rating ?? 0.0)")
        }
        
    }
}

/*
struct BusinessTitle_Previews: PreviewProvider {
    static var previews: some View {
        BusinessTitle()
    }
}
*/
