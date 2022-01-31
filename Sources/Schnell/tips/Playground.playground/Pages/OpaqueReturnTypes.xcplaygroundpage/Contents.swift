
protocol Employee { }
struct Coder: Employee { }
struct Boss: Employee { }

func login() -> some Employee {
    return Coder()
}

func makeInt() -> some Equatable {
    Int.random(in: 1...10)
}

let int1 = makeInt()
let int2 = makeInt()
print(int1 == int2)

func makeNumber() -> some Numeric {
    Double.random(in: 1...10)
}
