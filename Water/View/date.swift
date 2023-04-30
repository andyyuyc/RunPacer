import SwiftUI

struct Task: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date ()
}
struct TaskMetaData: Identifiable{
    var id = UUID() .uuidString
    var task: [Task]
    var taskDate: Date
}
func getSampleDate(offset: Int)->Date{
    let calender = Calendar.current
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date ()
}
var tasks: [TaskMetaData] = [
    TaskMetaData (task: [
        Task(title: "Talk to Justine"),
        Task(title: "iPhone 13 Great Design Change"),
        Task(title: "Nothing Much Workout !!!")
    ], taskDate: getSampleDate(offset: 1)),
    TaskMetaData(task: [
        Task(title: "Talk to Jenna Ezarik")
    ], taskDate: getSampleDate(offset: -3)),
    
    TaskMetaData(task: [
        Task(title: "Meeting with Tim Cook")
    ], taskDate: getSampleDate(offset: -8)),
    
    TaskMetaData(task: [
        Task(title: "Next Version of SwiftUI")
    ], taskDate: getSampleDate(offset: 10)),
    
    TaskMetaData(task: [
        Task(title: "Nothing Much Workout !!!")
    ], taskDate: getSampleDate (offset: -22)),
    
    TaskMetaData( task: [
        Task (title: "iPhone 13 Great Design Change")
    ], taskDate: getSampleDate(offset: 15)),
    
    TaskMetaData(task: [
        Task(title: "Kavsoft App Updates....")
    ], taskDate: getSampleDate(offset: -20))
]
