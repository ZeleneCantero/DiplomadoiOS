//
//  PizzaLocationViewController.swift
//  pizzaApp
//
//  Created by Diplomado on 25/01/25.
//

import UIKit
import MapKit

class PizzeriaLocationViewController: UIViewController {
    
    private let pizzeriaCoordinates: CLLocationCoordinate2D
    let locationManager = CLLocationManager()
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.showsUserLocation = true
        mapView.delegate = self
        return mapView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var confinguration = UIButton.Configuration.borderedProminent()
        confinguration.title = "Close"
        button.configuration = confinguration
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        

        return button
    }()
    
    private lazy var directionsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        var confinguration = UIButton.Configuration.borderedProminent()
        confinguration.title = "Location"
        button.configuration = confinguration
        button.addTarget(self, action: #selector(directionsButtonTapped), for: .touchUpInside)
        return button
    }()

    
    init(pizza: CLLocationCoordinate2D) {
        pizzeriaCoordinates = pizza
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        showPizzeriaLocationOnMap()
        showUserLocationOnMap()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        view.addSubview(directionsButton)
        NSLayoutConstraint.activate([
            directionsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            directionsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

    private func showUserLocationOnMap() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        guard let userLocation = locationManager.location?.coordinate else { return }

        let userAnnotation = MKPointAnnotation()
        userAnnotation.coordinate = userLocation
        userAnnotation.title = "Tú estás aquí"
        
        mapView.addAnnotation(userAnnotation)

        let region = MKCoordinateRegion(center: userLocation,
                                        span: MKCoordinateSpan(latitudeDelta: 0.01,
                                                               longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
    }

    
    private func showPizzeriaLocationOnMap() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = pizzeriaCoordinates
        mapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: pizzeriaCoordinates, latitudinalMeters: 0, longitudinalMeters: 0)
        mapView.setRegion(region, animated: true)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func directionsButtonTapped() {
        getDirections()
    }
    
    private func getDirections() {
        guard let userLocation = mapView.userLocation.location?.coordinate else { return }
        
        let directionsRequest = MKDirections.Request()
        directionsRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: userLocation))
        directionsRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: pizzeriaCoordinates))
        directionsRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionsRequest)
        
        directions.calculate { [weak self] response, error in
            guard let route = response?.routes.first else {
                if let error = error {
                    print("Error getting directions: \(error.localizedDescription)")
                }
                return
            }
            self?.mapView.addOverlay(route.polyline)
            self?.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
        }
    }
}

extension PizzeriaLocationViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .systemIndigo
        renderer.lineWidth = 5.0
        return renderer
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        
        if annotation.title == "Tú estás aquí" {
            let identifier = "UserAnnotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true  // Permitir mostrar información emergente
                annotationView?.image = UIImage(systemName: "person.fill") // Ícono de monito
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }

        let identifier = "PizzeriaAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.glyphImage = UIImage(systemName: "storefront.fill")
            annotationView?.markerTintColor = .red
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }

}
