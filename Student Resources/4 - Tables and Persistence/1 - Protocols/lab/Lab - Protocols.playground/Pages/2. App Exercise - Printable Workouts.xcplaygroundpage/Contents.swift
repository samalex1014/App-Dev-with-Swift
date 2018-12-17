/*:
 ## App Exercise - Printable Workouts

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 The `Workout` objects you have created so far in app exercises don't show a whole lot of useful information when printed to the console. They also aren't very easy to compare or sort. Throughout these exercises, you'll make the `Workout` class below adopt certain protocols that will solve these issues.
 */
class Workout: CustomStringConvertible, Equatable, Comparable, Codable {
    var distance: Double
    var time: Double
    var identifier: Int
    
    init(distance: Double, time: Double, identifier: Int) {
        self.distance = distance
        self.time = time
        self.identifier = identifier
    }
    
    var description: String {
        return "Distance: \(self.distance), time: \(self.time), and workout \(self.identifier)"
    }
    
    static func == (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    static func < (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.identifier < rhs.identifier
    }
}

/*:
 Make the `Workout` class above conform to the `CustomStringConvertible` protocol so that printing an instance of `Workout` will provide useful information in the console. Create an instance of `Workout`, give it an identifier of 1, and print it to the console.
 */
var first = Workout(distance: 32.5, time: 12.6, identifier: 1)
print(first)

/*:
 Make the `Workout` class above conform to the `Equatable` protocol. Two `Workout` objects should be considered equal if they have the same identifier. Create another instance of `Workout`, giving it an identifier of 2, and print a boolean expression that evaluates to whether or not it is equal to the first `Workout` instance you created.
 */
var second = Workout(distance: 12.3, time: 5.34, identifier: 2)
print(first == second)

/*:
 Make the `Workout` class above conform to the `Comparable` protocol so that you can easily sort multiple instances of `Workout`. `Workout` objects should be sorted based on their identifier. 
 
 Create three more `Workout` objects, giving them identifiers of 3, 4, and 5, respectively. Then create an array called `workouts` of type `[Workout]` and assign it an array literal with all five `Workout` objects you have created. Place these objects in the array out of order. Then create another array called `sortedWorkouts` of type `[Workout]` that is the `workouts` array sorted by identifier. 
 */
var third = Workout(distance: 13.45, time: 3.23, identifier: 3)
var fourth = Workout(distance: 23.3, time: 2.345, identifier: 4)
var fifth = Workout(distance: 14.34, time: 67.23, identifier: 5)

var workouts: [Workout] = [first, second, third, fourth, fifth]
var sortedWorkouts: [Workout]  = workouts.sorted()

print(sortedWorkouts)
/*:
 Make `Workout` adopt the `Codable` protocol so you can easily encode `Workout` objects as data that can be stored between app launches. Use a `JSONEncoder` to encode one of your `Workout` instances. Then use the encoded data to initialize a `String`, and print it to the console.
 */
import Foundation

let jsonEncoder = JSONEncoder()
if let data = try? jsonEncoder.encode(first), let string = String(data: data, encoding: .utf8) {
    print(string)
}

//: [Previous](@previous)  |  page 2 of 5  |  [Next: Exercise - Create a Protocol](@next)
