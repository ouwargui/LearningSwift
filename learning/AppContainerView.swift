//
//  AppContainerView.swift
//  learning
//
//  Created by Guilherme Santos on 11/11/22.
//

import SwiftUI

struct AppContainerView: View {
  var body: some View {
    NavigationStack {
      List {
        Section("Beginner") {
          NavigationLink("Guess the flag") {
            GuessTheFlagView()
          }
          NavigationLink("Word Scramble") {
            WordScrambleView()
          }
        }
      }
      .navigationTitle("Learning apps")
    }
  }
}
