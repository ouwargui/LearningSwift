//
//  ContentView.swift
//  learning
//
//  Created by Guilherme Santos on 11/11/22.
//

import SwiftUI

struct GuessTheFlagView: View {
  @State private var score = 0
  @State private var showingScore = false
  @State private var scoreTitle = ""
  @State private var countries = [
    "Estonia",
    "France",
    "Germany",
    "Ireland",
    "Italy",
    "Nigeria",
    "Poland",
    "Russia",
    "Spain",
    "UK",
    "US"
  ].shuffled()
  @State private var correctAnswer = Int.random(in: 0 ... 2)

  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea()

      VStack(spacing: 30) {
        VStack {
          Text("Tap the flag of")
            .foregroundColor(.white)
            .font(.subheadline.weight(.heavy))

          Text(countries[correctAnswer])
            .foregroundColor(.white)
            .font(.largeTitle.weight(.semibold))
        }
        VStack(spacing: 20) {
          ForEach(0 ..< 3) { number in
            Button {
              flagTapped(number)
            } label: {
              Image(countries[number])
                .renderingMode(.original)
                .clipShape(Capsule())
                .shadow(radius: 5)
            }
          }
        }
      }
    }.alert(scoreTitle, isPresented: $showingScore) {
      Button("Continue", action: askQuestion)
    } message: {
      Text("Your score is \(score)")
    }
  }

  func flagTapped(_ number: Int) {
    if number == correctAnswer {
      scoreTitle = "Correct"
      score += 10
    } else {
      scoreTitle = "Wrong"
      score -= 10
    }

    showingScore = true
  }

  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0 ... 2)
  }
}
