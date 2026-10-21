//
//  ContentView.swift
//  ParkGuide
//
//  Created by Juan Catalan on 7/19/26.
//

import SwiftUI

enum SidebarItem: Hashable {
  case region(Region)
  case favorites
}

struct ContentView: View {
  @State private var router = ParkRouter()
  @State private var selection: SidebarItem? = .region(.west)
  @Namespace private var namespace

  var body: some View {
    NavigationSplitView {
      List(selection: $selection) {
        Section("Regions") {
          ForEach(Region.allCases) { region in
            Label(region.rawValue, systemImage: region.symbolName)
              .foregroundStyle(region.tint)
              .tag(SidebarItem.region(region))
          }
        }
        Section {
          Label("Favorites", systemImage: "star.fill")
            .foregroundStyle(.yellow)
            .tag(SidebarItem.favorites)
        }
      }
      .navigationTitle("ParkGuide")
    } detail: {
      NavigationStack(path: $router.path) {
        ParkGridView(
          title: detailTitle,
          parks: detailParks,
          namespace: namespace
        )
        .navigationDestination(for: Park.self) { park in
          ParkDetailView(park: park)
            .navigationTransition(.zoom(sourceID: park.id, in: namespace))
        }
        .navigationDestination(for: Region.self) { region in
          ParkGridView(
            title: region.rawValue,
            parks: Park.inRegion(region),
            namespace: namespace
          )
        }
        .toolbar {
          ToolbarItem(placement: .primaryAction) {
            Button("Featured", systemImage: "sparkles") {
              router.show(Park.featured)
            }
          }
        }
      }
      .onChange(of: selection) {
        router.popToRoot()
      }
    }
    .environment(router)
  }

  private var detailTitle: String {
    switch selection {
    case .region(let region): region.rawValue
    case .favorites: "Favorites"
    case nil: "ParkGuide"
    }
  }

  private var detailParks: [Park] {
    switch selection {
    case .region(let region): Park.inRegion(region)
    case .favorites: Park.favorites
    case nil: []
    }
  }
}

#Preview {
  ContentView()
}
