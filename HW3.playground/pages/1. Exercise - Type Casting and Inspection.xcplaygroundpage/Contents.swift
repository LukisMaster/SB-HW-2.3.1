/*:
 ## Упражнение - приведение типов и их контроль
 
 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */
print(" print array" )
let collection : [Any] = [2.0, 4.7, 9, 12, "One", "Two", true, false, -2.3, -2, 0]
for (index, item) in collection.enumerated() {
    print("collection [\(index)] = \(item)")
}
/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */
print("\n print description of array" )
collection.forEach({item in
    switch item {
    case is Int: print("Целое число: \(item)")
    case is Double: print("Вещественное число: \(item)")
    case is String: print("Строка: \(item)")
    case is Bool: print("Булево значение: \(item)")
    default: print("Неизвестный тип: \(item)")
    }
})

/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите пары ключ/значения для всех элементов коллекции.
 */
print("\n print dict" )
let dict: [String: Any] = ["One": 1, "Two": 2.0, "Three": "three", "Four": "4","False": false]
dict.forEach({key, value in
    print(key, value)
})

/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */
var total = 0.0
print("\n total dict" )
dict.forEach({_, value in
    switch value {
    case let valueInt as Int: total += Double(valueInt)
    case let valueDouble as Double: total += valueDouble
    case is String: total += 1.0
    case is Bool: total += value as! Bool ? 2 : -3
    default: print("Неизвестный тип: \(value)")
    }
})
print("total = \(total)")

/*:
 Обнулите переменную total и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
 */
total = 0
print("\n total collection") //массив как и словарь тоже является коллекцией, ради интереса в этот раз пройдем по 'collection', созданному ранее
collection.forEach({value in
    switch value {
    case let value as Int: total += Double(value)
    case let value as Double: total += value
    case let value as String: total += Double(value) ?? 0
    case is Bool: break
    default: print("Неизвестный тип: \(value)")
    }
})
print("total = \(total)")
//: страница 1 из 2  |  [Далее: упражнение для приложения - типы тренировок](@next)
