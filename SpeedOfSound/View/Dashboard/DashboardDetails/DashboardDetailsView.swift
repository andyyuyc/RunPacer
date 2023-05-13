import SwiftUI
import HealthKit
import SwiftUICharts

struct DashboardDetailsView: View {
    @StateObject var rowDetailsViewModel: DashboardDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                HeartRateRangeView(rowDetailsViewModel: rowDetailsViewModel)
                SummaryView(rowDetailsViewModel: rowDetailsViewModel)
            }
        }
        .navigationTitle("運動分析")
        .onAppear() {
            rowDetailsViewModel.getHeartRates()
            rowDetailsViewModel.getSteps()
        }
    }
}
