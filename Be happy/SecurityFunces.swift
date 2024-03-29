//
//  SecurityFunces.swift
//  Be happy
//
//  Created by Дима Кожемякин on 02.01.2024.
//

import Foundation

class SecurityFunces: ObservableObject {
    private let unWordsData: [Int : Character] = [
        1 : "A",
        2 : "a",
        3 : "B",
        4 : "b",
        5 : "C",
        6 : "c",
        7 : "D",
        8 : "d",
        9 : "E",
        10 : "e",
        11 : "F",
        12 : "f",
        13 : "G",
        14 : "g",
        15 : "H",
        16 : "h",
        17 : "I",
        18 : "i",
        19 : "J",
        20 : "j",
        21 : "K",
        22 : "k",
        23 : "L",
        24 : "l",
        25 : "M",
        26 : "m",
        27 : "N",
        28 : "n",
        29 : "O",
        30 : "o",
        31 : "P",
        32 : "p",
        33 : "Q",
        34 : "q",
        35 : "R",
        36 : "r",
        37 : "S",
        38 : "s",
        39 : "T",
        40 : "t",
        41 : "U",
        42 : "u",
        43 : "V",
        44 : "v",
        45 : "W",
        46 : "w",
        47 : "X",
        48 : "x",
        49 : "Y",
        50 : "y",
        51 : "Z",
        52 : "z"
    ]
    
    private let wordsData: [Character : Int] = [
        "A" : 1,
        "a" : 2,
        "B" : 3,
        "b" : 4,
        "C" : 5,
        "c" : 6,
        "D" : 7,
        "d" : 8,
        "E" : 9,
        "e" : 10,
        "F" : 11,
        "f" : 12,
        "G" : 13,
        "g" : 14,
        "H" : 15,
        "h" : 16,
        "I" : 17,
        "i" : 18,
        "J" : 19,
        "j" : 20,
        "K" : 21,
        "k" : 22,
        "L" : 23,
        "l" : 24,
        "M" : 25,
        "m" : 26,
        "N" : 27,
        "n" : 28,
        "O" : 29,
        "o" : 30,
        "P" : 31,
        "p" : 32,
        "Q" : 33,
        "q" : 34,
        "R" : 35,
        "r" : 36,
        "S" : 37,
        "s" : 38,
        "T" : 39,
        "t" : 40,
        "U" : 41,
        "u" : 42,
        "V" : 43,
        "v" : 44,
        "W" : 45,
        "w" : 46,
        "X" : 47,
        "x" : 48,
        "Y" : 49,
        "y" : 50,
        "Z" : 51,
        "z" : 52]
    func unShifr(shifr: [Int]) -> String {
        var result = ""
        for i in shifr {
            result += String(unWordsData[i]!)
        }
        return result
    }
    func shifr(STR: String) -> [Int] {
        var resultShifr: [Int] = []
        for i in STR {
            resultShifr.append(wordsData[i]!)
        }
        return resultShifr
    }
}
