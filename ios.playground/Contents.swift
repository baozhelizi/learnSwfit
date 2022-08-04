import UIKit

/*
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // 将当前音量限制在阈值之内
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // 存储当前音量作为新的最大输入音量
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}
var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentLevel = 8
print(leftChannel.currentLevel)                     //8
print(AudioChannel.maxInputLevelForAllChannels)     //8
rightChannel.currentLevel = 11
print(rightChannel.currentLevel)                    //10
print(AudioChannel.maxInputLevelForAllChannels)     //10
 */

/*
class Counter{
    var count = 0
    //让计数器按一递增
    func increment(){
        count += 1
        //self.count += 1
    }
    //让计数器按指定的整数递增
    func increment(by amount: Int){
        count += amount
    }
    //将计数器重置为0
    func reset(){
        count = 0
    }
}
let counter = Counter()
counter.increment()
counter.increment(by: 4)
counter.reset()
*/

/*
//使用self来区分参数名称和属性名称
//这个例子中如果不适应self前缀，会认为x的两个用法都引用了名为x的方法参数
struct Point{
    var x = 0.0, y = 0.0
    func isToTheRighttOf(x: Double) -> Bool{
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 6.0)
if somePoint.isToTheRighttOf(x: 1.0){
    print("This point is to the right of the line where x == 1.0")
}
*/

/*
struct Point{
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double){
        //x += deltaX; y += deltaY
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}
var somePoint = Point(x: 3.0, y: 4.0)
somePoint.moveBy(x: 1.0, y: 2.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
*/

/*
enum TriStateSwitch{
    case off, low, high
    mutating func next(){
        switch self{
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()
ovenLight.next()
*/

/*
struct LevelTracker{//监测玩家已解锁的最高等级，值存储在highest..中
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int){//新等级解锁就更新
        if level > highestUnlockedLevel{
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool{
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool{
        //在更新currentLevel之前检查所请求的新等级是否已经解锁
        if LevelTracker.isUnlocked(level){
            currentLevel = level
            return true
        }else{
            return false
        }
    }
}
class Player{
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int){
        LevelTracker.unlock(level + 1)
    }
    init(name: String){
        playerName = name
    }
}
var player = Player(name: "chocli")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
player = Player(name: "Beto")
if player.tracker.advance(to: 6){
    print("player is now on level 6")
}else{
    print("level 6 has not yet been unlocked")
}
 */

/*
struct Matrix{
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int){
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool{
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double{
        get{
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set{
            assert(indexIsValid(row: row, column: column),
        "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
var matrix = Matrix(rows: 2, columns: 2)
 */



/*
//继承
class Vehicle
{
    var currentSpeed = 0.0
    var description: String{
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise(){
        
    }
}
let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")
//Bicycle子类
class Bicycle: Vehicle{
    var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")
//Tandem 双人自行车子类
class Tandem: Bicycle{
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentSpeed = 22.0
tandem.currentNumberOfPassengers = 2
print("Tandem: \(tandem.description)")
//Train子类
class Train: Vehicle{
    override func makeNoise() {
        print("Choo Choo")
    }
}
let train = Train()
train.makeNoise()
//Car子类
class Car: Vehicle{
    var gear = 1
    override var description: String{
        return super.description + "in gear \(gear)"
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
//AutomaticCar子类    重写属性观察器
class AutomaticCar: Car{
    override var currentSpeed: Double{
        didSet{
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
 */

/*
struct Color{
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double){
        red = white
        green = white
        blue = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)//必须要实参标签
//如果不想用实参标签，如init(_celsius: Double)这样的构造器，从而可以通过提供未命名的值来调用构造器

class SurveyQuestion{
    var text: String
    var response: String?
    init(text: String){
        self.text = text
    }
    func ask(){
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes"
*/

class Vehicle{
    var numberOfWheels = 0
    var description: String{
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")
//Bicycle子类
class Bicycle: Vehicle{
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")
//Hoverboard子类
class Hoverboard: Vehicle{
    var color: String
    init(color: String){
        self.color = color
        //super.init() 在这里被隐式调用
    }
    override var description: String{
        return "\(super.description) in a beautiful \(color)"
    }
}
let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")



//指定构造器、便利构造器以及构造器的自动继承
class Food{
    var name: String
    init(name: String){//指定构造器
        self.name = name
    }
    convenience init( ){
        self.init(name: "[Unnamed]")
    }
}
let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food()

class RecipeIngredient: Food{
    var quantity: Int
    init(name: String, quantity: Int){
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String){//便利构造器
        self.init(name: name, quantity: 1)
    }
}
//ShoppingListItem子类
class ShoppingListItem: RecipeIngredient{
    var purchased = false
    var description: String{
        var output = "\(quantity) * \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}
var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList{
    print(item.description)
}
