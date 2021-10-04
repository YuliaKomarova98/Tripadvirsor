//
//  TAPresenterDelegate.swift
//  Tripadvisor
//
//  Created by Yulia on 03.10.2021.
//

import Foundation

protocol TAPresenterDelegate: AnyObject {
    func fetchDataDidStart()
    func fetchDataDidEnd()
    func updateUI()
}
