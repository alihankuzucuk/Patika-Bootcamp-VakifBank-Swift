//
//  MovieListViewModel.swift
//  MovieMVVMArch
//
//  Created by Alihan KUZUCUK on 6.12.2022.
//

import Foundation

protocol MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate? { get set }
    func fetchPopularMovies()
    func getMovieCount() -> Int
    func getMovie(at index: Int) -> MovieModel?
    func getMovieId(at index: Int) -> Int?
}

protocol MovieListViewModelDelegate: AnyObject {
    func movieListPreFetch()
    func movieListPostFetch()
    func moviesLoaded()
    func moviesFailed(error: Error)
}

final class MovieListViewModel: MovieListViewModelProtocol {
    weak var delegate: MovieListViewModelDelegate?
    private var movies: [MovieModel]?
    
    func fetchPopularMovies() {
        self.delegate?.movieListPreFetch()
        MovieDBClient.getPopularMovies { [weak self] movies, error in
            guard let self = self else { return }
            
            self.delegate?.movieListPostFetch()
            
            if let error = error {
                self.delegate?.moviesFailed(error: error)
            } else {
                self.movies = movies
                self.delegate?.moviesLoaded()
            }
        }
    }
    
    func getMovieCount() -> Int {
        movies?.count ?? 0
    }
    
    func getMovie(at index: Int) -> MovieModel? {
        movies?[index]
    }
    
    func getMovieId(at index: Int) -> Int? {
        movies?[index].id
    }
}
