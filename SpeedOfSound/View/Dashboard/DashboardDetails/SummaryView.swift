import SwiftUI
import HealthKit
import SwiftUICharts

struct SummaryView: View {
    @StateObject var rowDetailsViewModel: DashboardDetailsViewModel

    var body: some View {
        VStack(alignment: .leading) {
            FeedbackView(rowDetailsViewModel: rowDetailsViewModel)
            Divider()
                .background(Color(UIColor.systemGray2))
            
            AgeView(rowDetailsViewModel: rowDetailsViewModel)
            Divider()
                .background(Color(UIColor.systemGray2))
            
            NumberOfTimesView(rowDetailsViewModel: rowDetailsViewModel)
            Divider()
                .background(Color(UIColor.systemGray2))
            
            RangeCadenceView(rowDetailsViewModel: rowDetailsViewModel)
            Divider()
                .background(Color(UIColor.systemGray2))
            
//            DistanceStepsView(rowDetailsViewModel: rowDetailsViewModel)
//            Divider()
//                .background(Color(UIColor.systemGray2))
            
            VStack(alignment: .leading, spacing: 25) {
                Text("心率概況")
                    .foregroundColor(.white)
                VStack {
                    DoughnutChart(chartData: rowDetailsViewModel.hearRatePercentageData)
                        .touchOverlay(chartData: rowDetailsViewModel.hearRatePercentageData)
//                        .headerBox(chartData: rowDetailsViewModel.heartRatePercetages)
                        .legends(chartData: rowDetailsViewModel.hearRatePercentageData, columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())])
                        .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
                        .id(rowDetailsViewModel.hearRatePercentageData.id)
                        .padding(.vertical)
                }
                .frame(height: 150)
            }
        }
        .cardStyle()
        .padding([.leading, .trailing])
        .offset(y: -80)
    }
}

struct FeedbackView: View {
    @StateObject var rowDetailsViewModel: DashboardDetailsViewModel

    var cadence: some View {
        VStack(alignment: .trailing, spacing: 5) {
            if rowDetailsViewModel.detailsModel.feedbackStyle == "Sound" {
                Text("節奏")
            } else {
                Text("起始節奏")
            }
            Text("\(rowDetailsViewModel.detailsModel.cadence)")
                .workoutTitleStyle()
            + Text(" BPM")
                .workoutSubheadlineStyle()
        }
    }
    
    var feedback: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("選擇節奏")
                .bold()
                .foregroundColor(.white)
            HStack {
                NavigationLink(destination: FeedbackDetailView(rowDetailsViewModel: rowDetailsViewModel)) {
                    HStack {
                        Text("\(rowDetailsViewModel.detailsModel.feedbackStyle): \(rowDetailsViewModel.detailsModel.cadence) BPM")
                            .bold()
                            .font(.body)
                            .foregroundColor(.white)
                    }
                    .padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5))
                    .background(.blue)
                    .cornerRadius(45)
                }
            }
        }
    }
    
    var standard_deviation: some View {
        VStack(alignment: .trailing, spacing: 5) {
            Text("標準差")
                .foregroundColor(.white)
            Text("\(rowDetailsViewModel.standard_deviation)")
                .workoutTitlCyan()
        }
    }

    
    var body: some View {
        HStack {
            feedback
            Spacer()
            standard_deviation
//            cadence
        }
    }
}

struct AgeView: View {
    @StateObject var rowDetailsViewModel: DashboardDetailsViewModel
    
    var average: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("平均修正時間")
                .foregroundColor(.white)
            Text("\(rowDetailsViewModel.meanCorrectionTime)")
                .workoutTitleRed()
            + Text(" seconds")
                .workoutSubheadlineStyle()
        }
    }
    
    var age: some View {
        VStack(alignment: .trailing, spacing: 5) {
            Text("年齡")
                .foregroundColor(.white)
            Text("\(rowDetailsViewModel.detailsModel.age)")
                .workoutTitlCyan()
            + Text(" years old")
                    .workoutSubheadlineStyle()
        }
    }
    
    var restingHeartRate: some View {
        VStack(alignment: .trailing, spacing: 5) {
            Text("靜息心率")
            Text("\(rowDetailsViewModel.detailsModel.restingHeartRate)")
                .workoutTitleRed()
            + Text(" BPM")
                    .workoutSubheadlineStyle()
        }
    }
    
    var body: some View {
        HStack {
            average
            Spacer()
            age
        }
    }
}

struct NumberOfTimesView: View {
    @StateObject var rowDetailsViewModel: DashboardDetailsViewModel
    
    var numberOfTimes: some View {
        VStack(alignment: .trailing, spacing: 5) {
            Text("抬腕次數")
                .foregroundColor(.white)
            Text("\(rowDetailsViewModel.detailsModel.numberOfTimeGotLooked)")
                .workoutTitleRed()
            + Text(" times")
                    .workoutSubheadlineStyle()
        }
    }
    
    var numberOfFeedback: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("反饋次數")
                .foregroundColor(.white)
            Text("\(rowDetailsViewModel.detailsModel.numberOfFeedback)")
                .workoutTitlBlue()
            + Text(" times")
                    .workoutSubheadlineStyle()
        }
    }
    
    var body: some View {
        HStack {
            numberOfFeedback
            Spacer()
            numberOfTimes
        }
    }
}

struct DistanceStepsView: View {
    @StateObject var rowDetailsViewModel: DashboardDetailsViewModel
    
    var duration: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("時長")
            HStack(spacing: 1) {
                if rowDetailsViewModel.detailsModel.getDuration().0 != 0 {
                    Text("\(rowDetailsViewModel.detailsModel.getDuration().0)")
                        .workoutTitleYellow()
                    Text(" hr ")
                        .workoutSubheadlineStyle()
                }
                if rowDetailsViewModel.detailsModel.getDuration().1 != 0 {
                    Text("\(rowDetailsViewModel.detailsModel.getDuration().1)")
                        .workoutTitleYellow()
                    Text(" min")
                        .workoutSubheadlineStyle()
                }
                Text(" \(rowDetailsViewModel.detailsModel.getDuration().2)")
                    .workoutTitleYellow()
                Text(" sec")
                    .workoutSubheadlineStyle()
            }
        }
    }
    
    var distance: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("距離")
            Text(rowDetailsViewModel.detailsModel.distance)
                .workoutTitlCyan()
            + Text(" km")
                .workoutSubheadlineStyle()
        }
    }
    
    var body: some View {
        HStack {
            distance
            Spacer()
            duration
        }
    }
}

struct RangeCadenceView: View {
    @StateObject var rowDetailsViewModel: DashboardDetailsViewModel
    
    var range: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("心率區間(根據年齡設定)")
                .foregroundColor(.white)
            Text("\(rowDetailsViewModel.detailsModel.lowBPM)")
                .workoutTitleHighZone()
            + Text(" -- ")
                .workoutSubheadlineStyle()
            + Text("\(rowDetailsViewModel.detailsModel.highBPM)")
                .workoutTitleHighZone()
            + Text(" BPM")
                .workoutSubheadlineStyle()
        }
    }
    
    var steps: some View {
        VStack(alignment: .trailing, spacing: 5) {
            Text("平均步頻")
                .foregroundColor(.white)
            Text("\(rowDetailsViewModel.averageCadence)")
                .workoutTitleStyle()
            + Text(" SPM")
                .workoutSubheadlineStyle()
        }
    }
    var body: some View {
        HStack {
            range
            Spacer()
            steps
        }
    }
}
