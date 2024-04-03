//
//  wordsData.swift
//  Spy
//
//  Created by Владислав Баранов on 23.03.2024.
//
import UIKit


struct wordsData {
    var wordForImposter: String
    var wordForInocent: String
    var theme: String
    var isPlayed: Bool?
}


var allArrayOfWords : [wordsData] = [
    wordsData(wordForImposter: "Море", wordForInocent: "Океан", theme: "Природа", isPlayed: false),
    wordsData(wordForImposter: "Клубника", wordForInocent: "Малина", theme: "Еда", isPlayed: false),
    wordsData(wordForImposter: "Мясо по-французски", wordForInocent: "Котлета по-киевски", theme: "Еда", isPlayed: false),
    wordsData(wordForImposter: "Лес", wordForInocent: "Роща", theme: "Природа", isPlayed: false),
    wordsData(wordForImposter: "Пельмени", wordForInocent: "Хинкали", theme: "Еда", isPlayed: false),
    wordsData(wordForImposter: "Маргарита", wordForInocent: "Пеперони", theme: "Еда", isPlayed: false),
    wordsData(wordForImposter: "Роллы", wordForInocent: "Суши", theme: "Еда", isPlayed: false),
    wordsData(wordForImposter: "Омлет", wordForInocent: "Яичница", theme: "Еда", isPlayed: false),
    wordsData(wordForImposter: "Гора", wordForInocent: "Холм", theme: "Природа", isPlayed: false),
    wordsData(wordForImposter: "Река", wordForInocent: "Озеро", theme: "Природа", isPlayed: false),
    wordsData(wordForImposter: "Цветок", wordForInocent: "Растение", theme: "Природа", isPlayed: false),
    wordsData(wordForImposter: "Закат", wordForInocent: "Рассвет", theme: "Природа", isPlayed: false),
    wordsData(wordForImposter: "Пустыня", wordForInocent: "Степь", theme: "Природа", isPlayed: false),
    wordsData(wordForImposter: "Водопад", wordForInocent: "Ручей", theme: "Природа", isPlayed: false),
    wordsData(wordForImposter: "Пляж", wordForInocent: "Берег", theme: "Природа", isPlayed: false),
    wordsData(wordForImposter: "Тайга", wordForInocent: "Тундра", theme: "Природа", isPlayed: false),
    wordsData(wordForImposter: "Гриб", wordForInocent: "Ягода", theme: "Природа", isPlayed: false),
    wordsData(wordForImposter: "Замок", wordForInocent: "Дворец", theme: "Здания", isPlayed: false),
    wordsData(wordForImposter: "Школа", wordForInocent: "Университет", theme: "Здания", isPlayed: false),
    wordsData(wordForImposter: "Отель", wordForInocent: "Гостиница", theme: "Здания", isPlayed: false),
    wordsData(wordForImposter: "Склад", wordForInocent: "Фабрика", theme: "Здания", isPlayed: false),
    wordsData(wordForImposter: "Кинотеатр", wordForInocent: "Театр", theme: "Здания", isPlayed: false),
    wordsData(wordForImposter: "Музей", wordForInocent: "Галерея", theme: "Здания", isPlayed: false),
    wordsData(wordForImposter: "Библиотека", wordForInocent: "Архив", theme: "Здания", isPlayed: false),
    wordsData(wordForImposter: "Супермаркет", wordForInocent: "Магазин", theme: "Здания", isPlayed: false),
    wordsData(wordForImposter: "Спортзал", wordForInocent: "Стадион", theme: "Здания", isPlayed: false),
    wordsData(wordForImposter: "Банк", wordForInocent: "Почта", theme: "Здания", isPlayed: false),
    wordsData(wordForImposter: "Дом", wordForInocent: "Квартира", theme: "Здания", isPlayed: false),
    wordsData(wordForImposter: "Больница", wordForInocent: "Поликлиника", theme: "Здания", isPlayed: false),
    wordsData(wordForImposter: "Теннис", wordForInocent: "Пинг-понг", theme: "Спорт", isPlayed: false),
    wordsData(wordForImposter: "Бейсбол", wordForInocent: "Крикет", theme: "Спорт", isPlayed: false),
    wordsData(wordForImposter: "Баскетбол", wordForInocent: "Волейбол", theme: "Спорт", isPlayed: false),
    wordsData(wordForImposter: "Гольф", wordForInocent: "Мини-гольф", theme: "Спорт", isPlayed: false),
    wordsData(wordForImposter: "Бокс", wordForInocent: "Кикбоксинг", theme: "Спорт", isPlayed: false),
    wordsData(wordForImposter: "Плавание", wordForInocent: "Синхронное плавание", theme: "Спорт", isPlayed: false),
    wordsData(wordForImposter: "Фигурное катание", wordForInocent: "Хоккей на льду", theme: "Спорт", isPlayed: false),
    wordsData(wordForImposter: "Сноубординг", wordForInocent: "Горные лыжи", theme: "Спорт", isPlayed: false),
    wordsData(wordForImposter: "Роликовый спорт", wordForInocent: "Скейтбординг", theme: "Спорт", isPlayed: false),
    wordsData(wordForImposter: "Акробатика", wordForInocent: "Гимнастика", theme: "Спорт", isPlayed: false),
    wordsData(wordForImposter: "Стрельба из лука", wordForInocent: "Стрельба из пневматической винтовки", theme: "Спорт", isPlayed: false),
    wordsData(wordForImposter: "Парусный спорт", wordForInocent: "Серфинг", theme: "Спорт", isPlayed: false),
    wordsData(wordForImposter: "Кроссфит", wordForInocent: "Спортивная гимнастика", theme: "Спорт", isPlayed: false),
    wordsData(wordForImposter: "Футбол", wordForInocent: "Рэгби", theme: "Спорт", isPlayed: false),
    wordsData(wordForImposter: "Биатлон", wordForInocent: "Лыжный спорт", theme: "Спорт", isPlayed: false),
]
var pickedArrayOfWords : [wordsData] = []
var arrayOfThemes : [String] = []
var playingThemes : [String : Bool] = [:]
func createArrayOfThemes(){
    for i in 0..<allArrayOfWords.count{
        arrayOfThemes.append(allArrayOfWords[i].theme)
    }
    arrayOfThemes = NSOrderedSet(array: arrayOfThemes).array as! [String]
    
    //if playingThemes = nil append all themes
    if playingThemes == [:]{
        for i in 0..<arrayOfThemes.count{
            playingThemes[arrayOfThemes[i]] = true
        }
    }
    print(arrayOfThemes)
    print(playingThemes)
}


