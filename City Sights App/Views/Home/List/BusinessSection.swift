//
//  BusinessSection.swift
//  City Sights App
//
//  Created by Colton Shoenberger on 9/23/21.
//

import SwiftUI

struct BusinessSection: View {
    
    var title: String
    var businesses: [Business]
    
    var body: some View {
        
        Section (header: BusinessSectionHeader(title: title)){
            ForEach(businesses) { business in
                
                NavigationLink {
                    BusinessDetail(business: business)
                } label: {
                    BusinessRow(business: business)
                }

                
            }
        }
    }
}


