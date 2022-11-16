//
//  ContentViewModel.swift
//  GuessTheFlag
//
//  Created by Jose carlos Rodriguez on 16/11/22.
//

import Foundation

final class ContentViewModel: ObservableObject {
    @Published var countries = ["Estonia", "Francia", "Alemania", "Irlanda", "Italia", "Nigeria", "Polonia", "Rusia", "España", "UK", "US", "Monaco"].shuffled()
    @Published var correctAnswer = Int.random(in: 0...2)
    @Published var showingScore = false
    @Published var showGameFinish = false
    @Published var gameFinishTitle = ""
    @Published var scoreTitle = ""
    @Published var score = 0
    @Published var turns = 0
    
}

// MARK: - Public functions

extension ContentViewModel {
    func flagTapped(_ number: Int) {
        turns += 1
        if turns <= 5 {
            if number == correctAnswer {
                scoreTitle = "Correcto"
                score += 1
            } else {
                scoreTitle = "Fallo"
            }
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        if turns == 5 {
            gameFinishTitle = "Fin del juego"
            showGameFinish = true
            
        }
    }
    
    func resetGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        turns = 0
        score = 0
    }
}
