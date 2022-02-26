//
//  ArrayToString.swift
//  LABS
//
//  Created by Yury Bogdanov on 20.02.2022.
//

import Foundation

// ‼️ Все вычисления производить внутри функций ‼️

final class ArrayToStringConverter {
    
    // Функция получает на вход отсортированный массив, например [1,2,3,5,6,7,9,10,15]
    // Необходимо вернуть строку, сворачивая рядом стоящие элементы в блоки вида 1-3. Если элементов подряд нет, то элемент просто добавляется в строку.
    // Гарантируется, что:
    //  - в массиве нет отрицательных чисел
    //
    // Если в массиве нет элементов, то вернуть пустую строку ""
    // Пример:
    // на вход подаем: [1,2,3,5,6,7,9,10,15]
    // на выходе получаем: "1-3,5-7,9-10,15"
    // ================================
    // на вход подаем: [1,2,3,4,5,10,14,15,16,17,20]
    // на выходе получаем: "1-5,10,14-17,20"
    
    static func convertToString(array: [Int]) -> String {
        // обработка исклбчений
        guard array.count != 0 else{
            return ""
        }
        // можно было обрпботать первое число и в самом цикле, но этот ввариант показался более читаемым
        guard array.count != 1 else{
            return String(array[0])
        }

        var seqStart: Int = array[0]
        var seqEnd: Int = array[0]
        var resultString: String = ""
        let arrayLengh: Int = array.count - 1

        for i in 1...arrayLengh{
            if array[i] - seqEnd == 1 {
                seqEnd = array[i]
            }
            else {
                resultString += seqStart == seqEnd ?
                String(seqStart) + "," :
                String(seqStart) + "-" + String(seqEnd) + ","
                seqEnd = array[i]
                seqStart = array[i]
            }
        }
        //обработка последнего элемента массива
        seqEnd = array[arrayLengh]

        if seqEnd != seqStart{
            resultString += String(seqStart) + "-" + String(array[arrayLengh])
        }
        else{
            resultString += String(array[arrayLengh])
        }
        
        return resultString
    }
}
