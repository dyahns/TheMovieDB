//
//  DetailsViewController.swift
//  TheMovieDB
//
//  Created by D Yahns on 14/07/2018.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var collectionButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movieId: Int!
    var detailsViewModel = DetailsViewModel(dataSource: TheMovieDb())

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Loading..."
        collectionButton.setTitle("", for: .normal)
        collectionButton.isEnabled = false
        descriptionLabel.text = ""
        
        bindViewModel()
        detailsViewModel.fetchMovie(id: movieId)
    }

    func bindViewModel() {
        detailsViewModel.needRefresh = { [weak self] in
            DispatchQueue.main.async {
                self?.navigationItem.title = self?.detailsViewModel.title
                
                if let bundle = self?.detailsViewModel.bundle {
                    self?.collectionButton.setTitle(bundle.name, for: .normal)
                    self?.collectionButton.isEnabled = true
                } else {
                    self?.collectionButton.setTitle("Not part of collection", for: .normal)
                    self?.collectionButton.isEnabled = false
                }
                
                self?.descriptionLabel.text = self?.detailsViewModel.description
            }
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CollectionViewController {
            vc.viewModel = CollectionViewModel(dataSource: TheMovieDb(), bundle: detailsViewModel.bundle)
        }
    }

}
