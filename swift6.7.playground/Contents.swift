//import UIKit
//
//class Bank{
//    static var coinsInBank = 10_000
//    static func distribute(coins numberOfCoinsRequested: Int) -> Int{
//        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
//        coinsInBank -= numberOfCoinsToVend
//        return numberOfCoinsToVend
//    }
//    static func receive(coins: Int){
//        coinsInBank += coins
//    }
//}
//class Player{
//    var coinsInPurse: Int
//    init(coins: Int){
//        coinsInPurse = Bank.distribute(coins: coins)
//    }
//    func win(coins: Int){
//        coinsInPurse += Bank.distribute(coins: coins)
//    }
//    deinit{
//        Bank.receive(coins: coinsInPurse)
//    }
//}
//var playerOne: Player? = Player(coins: 100)
//print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
//print("There are now \(Bank.coinsInBank) coins left in the bank")
//playerOne!.win(coins: 2_000)
//print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
//print("The bank now only has \(Bank.coinsInBank) coins left")
//
//playerOne = nil
//print("PlayerOne has left the game")
//print("The bank now has \(Bank.coinsInBank) coins")
//
//
//
//
//
//class Person{
//    var residence: Residence?
//}
//class Room{
//    let name: String
//    init(name: String){
//        self.name = name
//    }
//}
//class Address{
//    var buildingName: String?
//    var buildingNumber: String?
//    var street: String?
//    func buildingIdentifier() -> String?{
//        if buildingName != nil{
//            return buildingName
//        }else if let buildingNumber = buildingNumber, let street = street {
//            return "\(buildingNumber) \(street)"
//        }else{
//            return nil
//        }
//    }
//}
//class Residence{
//    var rooms: [Room] = []
//    var numberOfRooms: Int{
//        return rooms.count
//    }
//    subscript(i: Int) -> Room{
//        get{
//            return rooms[i]
//        }
//        set{
//            rooms[i] = newValue
//        }
//    }
//    func printNumberOfRooms(){
//        print("The number of room is \(numberOfRooms)")
//    }
//    var address: Address?
//}
//let john = Person()
////john.residence = Residence()
////可选链式调用代替强制解包
//if let roomCount = john.residence?.numberOfRooms{
//    print("John's residence has \(roomCount) room(s)")
//}else{
//    print("Unable to retrieve the number of rooms")
//}
//
//let someAddress = Address()
//someAddress.buildingNumber = "29"
//someAddress.street = "Road"
//john.residence?.address = someAddress
//
//let johnsAddress = Address()
//johnsAddress.buildingName = "The Larches"
//johnsAddress.street = "Laurel Street"
//john.residence?.address = johnsAddress
//
//if let johnsStreet = john.residence?.address?.street {
//    print("John's street name is \(johnsStreet).")
//} else {
//    print("Unable to retrieve the address.")
//}
//// 打印“John's street name is Laurel Street.” ???
//
//
//
//
//enum VendingMachineError: Error{
//    case invalidSelection
//    case insufficientFunds(coinsNeeded: Int)
//    case outOfStock
//}
//
//struct Item{
//    var price: Int
//    var count: Int
//}
//class VendingMachine{
//    var inventory = [
//        "Candy Bar": Item(price: 12, count: 7),
//        "Chips": Item(price: 10, count: 4),
//        "Pretzels": Item(price:7, count:11)
//    ]
//    var coinsDeposited = 0
//
//    func vend(itemNamed name: String) throws{
//        guard let item = inventory[name] else{
//            throw VendingMachineError.invalidSelection
//        }
//        guard item.count > 0 else{
//            throw VendingMachineError.outOfStock
//        }
//        guard item.price <= coinsDeposited else{
//            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
//        }
//        coinsDeposited -= item.price
//
//        var newItem = item
//        newItem.count -= 1
//        inventory[name] = newItem
//
//        print("Dispensing \(name)")
//    }
//}
//let favoriteSnacks = [
//    "Alice": "Chips",
//    "Bob": "Licorice",
//    "Eve": "Pretzels"
//]
//func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws{
//    let snackName = favoriteSnacks[person] ?? "Candy Bar"
//    try vendingMachine.vend(itemNamed: snackName)
//}
//struct PurchasedSnack {
//    let name: String
//    init(name: String, vendingMachine: VendingMachine) throws {
//        try vendingMachine.vend(itemNamed: name)
//        self.name = name
//    }
//}
//
////do-catch
//var vendingMachine = VendingMachine()
//vendingMachine.coinsDeposited = 8
//do{
//    try buyFavoriteSnack(person: "Eve", vendingMachine: vendingMachine)
//    print("Success! Yum.")
//}catch VendingMachineError.invalidSelection{
//    print("Invalid Selection.")
//}catch VendingMachineError.outOfStock{
//    print("Out of stock.")
//}catch VendingMachineError.insufficientFunds(let coinsNeeded){
//    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins")
//}catch{
//    print("Unexpected error: \(error).")
//}
//
//func eat(item: String) throws {
//    do {
//        try vendingMachine.vend(itemNamed: item)
//    } catch VendingMachineError.invalidSelection, VendingMachineError.insufficientFunds, VendingMachineError.outOfStock {
//        print("Invalid selection, out of stock, or not enough money.")
//    }
//}
//
//
//
//
//
//class MediaItem{
//    var name: String
//    init(name: String){
//        self.name = name
//    }
//}
//class Movie: MediaItem {
//    var director: String
//    init(name: String, director: String){
//        self.director = director
//        super.init(name: name)
//    }
//}
//class Song: MediaItem{
//    var artist: String
//    init(name: String, artist: String){
//        self.artist = artist
//        super.init(name: name)
//    }
//}
//let library = [
//    //可以推断出数组library的类型为MediaItem
//    Movie(name: "Casablanca", director: "Michael Curtiz"),
//    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
//    Movie(name: "Citizen Kane", director: "Orson Welles"),
//    Song(name: "The One And Only", artist: "Chesney Hawkes"),
//    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
//]
//var movieCount = 0
//var songCount = 0
//for item in library{
//    if item is Movie{
//        movieCount += 1
//    }else if item is Song{
//        songCount += 1
//    }
//}
//print("Media library contains \(movieCount) movies and \(songCount) songs")
//for item in library{
//    if let movie = item as? Movie{
//        print("Movie: \(movie.name), dir.\(movie.director)")
//    }else if let song = item as? Song{
//        print("Song: \(song.name), by\(song.artist)")
//    }
//}
//
//
//
//
//
//var things: [Any] = []
//
//things.append(0)
//things.append(0.0)
//things.append(42)
//things.append(3.14159)
//things.append("hello")
//things.append((3.0, 5.0))
//things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
//things.append({ (name: String) -> String in "Hello, \(name)" })
//
//for thing in things{
//    switch thing{
//    case 0 as Int:
//        print("zero as an Int")
//    case 0 as Double:
//        print("zero as a double")
//    case let someInt as Int:
//        print("an integer value of \(someInt)")
//    case let someDouble as Double where someDouble > 0:
//        print("some other double value that I don't want to print")
//    case let someString as String:
//        print("a string value of \"\(someString)\"")
//    case let (x, y) as (Double, Double):
//        print("an (x, y) point at \(x), \(y)")
//    case let movie as Movie:
//        print("a movie called \(movie.name), dir. \(movie.director)")
//    case let stringConverter as (String) -> String:
//        print(stringConverter("Michael"))
//    default:
//        print("something else")
//    }
//}
//
//let optionalNumber: Int? = 3
////things.append(optionalNumber)   会报警告
//things.append(optionalNumber as Any)
//
//
//
//
//
//extension Double{
//    var km: Double { return self * 1_000.0}
//    var m: Double { return self}
//    var cm: Double { return self / 100.0}
//    var mm: Double { return self / 1_000.0}
//    var ft: Double { return self / 3.28084}
//}
//let oneInch = 25.4.mm
//print("One inch is \(oneInch) meters")
//let threeFeet = 3.ft
//print("Three feet is \(threeFeet) meters")
//
//
//
//struct Size{
//    var width = 0.0, height = 0.0
//}
//struct Point{
//    var x = 0.0, y = 0.0
//}
//struct Rect{
//    var origin = Point()
//    var size = Size()
//}
//let defaultRect = Rect()
//let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
//extension Rect{
//    init(center: Point, size: Size){
//        let originX = center.x - (size.width / 2)
//        let originY = center.y - (size.width / 2)
//        self.init(origin: Point(x: originX, y: originY), size: size)
//    }
//}
//let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
//                      size: Size(width: 3.0, height: 3.0))
//
//
//
//
//
//extension Int{
//    func repetitions(task: () -> Void){
//        for _ in 0..<self {
//            task()
//        }
//    }
//    mutating func square() {
//        self = self * self
//    }
//}
//3.repetitions {
//    print("aaa")
//}
//var test = 5
//test.square()
//print("\(test)")
//
//
//
//
//
//
//protocol FullyNamed{
//    var fullName: String { get }
//}
////结构体
//struct Person1: FullyNamed{
//    var fullName: String
//}
////类
//class Starship: FullyNamed{
//    var prefix: String?
//    var name: String
//    init(name: String, prefix: String? = nil){
//        self.name = name
//        self.prefix = prefix
//    }
//    var fullName: String{
//        return (prefix != nil ? prefix! + " " : " ") + name
//    }
//}
//var ncc = Starship(name: "Enterprise", prefix: "USS")
//
//
//
////改变（异变）方法
//protocol Togglable{
//    mutating func toggle()
//}
//enum OnOffSwitch: Togglable{
//    case off, on
//    mutating func toggle() {
//        switch self{
//        case .off:
//            self = .on
//        case .on:
//            self = .off
//        }
//    }
//}
//var lightSwitch = OnOffSwitch.off
//lightSwitch.toggle()
//
//
//
//
////构造器
//protocol SomeProtocol{
//    init()
//}
//class SomeClass: SomeProtocol{
//    required init(){
//
//    }
//}
//class SomeSuperClass{
//    init(){
//
//    }
//}
//class SomeSubClass: SomeSuperClass, SomeProtocol{
//    required override init() {
//        <#code#>
//    }
//}
//
//


class PopupRequest {
    var priority = Int()
    var pr = Int()
    var name = String()
}
var request: [(A: Int, B: Int, name: String)] = [(2,1,"a"), (2,0,"b"), (2,1,"c"), (2,2,"d"),(1,1,"e"), (0,0,"f"),(1,0,"g"),(0,1,"h")]
request = request.sorted {
    if $0.A != $1.A {
        return $0.A < $1.A
    }
    else if $0.B != $1.B {
        return $0.B < $1.B
    }
    else {
        return $0.B < $1.B
    }
}
print("\(request)")
//request = request.sorted(by: {$0.B < $1.B})
//print("\(request)")
