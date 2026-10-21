//
//  Park.swift
//  ParkGuide
//
//  Created by Juan Catalan on 7/19/26.
//

import Foundation

struct Park: Identifiable, Hashable {
  let id: Int
  let name: String
  let region: Region
  let tagline: String
  let symbolName: String
  let established: Int
  let areaAcres: Int
  let highlights: [String]
  let url: URL
  var isFavorite: Bool = false

  var areaFormatted: String {
    "\(areaAcres.formatted()) acres"
  }
  var establishedText: String {
    String(established)
  }
}

extension Park {
  static let all: [Park] = [
    Park(
      id: 1,
      name: "Yosemite",
      region: .west,
      tagline: "Granite cliffs and giant sequoias",
      symbolName: "mountain.2.fill",
      established: 1890,
      areaAcres: 761266,
      highlights: ["El Capitan", "Half Dome", "Yosemite Falls"],
      url: URL(string: "https://www.nps.gov/yose/")!,
      isFavorite: true
    ),
    Park(
      id: 2,
      name: "Sequoia",
      region: .west,
      tagline: "Home of the largest trees on Earth",
      symbolName: "tree.fill",
      established: 1890,
      areaAcres: 404064,
      highlights: ["General Sherman Tree", "Moro Rock", "Crystal Cave"],
      url: URL(string: "https://www.nps.gov/seki/")!
    ),
    Park(
      id: 3,
      name: "Redwood",
      region: .west,
      tagline: "Towering coast redwood forests",
      symbolName: "leaf.fill",
      established: 1968,
      areaAcres: 138999,
      highlights: ["Tall Trees Grove", "Fern Canyon", "Coastal trails"],
      url: URL(string: "https://www.nps.gov/redw/")!
    ),
    Park(
      id: 4,
      name: "Rocky Mountain",
      region: .rockies,
      tagline: "Alpine peaks above the tree line",
      symbolName: "snowflake",
      established: 1915,
      areaAcres: 265461,
      highlights: ["Trail Ridge Road", "Bear Lake", "Longs Peak"],
      url: URL(string: "https://www.nps.gov/romo/")!
    ),
    Park(
      id: 5,
      name: "Glacier",
      region: .rockies,
      tagline: "Carved valleys and turquoise lakes",
      symbolName: "water.waves",
      established: 1910,
      areaAcres: 1013126,
      highlights: [
        "Going-to-the-Sun Road", "Grinnell Glacier", "Lake McDonald",
      ],
      url: URL(string: "https://www.nps.gov/glac/")!,
      isFavorite: true
    ),
    Park(
      id: 6,
      name: "Grand Teton",
      region: .rockies,
      tagline: "Jagged peaks over the Snake River",
      symbolName: "mountain.2.fill",
      established: 1929,
      areaAcres: 310044,
      highlights: ["Jenny Lake", "Cascade Canyon", "Snake River"],
      url: URL(string: "https://www.nps.gov/grte/")!
    ),
    Park(
      id: 7,
      name: "Grand Canyon",
      region: .southwest,
      tagline: "A mile-deep gorge carved by the Colorado",
      symbolName: "sun.max.fill",
      established: 1919,
      areaAcres: 1201647,
      highlights: ["South Rim", "Bright Angel Trail", "Colorado River"],
      url: URL(string: "https://www.nps.gov/grca/")!,
      isFavorite: true
    ),
    Park(
      id: 8,
      name: "Zion",
      region: .southwest,
      tagline: "Red sandstone canyons and narrows",
      symbolName: "camera.macro",
      established: 1919,
      areaAcres: 147242,
      highlights: ["The Narrows", "Angels Landing", "Emerald Pools"],
      url: URL(string: "https://www.nps.gov/zion/")!
    ),
    Park(
      id: 9,
      name: "Arches",
      region: .southwest,
      tagline: "Over 2,000 natural stone arches",
      symbolName: "binoculars.fill",
      established: 1971,
      areaAcres: 76679,
      highlights: ["Delicate Arch", "Landscape Arch", "Balanced Rock"],
      url: URL(string: "https://www.nps.gov/arch/")!
    ),
    Park(
      id: 10,
      name: "Acadia",
      region: .east,
      tagline: "Where mountains meet the Atlantic",
      symbolName: "sunrise.fill",
      established: 1919,
      areaAcres: 49075,
      highlights: ["Cadillac Mountain", "Jordan Pond", "Park Loop Road"],
      url: URL(string: "https://www.nps.gov/acad/")!,
      isFavorite: true
    ),
    Park(
      id: 11,
      name: "Great Smoky Mountains",
      region: .east,
      tagline: "Misty ridgelines and old-growth forest",
      symbolName: "cloud.fog.fill",
      established: 1934,
      areaAcres: 522427,
      highlights: ["Clingmans Dome", "Cades Cove", "Appalachian Trail"],
      url: URL(string: "https://www.nps.gov/grsm/")!
    ),
    Park(
      id: 12,
      name: "Everglades",
      region: .east,
      tagline: "A vast subtropical wetland",
      symbolName: "bird.fill",
      established: 1947,
      areaAcres: 1508938,
      highlights: ["Anhinga Trail", "Shark Valley", "Ten Thousand Islands"],
      url: URL(string: "https://www.nps.gov/ever/")!
    ),
  ]

  static let featured = all.first { $0.name == "Grand Canyon" } ?? all[0]

  static func inRegion(_ region: Region) -> [Park] {
    all.filter { $0.region == region }
  }

  static var favorites: [Park] {
    all.filter { $0.isFavorite }
  }
}
