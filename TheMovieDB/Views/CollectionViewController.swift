//
//  CollectionViewController.swift
//  TheMovieDB
//
//  Created by D Yahns on 14/07/2018.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    var viewModel: CollectionViewModel = CollectionViewModel(dataSource: TheMovieDb())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = viewModel.title

        bindViewModel()
        viewModel.fetchData()
    }

    func bindViewModel() {
        viewModel.collectionNeedReloading = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView?.reloadData()
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailsViewController, let cell = sender as? UICollectionViewCell, let indexPath = collectionView?.indexPath(for: cell) {
            vc.movieId = viewModel.getModel(at: indexPath).id
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfMovies
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
    
        // Configure the cell
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.titleLabel.text = cellVM.title
    
        return cell
    }

}
