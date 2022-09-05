/*:
 ## Упражнение - приведение типов и их контроль
 
 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */
let collection : [Any] = [2.0, 4.7, 9, 12, "One", "Two", true, false, -2.3, -2, 0]
collection.forEach({ item in
    print(item)
})
/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */
collection.forEach({item in
    switch item {
    case _ where item is Int: print("Целое число: \(item)")
    case _ where item is Double: print("Вещественное число: \(item)")
    case _ where item is String: print("Строка: \(item)")
    case _ where item is Bool: print("Булево значение: \(item)")
    default: print("Неизвестный тип: \(item)")
    }
})

/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите пары ключ/значения для всех элементов коллекции.
 */
let dict: [String: Any] = ["One": 1, "Two": 2.0, "Three": "three", "Four": "4","False": false]
dict.forEach({key, value in
    print(key, value)
})

/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */
var total = 0.0
dict.forEach({_, value in
    switch value {
    case _ where value is Int: total += Double(value as! Int)
    case _ where value is Double: total += (value as! Double)
    case _ where value is String: total += 1.0
    case _ where (value is Bool && value as! Bool): total += 2.0
    case _ where (value is Bool && !(value as! Bool)): total -= 3.0
    default: print("Неизвестный тип: \(value)")
    }
})
print("total = \(total)")

/*:
 Обнулите переменную total и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
 */
total = 0
dict.forEach({_, value in
    switch value {
    case _ where value is Int: total += Double(value as! Int)
    case _ where value is Double: total += (value as! Double)
    case _ where value is String: total += Double(value as! String) ?? 0
    case _ where value is Bool: break
    default: print("Неизвестный тип: \(value)")
    }
})
print("total = \(total)")
//: страница 1 из 2  |  [Далее: упражнение для приложения - типы тренировок](@next)
