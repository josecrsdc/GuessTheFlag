//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jose carlos Rodriguez on 16/11/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = ContentViewModel()

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Spacer()
                    Text("Toca la bandera de")
                        .font(.subheadline.weight(.heavy))
                    Text(vm.countries[vm.correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                }
                .foregroundColor(.white)
                
                VStack {
                    Text("Adivina la bandera")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .padding(.bottom, 60)
                    
                    VStack(spacing: 15) {
                        ForEach(0..<3) { number in
                            Button {
                                vm.flagTapped(number)
                            } label: {
                                Image(vm.countries[number])
                                    .flagStyle()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                Spacer()
                Spacer()
                Text("Puntuación: \(vm.score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
            }
            .padding()
        }
        .alert(vm.scoreTitle, isPresented: $vm.showingScore) {
            Button("Cantinuar", action: vm.askQuestion)
        } message: {
            Text("Tu puntuación es \(vm.score)")
        }
        .alert(vm.gameFinishTitle, isPresented: $vm.showGameFinish) {
            Button("Reiniciar", action: vm.resetGame)
        } message: {
            Text("Tu puntuación es \(vm.score)")
        }
    }
}

struct GuessTheFlag_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

