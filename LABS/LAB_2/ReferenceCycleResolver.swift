//
//  ReferenceCycleResolver.swift
//  LABS
//
//  Created by Ilya Murashko on 25.02.2022.
//

import Foundation

// В реализации классов Student и University есть ошибка, приводящая к утечке памяти, найдите ее и исправьте.

// Решение кратко обоснуйте в блоке | Обоснование решения |.
// Например: /* Я сделал …, т.к. это красиво */

/* | Утечка памяти из-за цикла сильных ссылок между экземплярами классов. weak ссылка была использована в University, а не в Student, число логически: ВУЗ может существовать без студента, а студент без ВУЗа - нет. Я выбрала weak, а не unowned для сохранения опционального типа без лишних усилий. | */

final class Student {
    let name: String
    
    var university: University?
    
    init(name: String) {
        self.name = name
    }
}



final class University {
    let universityName: String
    
    weak var student: Student?
    
    init(universityName: String) {
        self.universityName = universityName
    }
}

final class ReferenceCycleResolver {
    static func universityAdmission(student: Student, to university: University) {
        student.university = university
        university.student = student
    }
}

