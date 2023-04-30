//
//  CustomDatePicker.swift
//  Water
//
//  Created by 許桓菘 on 2023/4/29.
//

import SwiftUI

struct Record_Water: View {
    @State var currentDate: Date = Date()
    @State var currentMonth: Int = 0
    var body: some View {
        ZStack{
            VStack(spacing: 35){
                ZStack{
                    
                    GeometryReader{ proxy in
                        Rectangle()
                            .foregroundColor(Color.white).opacity(0.8)
                            .cornerRadius(20)
                            .frame(height:400)
                        VStack{
                            let days: [String] =
                            ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
                            HStack(spacing: 20){
                                VStack(alignment: .leading,spacing: 10) {
                                    Text(extraDate()[0]).font(.caption).fontWeight(.semibold)
                                    Text(extraDate()[1]).font(.title)
                                    
                                }
                                Spacer()
                                Button() {
                                    withAnimation{
                                        print(currentDate)
                                        currentMonth -= 1
                                    }
                                }label: {
                                    Image(systemName: "chevron.left")
                                }
                                Button() {
                                    withAnimation{
                                        print(currentDate)
                                        currentMonth -= 1
                                    }
                                    
                                }label: {
                                    Image(systemName: "chevron.right")
                                }
                            }
                            
                            HStack(spacing: 0){
                                ForEach(days,id: \.self){day in
                                    
                                    Text(day)
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                        .frame(maxWidth: .infinity)
                                    
                                }
                            }
                            let columns = Array(repeating: GridItem(.flexible()), count: 7)
                            
                            LazyVGrid(columns: columns, spacing: 15){
                                ForEach(extractDate()){value in
                                    CardView(value: value)
                                    .background(
                                        Capsule().fill(Color.blue)
                                            .padding(.horizontal,8)
                                            .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                                    )
                                    .onTapGesture {
                                        currentDate = value.date
                                    }
                                }
                            }
                        }.padding()
                    }
                    
                }
                
                
                
            }.onChange(of: currentMonth) { newValue in
                currentDate = getCurrentMonth()
            }.padding()
            
        }.ignoresSafeArea()
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top).background(Color("BG"))
        
    }
    
    @ViewBuilder
    func CardView(value: DateValue)-> some View{
        VStack{
            
            if value.day != -1{
                if let task = tasks.first(where: {task in
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }){
                    Text("\(value.day)").font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                    Circle()
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : Color.blue)
                        .frame(width: 8,height: 8)
                }
                else{
                    Text("\(value.day)").font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
            }
        }.frame(height:32,alignment: .top)
    }
    func isSameDay(date1: Date,date2: Date)->Bool{
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func extraDate()->[String]{
        let formatter = DateFormatter()
        formatter.dateFormat="YYYY MMMM"
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    func getCurrentMonth()->Date{
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date())else{
            return Date()
        }
        return currentMonth
        
    }
    func extractDate()->[DateValue]{
        
        let calendar = Calendar.current
        let currentMonth = getCurrentMonth()
        var days = currentMonth.getAllDate().compactMap{ date -> DateValue
            in
            
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1,date: Date()),at:0)
            
        }
        return days
    }
    
}

struct Record_Water_Previews: PreviewProvider {
    static var previews: some View {
        Record_Water()
    }
}


extension Date{
    func getAllDate()->[Date]{
        let calendar = Calendar.current
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        
        return range.compactMap{day -> Date in
            return calendar.date(byAdding: .day,value: day - 1 , to: startDate)!
        }
    }
}
