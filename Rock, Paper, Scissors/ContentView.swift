//
//  ContentView.swift
//  Rock, Paper, Scissors
//
//  Created by Caden Huffman on 7/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var computerChoice = Int.random(in: 0...2)
    @State private var playerChoice = ""
    @State private var possibleChoices = ["🪨", "📝", "✂️"]
    @State private var winOrLose = Bool.random()
    var winningChoices: [String]{
        var holder = [String]()
        if(winOrLose){
            for choice in possibleChoices{
                if choice == "🪨"{
                    holder.append("📝")
                }else if choice == "📝"{
                    holder.append("✂️")
                }else{
                    holder.append("🪨")
                }
            }
        }else{
            for choice in possibleChoices{
                if choice == "🪨"{
                    holder.append("✂️")
                }else if choice == "📝"{
                    holder.append("🪨")
                }else{
                    holder.append("📝")
                }
            }
        }
        return holder
    }
    
    @State private var playerScore = 0
    @State private var turnNumber = 0
    
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue,.orange], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Rock Paper Scissors")
                Text("Your Score is \(playerScore)")
                    .font(.title)
                    .multilineTextAlignment(.center)
                Spacer()
                Button("\(possibleChoices[computerChoice])"){}
                    .clipShape(Capsule())
                    .shadow(radius: 10)
                    
                    .font(.largeTitle)
                
                if winOrLose{
                    Text("Win")
                }else{
                    Text("Lose")
                }
                Spacer()
                
                HStack(spacing: 100){
                    ForEach(0..<3) { number in
                        Button("\(possibleChoices[number])"){
                            playGame(number)
                        }
                        .font(.title)
                    }
                    
                    
                }
                
                .padding()
                
            }
        }
        
        
    }
        
    
    func playGame(_ number: Int){
        
        if(possibleChoices[number] == winningChoices[computerChoice]){
            playerScore += 1
            nextTurn()
        }else{
            nextTurn()
        }

    }
    
    func nextTurn(){
        if(turnNumber < 10){
            turnNumber += 1
            possibleChoices.shuffle()
            winOrLose.toggle()
        }else{
            restart()
        }
    }
    func restart(){
        playerScore = 0
        turnNumber = 0
        possibleChoices.shuffle()
        winOrLose.toggle()
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
