import UIKit

var str = "Hello, playground"

//This shows how to use arc4random_uniform to generate a random integer between zero and the upper bound passed to it (array count)

let array = ["luke", "han", "leia", "chewbacca"]

let randomIndex = Int(arc4random_uniform(UInt32(array.count)))

print(array[randomIndex]) //print a random item from the array
