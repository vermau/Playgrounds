import Foundation

enum Message {
    case text(userID: String, contents: String, date: Date)
    case draft(userID: String, date: Date)
    case join(userID: String, date: Date)
    case leave(userID: String, date: Date)
    case baloon(userID: String, date: Date)
}

func logMessage(message: Message) {
    if case let Message.text(userID: id, contents: contents, date: date) = message {
        print("[\(date) : User \(id)] > \(contents)")
    }
}

let joinMessage = Message.join(userID: "2", date: Date())
let textMessage = Message.text(userID: "2", contents: "Hello World!", date: Date())

logMessage(message: joinMessage)
logMessage(message: textMessage)
