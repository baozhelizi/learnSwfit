//import UIKit
//
//var greeting = "Hello, playground"
//
//struct Stack<Element> {
//    var items: [Element] = []
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        return items.removeLast()
//    }
//}
//var stackOfStrings = Stack<String>()
//stackOfStrings.push("uno")
//stackOfStrings.push("dos")
//stackOfStrings.push("tres")
//let fromTheTop = stackOfStrings.pop()
//
//extension Stack{
//    var topItem: Element?{//可以访问Stack的顶端元素且不移除
//        return items.isEmpty ? nil : items[items.count - 1]
//    }
//}
//
//
//
//
//
//class Customer{
//    let name: String
//    var card: CreditCard?
//    init(name: String){
//        self.name = name
//    }
//    deinit{
//        print("\(name) is being deinitialized")
//    }
//}
//class CreditCard{
//    let number: UInt
//    unowned let customer: Customer
//    init(number: UInt, customer: Customer){
//        self.number = number
//        self.customer = customer
//    }
//    deinit{
//        print("Card #\(number) is being deinitialized")
//    }
//}
//var john: Customer?
//john = Customer(name: "John Appleseed")
//john!.card = CreditCard(number: 1234_1234_1234_1234, customer: john!)
//
//
//
//
//class Department{
//    var name: String
//    var courses: [Course]
//    init(name: String){
//        self.name = name
//        self.courses = []
//    }
//}
//class Course{
//    var name: String
//    unowned var department: Department
//    unowned var nextCourse: Course?
//    init(name: String, in department: Department){
//        self.name = name
//        self.department = department
//        self.nextCourse = nil
//    }
//}
//let department = Department(name: "Horticulture")
//let intro = Course(name: "Survey of Plants", in: department)
//let intermediate = Course(name: "Growing Common Herbs", in: department)
//let advanced = Course(name: "Caring for Tropical Plants", in: department)
//intro.nextCourse = intermediate
//intermediate.nextCourse = advanced
//department.courses = [intro, intermediate, advanced]
//
//
//
//class Country{
//    let name: String
//    var capitalCity: City!  //将Country的capitalCity属性声明为隐式解包可选值类型的属性
//    init(name: String, capitalName: String){
//        self.name = name
//        self.capitalCity = City(name: capitalName, country: self)
//    }
//}
//class City{
//    let name: String
//    unowned let country: Country
//    init(name: String, country: Country){
//        self.name = name
//        self.country = country
//    }
//}
////可以通过一条语句同时创建Country和City的实例，不产生循环强引用，且capitalCity的属性能被直接访问，不需要通过感叹号来解包他的可选值
//var country = Country(name: "Canada", capitalName: "Ottawa")
//print("\(country.name)'s capital city is called \(country.capitalCity.name)")
//
//
//
//
//
//class HTMLElement{
//    let name: String
//    let text: String?
//
//    lazy var asHTML: () -> String = {
//        //无主引用解决循环强引用
//        [unowned self] in
//        if let text = self.text{
//            return "<\(self.name)> \(text) </ \(self.name)>"
//        }else{
//            return "<\(self.name) />"
//        }
//    }
//    init(name: String, text: String? = nil){
//        self.name = name
//        self.text = text
//    }
//    deinit{
//        print("\(name) is being deinitialized")
//    }
//}
//var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello world")
//print(paragraph!.asHTML())
//let heading = HTMLElement(name: "h1")
//let defaultText = "some default text"
//heading.asHTML = {
//    return "<\(heading.name)> \(heading.text ?? defaultText) </\(heading.name)>"
//}
//print(heading.asHTML())

//import Foundation
//
//

//var test: [Int] = [2,1,3,0]
//test.sorted()
//print("\(test)")


//struct BlogPost {
//    let title: String
//    let pageView: Int
//    let sessionDuration: Double
//}
//extension BlogPost {
//    static var examples: [BlogPost] = [
//        BlogPost(title: "Alice", pageView: 1, sessionDuration: 3),
//        BlogPost(title: "Peter", pageView: 1, sessionDuration: 2),
//        BlogPost(title: "Kofi", pageView: 1, sessionDuration: 1),
//        BlogPost(title: "Akosua", pageView: 5, sessionDuration: 2),
//        BlogPost(title: "Abena", pageView: 4, sessionDuration: 10)
//    ]
//}
//var q = BlogPost.examples.sorted(by: {$0.pageView < $1.pageView})
//print("\(q)")


class PopupRequest {
    var priority = Int()
    var pr = Int()
    var name = String()
}
var request: [(A: Int, B: Int)] = [(1,1), (0,0),(1,0),(0,1)]
request = request.sorted(by: {$0.A > $1.A})
print("\(request)")
request = request.sorted(by: {$0.B > $1.B})
print("\(request)")
