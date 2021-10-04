//
//  BRRestaurantsViewController.swift
//  BottleRocket
//
//  Created by Yulia on 30.09.2021.
//

import UIKit

class TARestaurantsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var activityView: UIActivityIndicatorView?
    var presenter = TARestaurantPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Restaurants"
        presenter.view = self
        collectionView.register(UINib(nibName: TAConstants.TACellCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: TAConstants.TACellCollectionViewCell)
        presenter.fetchData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TAInfoRestaurantViewController, let indexPath = sender as? IndexPath {
            vc.info = presenter.restaurantList[indexPath.row]
        }
    }
}

extension TARestaurantsViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: TAConstants.toDetailsViewSegue, sender: indexPath)
    }
}

extension TARestaurantsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TAConstants.TACellCollectionViewCell, for: indexPath)
        (cell as? TACellCollectionViewCell)?.model = presenter.cellModelForRow(indexPath.row)
        return cell
    }
}

extension TARestaurantsViewController: TAPresenterDelegate {
    func fetchDataDidStart() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }
    
    func fetchDataDidEnd() {
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
    
    func updateUI() {
        self.collectionView.reloadData()
    }
}
