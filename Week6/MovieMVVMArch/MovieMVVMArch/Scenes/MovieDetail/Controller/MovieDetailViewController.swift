//
//  MovieDetailViewController.swift
//  MovieMVVMArch
//
//  Created by Alihan KUZUCUK on 6.12.2022.
//

import UIKit

final class MovieDetailViewController: UIViewController {

    @IBOutlet private weak var lblMovieTagline: UILabel!
    @IBOutlet private weak var imgVMovie: UIImageView!
    @IBOutlet private weak var lblMovieTitle: UILabel!
    
    var movieId: Int?
    private var viewModel: MovieDetailViewModelProtocol = MovieDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let id = movieId else { return }
        viewModel.delegate = self
        viewModel.fetchMovieDetail(id: id)
    }

}

extension MovieDetailViewController: MovieDetailViewModelDelegate {
    func movieLoaded() {
        lblMovieTagline.text = viewModel.getMovieTagline()
        lblMovieTitle.text = viewModel.getMovieTitle()
        guard let url = viewModel.getMovieImageURL() else { return }
        imgVMovie.af.setImage(withURL: url)
    }
}
