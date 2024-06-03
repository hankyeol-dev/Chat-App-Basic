import Foundation

func _map<T, R>(_ array: [T], _ cb: (T) -> R) -> [R] {
    var resultArray: [R] = []
    
    for el in array {
        resultArray.append(cb(el))
    }
    
    return resultArray
}

func _filter<T>(_ array: [T], _ cb: (T) -> Bool) -> [T] {
    var resultArray: [T] = []
    
    for el in array {
        if cb(el) {
            resultArray.append(el)
        }
    }
    
    return resultArray
}
