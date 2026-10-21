//
//  Movie.swift
//  MovieBrowser
//
//  Created by Juan Catalan on 5/23/26.
//

import Foundation

struct Movie: Identifiable {
  let id = UUID()
  let title: String
  let year: Int
  let genre: String
  let synopsis: String
  var yearText: String { String(year) }
}

extension Movie {
  static let catalog: [Movie] = [
    Movie(title: "Arrival", year: 2016, genre: "Sci-Fi",
          synopsis: "A linguist races to decode an alien language."),
    Movie(title: "Coco", year: 2017, genre: "Animation",
          synopsis: "A boy journeys into the Land of the Dead."),
    Movie(title: "Dune", year: 2021, genre: "Sci-Fi",
          synopsis: "A noble heir confronts his destiny on Arrakis."),
    Movie(title: "Get Out", year: 2017, genre: "Horror",
          synopsis: "A visit to a girlfriend's family turns sinister."),
    Movie(title: "Inception", year: 2010, genre: "Thriller",
          synopsis: "A thief steals secrets from inside dreams."),
    Movie(title: "Interstellar", year: 2014, genre: "Sci-Fi",
          synopsis: "Explorers cross a wormhole to find a new home."),
    Movie(title: "Jurassic Park", year: 1993, genre: "Adventure",
          synopsis: "Cloned dinosaurs break loose in a theme park."),
    Movie(title: "Knives Out", year: 2019, genre: "Mystery",
          synopsis: "A detective untangles a wealthy family's lies."),
    Movie(title: "La La Land", year: 2016, genre: "Musical",
          synopsis: "A pianist and an actress chase their dreams."),
    Movie(title: "Mad Max: Fury Road", year: 2015, genre: "Action",
          synopsis: "Rebels flee a tyrant across a desert wasteland."),
    Movie(title: "Parasite", year: 2019, genre: "Drama",
          synopsis: "A poor family schemes into a wealthy home."),
    Movie(title: "Soul", year: 2020, genre: "Animation",
          synopsis: "A musician's soul is split from his body."),
    Movie(title: "Spirited Away", year: 2001, genre: "Animation",
          synopsis: "A girl works in a spirit world bathhouse."),
    Movie(title: "The Martian", year: 2015, genre: "Sci-Fi",
          synopsis: "An astronaut is stranded alone on Mars."),
    Movie(title: "Whiplash", year: 2014, genre: "Drama",
          synopsis: "A drummer is pushed by a ruthless instructor.")
  ]
}
