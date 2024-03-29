import SwiftUI
import SwiftUICharts

struct HeartRateRangeView: View {
    @StateObject var rowDetailsViewModel: DashboardDetailsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            LineChart(chartData: rowDetailsViewModel.heartRateData)
                .touchOverlay(chartData: rowDetailsViewModel.heartRateData, specifier: "%.0f")
                .yAxisPOI(chartData: rowDetailsViewModel.heartRateData,
                          markerName: "高心率",
                          markerValue: Double(rowDetailsViewModel.detailsModel.highBPM),
                          labelPosition: .center(specifier: "%.0f"),
                          labelColour: .black,
                          labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
                          lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
                          strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
                .yAxisPOI(chartData: rowDetailsViewModel.heartRateData,
                          markerName: "低心率",
                          markerValue: Double(rowDetailsViewModel.detailsModel.lowBPM),
                          labelPosition: .center(specifier: "%.0f"),
                          labelColour: .black,
                          labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
                          lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
                          strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
                .averageLine(chartData: rowDetailsViewModel.heartRateData,
                             strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
                .xAxisGrid(chartData: rowDetailsViewModel.heartRateData)
                .yAxisGrid(chartData: rowDetailsViewModel.heartRateData)
                .xAxisLabels(chartData: rowDetailsViewModel.heartRateData)
                .yAxisLabels(chartData: rowDetailsViewModel.heartRateData)
                .infoBox(chartData: rowDetailsViewModel.heartRateData)
//                .headerBox(chartData: rowDetailsViewModel.heartRateData)
                .legends(chartData: rowDetailsViewModel.heartRateData, columns: [GridItem(.flexible()), GridItem(.flexible())])
                .id(rowDetailsViewModel.heartRateData.id)
                .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 250, maxHeight: 400, alignment: .center)
                .offset(y: -50)
        }
        .frame(height: 400)
//        .frame(maxHeight: Constants.widgetLargeHeight)
        .padding([.leading, .trailing, .top])
    }
}
