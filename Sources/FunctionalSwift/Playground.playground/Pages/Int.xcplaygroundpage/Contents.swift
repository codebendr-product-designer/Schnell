import Foundation

typealias Add = ((Int) -> Int)
func add(_ x: Int) ->  Add { {x + $0} }

print(add(2)(4))

typealias Multiply = ((Int,Int) -> Int)
func multiply(_ x: Int) ->  Multiply { {x * $0 * $1} }

print(multiply(2)(4,6))

typealias Division = (([Int]) -> String)
func division(_ x: Int) ->  Division {
    { "Number \($0.reduce(x,*).formatted())" }
}

print(division(4)([2,2,2]))
