//
//  ContentView.swift
//  City Sights App
//
//  Created by Colton Shoenberger on 9/20/21.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        // Detect the authorization of geolocation the user
        
        if model.authorizationState == .notDetermined {
            
            // If undetermined, show onboarding
            OnboardingView()
            
        }
        else if model.authorizationState == CLAuthorizationStatus.authorizedAlways || model.authorizationState == CLAuthorizationStatus.authorizedWhenInUse {
            
            // If approved, show HomeView
            HomeView()
        }
        else {
            
            // If denied, show DeniedView
            LocationDeniedView()
        }
        
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
