import SwiftUI
import HealthKit

struct SummaryTitleWorkouts: View {
    let type: HKWorkoutActivityType
    var detailsModel: WorktoutDetailsModel

    var body: some View {
        HStack(spacing: 3) {
            Image(type.associatedImageName)
                .resizable()
                .foregroundColor(Color(UIColor.systemGray))
                .frame(width: 80, height: 80, alignment: .center)
            VStack(alignment: .leading) {
                Text(detailsModel.indoorWorktoutMeta)
                    .bold()
                    .font(.title2)
                    .foregroundColor(Color("Main")) +
                Text(type.name)
                    .bold()
                    .font(.title2)
                    .foregroundColor(Color("Main"))
                HStack(alignment: .center, spacing: 5) {
                    Text(detailsModel.startTime)
                        .workoutSubheadlineStyle()
                    Text("-")
                        .workoutSubheadlineStyle()
                    Text(detailsModel.endTime)
                        .workoutSubheadlineStyle()
                }
            }
            .padding()
        }
        .font(Font.body.bold())
    }
}
