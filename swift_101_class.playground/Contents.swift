import Foundation

class Job {
    var title : String
    var location : String
    var salary : Int
    var paymentDue : Date
    
    init(
        title : String,
        location : String,
        salary : Int,
        paymentDue : Date
    ) {
        self.title = title
        self.location = location
        self.salary = salary
        self.paymentDue = paymentDue
    }
    
    
}


class Person {
    var name : String
    var yearOfBirth, monthOfBirth, dayOfBirth : Int
    var job : Job? = nil
    var cash : Int = 0
    
    var id : String{
        get{
            return "\(name)_\(yearOfBirth)/\(monthOfBirth)/\(dayOfBirth)"
        }
    }
    
    
    var dateOfBirth : String {
        get{
            return "\(yearOfBirth)/\(monthOfBirth)/\(dayOfBirth)"
        }
    }
    
        
    init(
        name : String,
        yearOfBirth : Int,
        monthOfBirth : Int,
        dayOfBirth : Int,
        job : Job?
    ){
        self.name = name
        self.yearOfBirth = yearOfBirth
        self.monthOfBirth = monthOfBirth
        self.dayOfBirth = dayOfBirth
        self.job = job
    }
    
    convenience init(
        name : String,
        yearOfBirth : Int,
        monthOfBirth : Int,
        dayOfBirth : Int
    ){
        self.init(name:name, yearOfBirth:yearOfBirth,monthOfBirth:monthOfBirth, dayOfBirth:dayOfBirth, job:nil)
    }
    
    func hired(_ job : Job){
        self.job = job
    }
    
    func fired(){
        self.job = nil
    }
    
    func receivePayment(_ amount : Int){
        self.cash += amount
    }
}


let peter = Person(name:"peter",yearOfBirth: 1994,monthOfBirth: 09,dayOfBirth: 17)
print(peter)





