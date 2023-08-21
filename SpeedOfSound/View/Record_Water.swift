
//
//  SwiftUIView.swift
//  AquaPulse
//
//  Created by 許桓菘 on 2023/6/18.
//
import CoreData
import SwiftUI
struct Record_Water: View {
    @State var currentDate: Date = Date()
    @State var currentMonth: Int = 0
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var drink_test: FetchedResults<CDdrink_item>
    @FetchRequest(sortDescriptors: []) var DrinkMetaData_test: FetchedResults<CDDrinkMetaData>
    var body: some View {
        ScrollView {
            VStack(spacing: 35){
                /*Rectangle()
                 .foregroundColor(Color.white).opacity(0.8)
                 .cornerRadius(20)
                 .frame(height:400)*/
                VStack{
                    HStack(spacing: 10) {
                        Image(systemName: "drop.fill").font(.title)
                        Text("運動計畫").font(.title)
                    }.padding()
                    
                    
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
                                    currentMonth -= 1
                                    print(getCurrentMonth())
                                    print(currentDate)
                                    print(extraDate())
                                }
                            }label: {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color.black)
                            }
                            Button() {
                                withAnimation{
                                    currentMonth += 1
                                    print(getCurrentMonth())
                                    print(extraDate())
                                    
                                }
                                
                            }label: {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.black)
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
                    }.padding().frame(maxWidth:.infinity,alignment:.leading)
                        .background(
                            Color.white
                                .cornerRadius(10)
                                
                        )
                    
                        .padding(5)
                    
                    
                    /*HStack{
                        Color.white
                            .frame(width: UIScreen.main.bounds.width/3.6, height: UIScreen.main.bounds.width/3.6)
                            .aspectRatio(1, contentMode: .fit)
                            .cornerRadius(10)
                            .overlay(
                                HStack{
                                    Image(systemName: "drop.fill")
                                        .font(.system(size: 20))
                                        .padding(.leading, 10.0)

                                    VStack {
                                        HStack{
                                            Text("總共")
                                                    .font(.system(size: 12))
                                                    .multilineTextAlignment(.leading)

                                            Spacer()
                                        }.padding(.bottom, 1.0)
                                        
                                        Text("1000 ml")
                                            .font((.system(size: 18)))
                                            .multilineTextAlignment(.trailing)
                                        }
                                    
                                }
                                
                            );
                        Color.white
                            .frame(width: UIScreen.main.bounds.width/3.6, height: UIScreen.main.bounds.width/3.6)
                            .aspectRatio(1, contentMode: .fit)
                            .cornerRadius(10)
                            .overlay(
                                HStack{
                                    Image(systemName: "calendar")
                                        .font(.system(size: 20))
                                        .padding(.leading, 10.0)

                                    VStack {
                                        HStack{
                                            Text("最常")
                                                    .font(.system(size: 12))
                                                    .multilineTextAlignment(.leading)

                                            Spacer()
                                        }.padding(.bottom, 1.0)
                                        
                                        Text("水")
                                            .font((.system(size: 18)))
                                            .multilineTextAlignment(.trailing)
                                    }
                                    
                                }
                                
                            );                        Color.white
                            .frame(width: UIScreen.main.bounds.width/3.6, height: UIScreen.main.bounds.width/3.6)
                            .aspectRatio(1, contentMode: .fit)
                            .cornerRadius(10)
                            .overlay(
                                HStack{
                                    Image(systemName: "target")
                                        .font(.system(size: 20))
                                        .padding(.leading, 10.0)

                                    VStack {
                                        HStack{
                                            Text("連續")
                                                    .font(.system(size: 15))
                                                    .multilineTextAlignment(.leading)

                                            Spacer()
                                        }.padding(.bottom, 1.0)
                                        
                                        Text("1 天")
                                            .font((.system(size: 18)))
                                            .multilineTextAlignment(.trailing)
                                        }
                                    
                                }
                                
                            );
                        
                    }*/
                    
                    
                    VStack(spacing: 15){
                        Text("Drinks").font(.title2.bold()).frame(maxWidth: .infinity,alignment:.leading)
                        
                        if let drink = DrinkMetaData_test.first(where: { drink in
                            return isSameDay(date1: getSampleDate(offset: Int(drink.float)), date2: currentDate)
                        }){
                            ForEach(drink.relationship_drinkitem?.allObjects as? [CDdrink_item] ?? [], id: \.self) { drinkItem in
                                HStack{
                                    Image(drinks[Int(drinkItem.drink_num)].image)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                    VStack(alignment: .leading,spacing:  10){
                                        HStack{
                                            Text(String(drinks[Int(drinkItem.drink_num)].name))
                                            Spacer()
                                            Text("容量").font(.system(size: 12))
                                            Text(String(Int(drinkItem.ml)))
                                        }
                                        HStack{
                                            Text(String(Int(Float(drinkItem.ml)*drinks[Int(drinkItem.drink_num)].proportion))).font(.title2.bold())
                                            Spacer()
                                            Text("水佔比").font(.system(size: 12))
                                            Text(String(drinks[Int(drinkItem.drink_num)].proportion))
                                        }
                                                                            }
                                    Spacer()
                                    /*Image(systemName: "xmark")
                                        .font(.system(size: 10))
                                        .foregroundColor(.white)
                                        .padding(2)
                                        .background(Color.red)
                                        .cornerRadius(10)
                                        .offset(x: 10, y: -30)*/
                                }
                                .padding(.vertical,10)
                                .padding(.horizontal)
                                .frame(maxWidth:.infinity,alignment:.leading)
                                .background(
                                    Color.white
                                        .cornerRadius(10)
                                )
                            }
                            
                        }
                        
                        if let drink = drinks_recrod.first(where: { drink in
                            return isSameDay(date1: drink.drinkDate, date2: currentDate)
                        }){
                            ForEach(drink.drink){drink in
                                HStack{
                                    Image(drinks[drink.num].image)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                    VStack(alignment: .leading,spacing:  10){
                                        Text(String(drinks[drink.num].name))
                                        
                                        Text(String(drink.ml*drinks[drink.num].proportion)).font(.title2.bold())
                                    }
                                    
                                }
                                .padding(.vertical,10)
                                .padding(.horizontal)
                                .frame(maxWidth:.infinity,alignment:.leading)
                                
                                .background(
                                    Color.white
                                        .cornerRadius(10)
                                )
                                
                            }
                        }else{
                            Text("No drink Found")
                        }
                        ////
                    }
                    .padding(.top,20)
                    Rectangle()
                        .foregroundColor(Color.white).opacity(0)
                        .cornerRadius(20)
                        .frame(height:200)
                    
                    
                }.padding()
                
                
                
                
                
                
                
            }
            
        }
        
        
    }
    
    @ViewBuilder
    func CardView(value: DateValue)-> some View{
        VStack{
            
            if value.day != -1{
                /*if let task = tasks.first(where: {task in
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
                 }*/
                if let drink = drinks_recrod.first(where: {drink in
                    return isSameDay(date1: drink.drinkDate, date2: value.date)
                }){
                    Text("\(value.day)").font(.title3.bold())
                        .foregroundColor(isSameDay(date1: drink.drinkDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                    Circle()
                        .foregroundColor(isSameDay(date1: drink.drinkDate, date2: currentDate) ? .white : Color.blue)
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
        let date = formatter.string(from: getCurrentMonth())
        
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


