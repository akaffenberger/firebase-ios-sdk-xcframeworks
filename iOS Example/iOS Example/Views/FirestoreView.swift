//
//  FirestoreView.swift
//  iOS Example
//
//  Created by Ashleigh Kaffenberger on 5/16/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseSharedSwift

struct FirestoreView: View {
    @StateObject private var viewModel = FirestoreViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button("Populate") {
                    viewModel.populateRestaurants()
                }
                
                Spacer()
                
                Button("Clear") {
                    viewModel.deleteRestaurants()
                }
            }.padding()
            
            Rectangle()
                .fill(Color.gray)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 1, maxHeight: 1)
            
            List(viewModel.restaurants ?? []) { restaurant in
                RestaurantView(restaurant: restaurant)
            }
        }
    }
    
    private struct RestaurantView: View {
        let restaurant: Restaurant
        
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(restaurant.name)
                    Spacer()
                    Text(restaurant.priceString)
                }
                
                HStack {
                    Text("\(restaurant.category) - \(restaurant.city)").font(.footnote)
                    Spacer()
                    Text("\(Int(restaurant.averageRating))/5").font(.footnote)
                }
                
                Text(restaurant.documentId ?? "").font(.caption2).foregroundColor(.gray)
            }
        }
    }
}

private class FirestoreViewModel: ObservableObject {
    
    @Published var restaurants: [Restaurant]?
    
    private var listener: ListenerRegistration?
    
    init() {
        FirebaseAuth.Auth.auth().signInAnonymously { result, error in
            if let result = result { print(result) }
            if let error = error { print(error) }
            self.observeRestaurants()
        }
    }
    
    func observeRestaurants() {
        listener?.remove()
        listener = Firestore
            .firestore()
            .collection("restaurants")
            .limit(to: 50)
            .addSnapshotListener { [weak self] snapshot, error in
                self?.restaurants = snapshot?.documents.compactMap {
                    do {
                        return try $0.data(as: Restaurant.self)
                    } catch let e {
                        print(e)
                        return nil
                    }
                }
            }
    }
    
    func populateRestaurants() {
        let words = ["Bar", "Fire", "Grill", "Drive Thru", "Place", "Best", "Spot", "Prime", "Eatin'"]
        let cities = Restaurant.cities
        let categories = Restaurant.categories
        let collection = Firestore.firestore().collection("restaurants")
        
        for _ in 0 ..< 20 {
            let randomIndexes = (Int.random(in: 0..<words.count), Int.random(in: 0..<words.count))
            let name = words[randomIndexes.0] + " " + words[randomIndexes.1]
            let category = categories[Int.random(in: 0..<categories.count)]
            let city = cities[Int.random(in: 0..<cities.count)]
            let price = Int.random(in: 0..<3) + 1
            let rating = Float.random(in: 0..<5) + 1
            do {
                let _ = try collection.addDocument(from: Restaurant(
                    name: name,
                    category: category,
                    city: city,
                    price: price,
                    ratingCount: 0,
                    averageRating: rating
                ))
            } catch let e {
                print(e)
            }
        }
    }
    
    func deleteRestaurants() {
        Firestore
            .firestore()
            .collection("restaurants")
            .getDocuments { snapshot, error in
                snapshot?.documents.forEach { document in
                    document.reference.delete()
                }
            }
    }
}

struct Restaurant: Codable, Identifiable {
    @DocumentID var documentId: String?
    let name: String
    let category: String
    let city: String
    let price: Int
    let ratingCount: Int
    let averageRating: Float
    var id: String { "\(name)\(category)\(city)\(documentId ?? "")" }
    var priceString: String {
        switch price {
        case 1: return "$"
        case 2: return "$$"
        default: return "$$$"
        }
    }
    
    static let cities = [
        "Albuquerque", "Arlington", "Atlanta", "Austin", "Baltimore", "Boston",
        "Charlotte", "Chicago", "Cleveland", "Colorado Springs", "Columbus",
        "Dallas", "Denver", "Detroit", "El Paso", "Fort Worth", "Fresno"
    ]
    
    static let categories = [
        "Brunch", "Burgers", "Coffee", "Deli", "Dim Sum", "Indian", "Italian",
        "Mediterranean", "Mexican", "Pizza", "Ramen", "Sushi"
    ]
}
