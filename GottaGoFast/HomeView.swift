//
//  HomeView.swift
//  GottaGoFast
//
//  Created by Erik Luu on 7/23/21.
//

import MapKit
import SwiftUI

struct HomeView: View {
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some View {
        
        VStack {
            AppHome()
            ButtonLayout(viewRouter: viewRouter)
            
        }
    }
}

struct AppHome: View {
    
    var body: some View {
        
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.all)
            
        }
    }
}

struct ButtonLayout: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        HStack {
            
            Spacer()
            
            Button(action: {
                .
                
            }) {
                Image(systemName: "play.fill").foregroundColor(.blue).padding(-15.0).font(.system(size: 30))
                
                
            }.buttonStyle(GrowingButton())
            
            Spacer()
            
            Button(action: {
                viewRouter.currentPage = .page3
                
            }) {
                Image(systemName: "list.bullet").foregroundColor(.blue).padding(-15.0).font(.system(size: 30))
                
            }.buttonStyle(GrowingButton())
            
            Spacer()
            
            Button(action: {
                viewRouter.currentPage = .page4
                
            }) {
                Image(systemName: "gear").foregroundColor(.blue).padding(-15.0).font(.system(size: 30))
            }.buttonStyle(GrowingButton())
            
            Spacer()
            
        }
    }
}

struct MapView: UIViewRepresentable {
    
    var locationManager = CLLocationManager()
    func setupManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        setupManager()
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.black)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewRouter: ViewRouter())
    }
}
