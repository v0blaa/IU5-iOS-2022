//
//  SequenceСreator.swift
//  LABS
//
//  Created by Ilya Murashko on 14.02.2022.
//

import Foundation

// ‼️ Все вычисления производить внутри функций ‼️

final class SequenceСreator {
    
    // Функция получает на вход целое число N
    // и возвращает массив целых чисел от 1 до N.
    // Если N меньше единицы, то функция должна вернуть пустой массив.
    // Пример:
    // на вход подаем: 5
    // на выходе получаем: [1,2,3,4,5]
    // ================================
    // на вход подаем: -99
    // на выходе получаем: []
    
    static func createSequenceFromZeroTo(finalElement: Int) -> [Int] {
        // тут всё было верно, написала тест и проверила, при получении на входе 1 функция возвращает [1]
        guard finalElement >= 1 else {
            return []
        }

        var array: [Int] = []
        
        for i in 1...finalElement{
            array.append(i)
        }
        
        return array
        //либо то же самое через if, не знаю, что лучше использовать
    }
    
    // Функция получает на вход целое число N
    // и возвращает массив целых чисел от N до 1.
    // Если N меньше единицы, то функция должна вернуть пустой массив.
    // Пример:
    // на вход подаем - 5
    // на выходе получаем - [5,4,3,2,1]
    // ================================
    // на вход подаем - 0
    // на выходе получаем - []
    
    static func createReversedSequenceToZeroFrom(finalElement: Int) -> [Int] {
        // тут всё было верно, написала тест и проверила, при получении на входе 1 функция возвращает [1]
        guard finalElement >= 1 else {
            return []
        }
        
        var array: [Int] = []
        
        for i in stride(from: finalElement, through: 1, by: -1){
            array.append(i)
        }
        
        return array
    }
}
