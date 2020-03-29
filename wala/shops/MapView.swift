//
//  MapView.swift
//  wala
//
//  Created by Roland Michelberger on 28.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI
import MapKit

class ShopAnnotation: MKPointAnnotation {
    let shop: Shop
    
    init(shop: Shop) {
        self.shop = shop
    }
}

struct MapView: UIViewRepresentable {
    
    
    //    @Binding
    var shops: [Shop]
    @Binding var isActive: Bool
    @Binding var selectedShop: Shop?
    
    private let locationManager = CLLocationManager()
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(self)
    }
    
    
    func makeUIView(context: Context) -> MKMapView{
        let mapView = MKMapView(frame: .zero)
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        view.delegate = context.coordinator
        
        
        if let shop = shops.first {
            let region = MKCoordinateRegion(center: shop.coordinates, latitudinalMeters: 50, longitudinalMeters: 50)
            view.setRegion(region, animated: true)
        }
        
        view.removeAnnotations(view.annotations)
        
        for shop in shops {
            let annotation = ShopAnnotation(shop: shop)
            annotation.title = shop.name
            annotation.coordinate = shop.coordinates
            view.addAnnotation(annotation)
        }
        
        //        let status = CLLocationManager.authorizationStatus()
        
        //        if status == .authorizedAlways || status == .authorizedWhenInUse {
        //            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        //            locationManager.startUpdatingLocation()
        //            let location: CLLocationCoordinate2D = locationManager.location!.coordinate
        //            let span = MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)
        //            let region = MKCoordinateRegion(center: location, span: span)
        //            view.setRegion(region, animated: true)
        //        }
    }
    
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        
        var mapViewController: MapView
        
        init(_ control: MapView) {
            self.mapViewController = control
        }
        
        //        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        //            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
        //            polylineRenderer.strokeColor = UIColor.systemBlue
        //            polylineRenderer.lineWidth = 5
        //            return polylineRenderer
        //        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            if let cluster = annotation as? MKClusterAnnotation {
                let markerAnnotationView = MKMarkerAnnotationView()
                markerAnnotationView.glyphText = String(cluster.memberAnnotations.count)
                markerAnnotationView.markerTintColor = UIColor.white
                markerAnnotationView.canShowCallout = false
                
                return markerAnnotationView
            }
            
            guard let shopAnnotation = annotation as? ShopAnnotation else { return nil }
            
            let identifier = "Annotation"
            var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
            
            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.clusteringIdentifier = identifier
                annotationView?.markerTintColor = shopAnnotation.shop.category.color
                annotationView?.tintColor = shopAnnotation.shop.category.color
                
            } else {
                annotationView?.annotation = annotation
                annotationView?.markerTintColor = shopAnnotation.shop.category.color
                annotationView?.tintColor = shopAnnotation.shop.category.color
            }
            
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            guard let shopAnnnotation = view.annotation as? ShopAnnotation else { return }
            
            mapViewController.isActive = true
            mapViewController.selectedShop = shopAnnnotation.shop
        }
        
    }
}
