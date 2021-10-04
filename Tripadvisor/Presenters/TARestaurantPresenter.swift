//
//  BRMainPresenter.swift
//  BottleRocket
//
//  Created by Yulia on 22.09.2021.
//

import Foundation

class TARestaurantPresenter {
    
    var numberOfRows: Int {
        return restaurantList.count
    }
    var restaurantList: [Restaurant] = []
    weak var view: TAPresenterDelegate?
    
    func fetchData() {
        view?.fetchDataDidStart()
        TANetworkManager.fetchData() { restaurant, error in
            self.view?.fetchDataDidEnd()
            guard let restaurant = restaurant else { return }
            self.restaurantList = restaurant
            self.view?.updateUI()
        }
    }
    
    func cellModelForRow(_ row: Int) -> Restaurant? {
        guard restaurantList.indices.contains(row) else { return nil }
        return restaurantList[row]
    }
}
