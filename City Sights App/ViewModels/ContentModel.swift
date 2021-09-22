//
//  ContentModel.swift
//  City Sights App
//
//  Created by Colton Shoenberger on 9/20/21.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    
    // Since ContentModel conforms to NSObject, we have to override the NSObject init() function
    override init() {
        
        // We have to first run the NSObject init()
        super.init()
        
        // Set ContentModel as the delegate of the location manager
        locationManager.delegate = self
        
        // Request permission from the user
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    // MARK - Location Manager Delegate Methods
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            
            // We have permission
            // Start geolocating the user, after we get permission
            locationManager.startUpdatingLocation()
            
        }
        else if locationManager.authorizationStatus == .denied {
            // We don't have permission
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Gives us the location of the user
        let userLocation = locations.first
        
        if userLocation != nil {
            
            // We have a location
            // Stop requesting the location after we get it once
            locationManager.stopUpdatingLocation()
            
            // If we have coordinates of the user, send into Yelp API
            // getBusinesses(category: "arts", location: userLocation!)
            getBusinesses(category: "restaurants", location: userLocation!)
        }
        
        // TODO: If we have the coordinates of the user, send into Yelp API
        
    }
    
    // MARK: - Yelp API methods
    
    func getBusinesses(category: String, location: CLLocation) {
        
        // Create URL
        /*
        let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
        let url = URL(string: urlString)
         */
        
        var urlComponents = URLComponents(string: "https://api.yelp.com/v3/businesses/search")
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "6")
        ]
        
        let url = urlComponents?.url
        
        if let url = url {
            
            // Create URL Request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.addValue("Bearer sQrGriAv0XYndmk8pL_AbL3xk5nffZpxCoJhyZX3Yy_mK-M1uRANqK8p81jCcaD5SHbVnLHTPQ-tNLuZYy4jXsGrFHR5goTPWN34md16fp16C7RKCMvWWgknlGxKYXYx", forHTTPHeaderField: "Authorization")
            
            // Get URLSession
            let session = URLSession.shared
            
            // Create dataTask
            let dataTask = session.dataTask(with: request) { data, response, error in
                
                // Check that there isn't an error
                if error == nil {
                    print(response)
                }
                
                
            }
            
            // Start the dataTask
            dataTask.resume()
            
        }
        
        
        
    }
}
