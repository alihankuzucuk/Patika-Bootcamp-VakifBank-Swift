//
//  MovieTableViewCell.swift
//  MovieMVVMArch
//
//  Created by Alihan KUZUCUK on 6.12.2022.
//

import UIKit
import AlamofireImage

final class MovieTableViewCell: UITableViewCell {

    @IBOutlet private weak var imgVMovie: UIImageView!
    @IBOutlet private weak var lblMovieTitle: UILabel!
    
    func configureCell(movie: MovieModel) {
        lblMovieTitle.text = movie.title
        guard let url = URL(string: MovieDBClient.IMAGE_BASE_URL + movie.poster) else { return }
        imgVMovie.af.setImage(withURL: url)
    }
    
    override func prepareForReuse() {
        imgVMovie.image = nil
    }

}
