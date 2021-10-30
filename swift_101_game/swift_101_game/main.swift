//
//  main.swift
//  swift_101_game
//
//  Created by Jiwon_Hae on 2021/10/31.
//

import Foundation

let usr = "😀"
let damagedUsr = "😡"

func main(){
    let coinPerGame = 50
    print("Please insert coins (\(coinPerGame) cents per game)")
    
    if let input = readLine() {
        if let coin = Int(input){
            var numGames = coin / coinPerGame
            
            while numGames > 0 {
                numGames -= 1
                
                let gameResult = game()
                
                
                print("number game left : \(numGames)")
                break
            }
        }
    }
    
    print("End of game")
}


func game() -> Bool {
    print("\n--------------------")
    print("Jumping game start")
    print("--------------------")
    var playerLife = 20, index = 0
    var pathDisplay = 20
    var userPos = 2
    let hurdle = createHurdle(100)
    
    
    while playerLife > 0 && index < hurdle.count {
        print("press 'w' for up 's' for down")
        
        let curr = hurdle[index..<(min(hurdle.count, index+pathDisplay))].map{ (value : Int) -> String in return mapToHurdle(value) }
        userPos += getUserInput()
        userPos = min(2, userPos)
        userPos = max(0, userPos)
        
        print("\n\n")
        print(printUser(userPos, hurdle[index] >= userPos))
        print(curr.joined())
                                   
        index += 1
        sleep(1)
    }
    return false
}

func getUserInput() -> Int {
    let mapper = ["w" : -1, "s" : 1]
    
    if let input = readLine(){
        return mapper[input, default:0]
    }
    
    return 0
}


func createHurdle(_ size : Int) -> [Int]{
    return (0..<size).map { _ in .random(in: 0...2) }
    
}

func printUser(_ pos : Int, _ isDamaged : Bool) -> String{
    var u = Array.init(repeating: "\n", count:3)
    var usrPos = min(pos, 2)
    usrPos = max(0, pos)
    
    if isDamaged{
        u[pos] = damagedUsr
    } else{
        u[pos] = usr
        
    }
    
    return u.joined()
}

func mapToHurdle(_ type : Int) -> String{
    switch(type){
    case 0:
        return "   "
    case 1:
        return "___"
    case 2:
        return "---"
    default :
        return "  "
    }
}



main()
