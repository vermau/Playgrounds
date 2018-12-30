import UIKit

struct Person {
    let firstName: String
    let lastName: String
    let age: Int
}

let people = [
                Person(firstName: "Michael", lastName: "Jordon", age: 35),
                Person(firstName: "Kobe", lastName: "Bryant", age: 25),
                Person(firstName: "Magic", lastName: "Jhonson", age: 40),
                Person(firstName: "Steph", lastName: "Curry", age: 22),
                Person(firstName: "Lebron", lastName: "James", age: 40),
                Person(firstName: "Kevin", lastName: "Durant", age: 35),
                Person(firstName: "Klay", lastName: "Thompson", age: 35),
                Person(firstName: "Charles", lastName: "Barkley", age: 35),
                Person(firstName: "Kenny", lastName: "Jhonson", age: 25),
                Person(firstName: "Clyde", lastName: "Drexler", age: 25),
                Person(firstName: "Vince", lastName: "Carter", age: 40),
                Person(firstName: "James", lastName: "Hardon", age: 42),
                Person(firstName: "Anthony", lastName: "Davis", age: 42),
                Person(firstName: "Vlade", lastName: "Divac", age: 35)
            ]

// -- Perform grouping by age
let peopleGroupByAge = Dictionary(grouping: people) { (person) -> Int in
    return person.age
}

// -- Perform grouping by lastName
let peopleGroupByLastName = Dictionary(grouping: people) { (person) -> Character in
    return person.lastName.first!
}

// -- Display results based on age groups
var groupedPersonsByAge = [[Person]]()

print("Printing by Age Groups")
let ageKeys = peopleGroupByAge.keys.sorted()

ageKeys.forEach { (key) in
    groupedPersonsByAge.append(peopleGroupByAge[key]!)
}

groupedPersonsByAge.forEach {
    $0.forEach({print($0)})
    print("-----")
}

// -- Display results based on LastName groups
var groupedPersonsByLastName = [[Person]]()

print("Printing by LastName Groups")
let lastNameKeys = peopleGroupByLastName.keys.sorted()

lastNameKeys.forEach { (key) in
    groupedPersonsByLastName.append(peopleGroupByLastName[key]!)
}

groupedPersonsByLastName.forEach {
    $0.forEach({print($0)})
    print("-----")
}
