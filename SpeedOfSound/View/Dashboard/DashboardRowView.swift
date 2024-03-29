import SwiftUI
import HealthKit

struct Constants {
    static let widgetMediumHeight: CGFloat = 169
    static let widgetLargeHeight: CGFloat = 376
}

struct DashboardRowView: View {
    let workouts: [HKWorkout]
    let type: HKWorkoutActivityType
    var animation: Namespace.ID
    var workoutsCount: Int {
            workouts.count
        }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            TitleWorkouts(type: type)
            Text("你有 \(workouts.count) 個運動紀錄")
                .font(Font.body.bold())
                .foregroundColor(Color.white)
            Divider()
                .background(Color(UIColor.systemGray2))
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 20) {
                    ForEach(Array(workouts.prefix(workouts.count)).batched(into: 4), id: \.self) { items in
                        ThreeRowWorkouts(workouts: items)
                    }
                }
            }
        }
        .cardStyle()
        .frame(maxHeight: Constants.widgetLargeHeight)
    }
}

struct TitleWorkouts: View {
    let type: HKWorkoutActivityType
    @ViewBuilder
    func showView(imageName: String, name: String) -> some View {
         HStack {
             Image(imageName)
                .resizable()
                .foregroundColor(Color(UIColor.systemGray))
                .frame(width: 50, height: 50, alignment: .center)
             Text(name)
                .foregroundColor(Color("Green"))
                .padding()
             Spacer()
             Button {
             } label: {
                 Image(systemName: "hand.tap")
                     .foregroundColor(Color("Green"))
             }
        }
    }
    
    var body: some View {
        HStack(spacing: 3) {
            if type == .running {
                showView(imageName: "running", name: "Running test")

            } else if type == .walking {
                showView(imageName: "walking", name: "運動紀錄")
            }
        }
        .font(Font.body.bold())
        .foregroundColor(Color("Main"))
    }
}

struct ThreeRowWorkouts: View {
    let workouts: [HKWorkout]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            ForEach(Array(workouts.enumerated()), id: \.offset) { (offset, element) in
                NavigationLink {
                    ZStack {
                        Color.white.edgesIgnoringSafeArea(.all)
                        DashboardDetailsView(rowDetailsViewModel: DashboardDetailsViewModel(workout: element))
                    }
                } label: {
                    WorkoutRowView(workout: WorktoutDetailsModel(workout: element))
                }
            }
            Spacer()
        }
    }
}

struct WorkoutRowView: View {
    let workout: WorktoutDetailsModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            VStack(alignment: .leading, spacing: -2)  {
                if workout.indoorWorktoutMeta == "Indoor " {
                    Text(workout.indoorWorktoutMeta)
                        .font(.caption).bold().foregroundColor(Color("Main")) +
                    Text(workout.activityName)
                        .font(.caption).bold().foregroundColor(Color("Main"))
                } else {
                    Text(workout.indoorWorktoutMeta)
                        .font(.caption).bold().foregroundColor(Color("MainHighlight")) +
                    Text(workout.activityName)
                        .font(.caption).bold().foregroundColor(Color("MainHighlight"))
                }
                HStack() {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack(spacing: 1) {
                            if workout.getDuration().0 != 0 {
                                Text("\(workout.getDuration().0)")
                                    .workoutTitleYellow()
                                Text(" hr ")
                                    .workoutSubheadlineStyle()
                            }
                            if workout.getDuration().1 != 0 {
                                Text("\(workout.getDuration().1)")
                                    .workoutTitleYellow()
                                Text(" min")
                                    .workoutSubheadlineStyle()
                            }
                            Text(" \(workout.getDuration().2)")
                                .workoutTitleYellow()
                            Text(" sec")
                                .workoutSubheadlineStyle()
                        }
                    }
                    Spacer()
                    Text(workout.feedbackStyle)
                        .workoutTitlBlue()
                    VStack {
                        Text(workout.date)
                            .workoutSubheadlineGreen()
                    }
//                    .offset(y: 1)
                    Divider()
                        .background(Color(UIColor.systemGray2))
                }
                .frame(maxHeight: 40)
            }
        }
        .foregroundColor(Color.white)
    }
}
