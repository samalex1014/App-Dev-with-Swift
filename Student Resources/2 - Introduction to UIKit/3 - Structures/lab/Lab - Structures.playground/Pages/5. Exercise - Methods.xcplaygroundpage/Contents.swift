/*:
 ## Exercise - Methods
 
 A `Book` struct has been created for you below. Add an instance method on `Book` called `description` that will print out facts about the book. Then create an instance of `Book` and call this method on that instance.
 */
struct Book {
    var title: String
    var author: String
    var pages: Int
    var price: Double
    
    func description() {
        print("The title is \(self.title), by \(self.author). \nIt is \(self.pages) pages long, and costs \(self.price)")
    }
}

var fave = Book(title: "East of Eden", author: "John Steinbeck", pages: 324, price: 12.54)

fave.description()
/*:
 A `Post` struct has been created for you below, representing a generic social media post. Add a mutating method on `Post` called `like` that will increment `likes` by one. Then create an instance of `Post` and call `like()` on it. Print out the `likes` property before and after calling the method to see whether or not the value was incremented.
 */
struct Post {
    var message: String
    var likes: Int
    var numberOfComments: Int
    
    mutating func increment() {
        self.likes += 1
    }
}

var generic = Post(message: "Hello", likes: -3, numberOfComments: 64)
print("Current likes: \(generic.likes)")
generic.increment()
print("New likes: \(generic.likes)")

//: [Previous](@previous)  |  page 5 of 10  |  [Next: App Exercise - Workout Functions](@next)
