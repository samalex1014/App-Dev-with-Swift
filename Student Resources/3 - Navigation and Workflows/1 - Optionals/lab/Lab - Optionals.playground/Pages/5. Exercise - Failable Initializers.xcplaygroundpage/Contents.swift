/*:
 ## Exercise - Failable Initializers
 
 Create a `Computer` struct with two properties, `ram` and `yearManufactured`, where both parameters are of type `Int`. Create a failable initializer that will only create an instance of `Computer` if `ram` is greater than 0, and if `yearManufactured` is greater than 1970, and less than 2017.
 */
struct Computer {
    var ram: Int
    var yearManufactured: Int
    
    init?(ramIn: Int, yearIn: Int) {
        if ramIn > 0 && yearIn > 1970 && yearIn < 2019 {
            self.ram = ramIn
            self.yearManufactured = yearIn
        } else {
            return nil
        }
    }
}

/*:
 Create two instances of `Computer?` using the failable initializer. One instance should use values that will have a value within the optional, and the other should result in `nil`. Use if-let syntax to unwrap each of the `Computer?` objects and print the `ram` and `yearManufactured` if the optional contains a value.
 */
var correct = Computer(ramIn: 64, yearIn: 2018)
var wrong = Computer(ramIn: 0, yearIn: 2000)

if let tester = correct {
    print("RAM: \(tester.ram)\nYear: \(tester.yearManufactured)")
}

if let newTest = wrong {
    print("Wait what happened?")
} else {
    print("FAILURE")
}
//: [Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Workout or Nil](@next)
