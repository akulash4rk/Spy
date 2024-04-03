//
//  inGameData.swift
//  Spy
//
//  Created by Владислав Баранов on 25.03.2024.
//

import Foundation

let arrayOfPlayersConst = Array(1...12)
var countOfPlayers = 3
var countOfPlayersOnTheTable = countOfPlayers
var countOfSpy = 0
var savedPlayer = countOfPlayers
var savedSpy = countOfSpy
var currentPlayer = 1
var arrayOfPlayers: [Int: Bool] = [:]
var randomPlayingElement = allArrayOfWords[0]
var timerTime = 3
var whoWin = ""
var willRoleShowToSpy = true
var willWordShowToSpy = true


func findMaxSpy() -> Int{
    if countOfPlayers == 3 {
        countOfSpy = 1
    } else {
        countOfSpy = countOfPlayers / 2
    }
    return countOfSpy
}



func selectWords(){
    var counter = 0
    
    checkForAllPlayes()
    randomPlayingElement = allArrayOfWords.randomElement()!
    
    
    //check for avaible themes
    for i in 0..<arrayOfThemes.count{
        if playingThemes[arrayOfThemes[i]] == true {
            counter += 1
        }
    }
    
    //if avaible themes == 0
    //make first theme = true
    if counter == 0 {
        playingThemes[arrayOfThemes[0]] = true
    }
    
    counter = 0
    
    
    
    //here we checking for count of avaible games
    for i in 0..<allArrayOfWords.count{
        if (playingThemes[allArrayOfWords[i].theme] == true) && (allArrayOfWords[i].isPlayed == false){
            counter += 1
        }
    }
    
    
    //if all games in chosed themes was played
    //set to can play all words
    if counter == 0{
        for i in 0..<allArrayOfWords.count{
            if (playingThemes[allArrayOfWords[i].theme] == true){
                allArrayOfWords[i].isPlayed = false
            }
        }
    }
    counter = 0
    
    
    //pick theme, what we didnt play
    //we will rerolling element, while isPlayed == true
    //and in this arrray checking for avaible theme
    while (randomPlayingElement.isPlayed == true) || (playingThemes[randomPlayingElement.theme] == false){
        randomPlayingElement = allArrayOfWords.randomElement()!
        print(randomPlayingElement)
        print(randomPlayingElement.isPlayed)
        print(playingThemes[randomPlayingElement.theme])
        print("Just check1")
    }
    
    //set in allArrayOfWords picked word to "Played"
    for i in 0..<allArrayOfWords.count{
        if randomPlayingElement.wordForInocent == allArrayOfWords[i].wordForInocent{
            allArrayOfWords[i].isPlayed = true
            randomPlayingElement = allArrayOfWords[i]
            break
        }
    }
    
    counter = 0
    
    //making arrayOfPlayers
    while counter < countOfPlayers {
        counter += 1
        print("Just check2")
        arrayOfPlayers[counter] = false
    }
    
    
    counter = 0
    
    
    //set random Spys'
    while counter < countOfSpy {
        if let rndElement = arrayOfPlayers.filter({ $0.value == false }).randomElement() {
            counter += 1
            print("Just check3")
            arrayOfPlayers[rndElement.key] = true
        }
    }

}


//if all games was played this func will be make to all false
func checkForAllPlayes(){
    var countOfPlayedWords = 0
    
    for i in 0..<allArrayOfWords.count{
        if allArrayOfWords[i].isPlayed == true {
            countOfPlayedWords += 1
        }
    }
    if allArrayOfWords.count == countOfPlayedWords{
        for i in 0..<allArrayOfWords.count{
            allArrayOfWords[i].isPlayed = false
        }
    }
}


//if game will start with previous players

func restartGame(){
    countOfPlayers = savedPlayer
    countOfSpy = savedSpy
    currentPlayer = 1
    arrayOfPlayers = [:]
    randomPlayingElement = allArrayOfWords[0]
    whoWin = ""
}


