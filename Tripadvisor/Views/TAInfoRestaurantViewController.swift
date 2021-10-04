//
//  BRInfoRestaurantViewController.swift
//  BottleRocket
//
//  Created by Yulia on 27.09.2021.
//

import UIKit
import MapKit

class TAInfoRestaurantViewController: UIViewController {
    
    var info:Restaurant!
    let mapView = MKMapView()
    let name = UILabel()
    let category = UILabel()
    let address = UILabel()
    let formattedPhone = UILabel()
    let twitter = UILabel()
    let facebook = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        createLabels()
        addMap()
    }
    
    func createLabels() {
        view.addSubview(name)
        name.addSubview(category)
        category.addSubview(address)
        address.addSubview(formattedPhone)
        formattedPhone.addSubview(twitter)
        twitter.addSubview(facebook)

        name.text = info.name
        name.textAlignment = .center
        name.numberOfLines = 0
        name.font = .boldSystemFont(ofSize: 25)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true

//        category.text = "Category: \(info.category)"
        category.text = ("\(TAStrings.category.localized) \(info.category)")
        category.translatesAutoresizingMaskIntoConstraints = false
        category.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        category.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        category.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20).isActive = true
        
        
//        address.text = "Address: \(info.formattedAddress)"
        address.text = "\(TAStrings.address.localized) \(info.formattedAddress)"
        address.numberOfLines = 0

        address.translatesAutoresizingMaskIntoConstraints = false

        address.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        address.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        address.topAnchor.constraint(equalTo: category.bottomAnchor, constant: 20).isActive = true

        if let phone = info.phone {
//            formattedPhone.text = "Phone number: \(phone)"
            formattedPhone.text = "\(TAStrings.phoneNumber.localized) \(phone)"
        } else {
            formattedPhone.text = nil
        }
        formattedPhone.translatesAutoresizingMaskIntoConstraints = false
        formattedPhone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        formattedPhone.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        formattedPhone.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 20).isActive = true

        if let twitterInfo = info.twitter {
            twitter.text = "Twitter: \(twitterInfo)"
        } else {
            twitter.text = nil
        }
        twitter.translatesAutoresizingMaskIntoConstraints = false
        twitter.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        twitter.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        twitter.topAnchor.constraint(equalTo: formattedPhone.bottomAnchor, constant: 20).isActive = true

        if let facebookInfo = info.facebook {
            facebook.text = "Facebook: \(facebookInfo)"
        } else {
            facebook.text = nil
        }
        facebook.translatesAutoresizingMaskIntoConstraints = false
        facebook.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        facebook.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        facebook.topAnchor.constraint(equalTo: twitter.bottomAnchor, constant: 20).isActive = true
    }
    
    func addMap() {
        facebook.addSubview(mapView)
        
        let coordinate = CLLocationCoordinate2D(latitude: info.lat, longitude: info.lng)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        
        pin.coordinate = CLLocationCoordinate2D(latitude: info.lat, longitude: info.lng)
        pin.title = info.name
        mapView.addAnnotation(pin)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        mapView.topAnchor.constraint(equalTo: facebook.bottomAnchor, constant: 20).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
//        return NSLocalizedString(self, comment: "")
    }
}
