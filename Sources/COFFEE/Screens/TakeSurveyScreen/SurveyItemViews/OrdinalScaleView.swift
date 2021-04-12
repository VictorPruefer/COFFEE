//
//  OrdinalScaleView.swift
//  comf.io
//
//  Created by Vico on 22.02.21.
//

import SwiftUI

struct OrdinalScaleView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    @EnvironmentObject var surveyViewModel: TakeSurveyScreen.ViewModel
        
    var body: some View {
        ForEach(viewModel.steps.indices, id: \.self) { stepIndex in
            Button(action: { viewModel.selectStep(stepIndex: stepIndex) }, label: {
                VStack(alignment: .leading) {
                    HStack(alignment: .center, spacing: 6) {
                        Image(systemName: "circle.fill").font(.callout)
                            .foregroundColor(Color(UIColor.init(hexString: viewModel.steps[stepIndex].color)))
                        Text(viewModel.steps[stepIndex].label)
                            .font(.callout)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                }.padding(.leading, 8)
                .padding(.trailing)
                .padding(.vertical, 12)
                .background(Color(surveyViewModel.currentItemResponse?.responseOrdinalScale == viewModel.steps[stepIndex].value ? .systemGray3 : .systemGray5))
                .cornerRadius(6)
                .padding(.bottom, 4)
            })
        }
    }
    
    class ViewModel: ObservableObject {
        // The currently displayed survey question
        private var itemToRender: OrdinalScaleSurveyItem
        // Reference to the environment object, the survey view model
        private var surveyViewModel: TakeSurveyScreen.ViewModel
        
        // Compute the ordinal scale steps for this question
        var steps: [OrdinalScaleStep] {
            return itemToRender.ordinalScaleSteps
        }
        
        init(itemToRender: OrdinalScaleSurveyItem, surveyViewModel: TakeSurveyScreen.ViewModel) {
            self.itemToRender = itemToRender
            self.surveyViewModel = surveyViewModel
        }
        
        // User tapped on one item
        func selectStep(stepIndex: Int) {
            if surveyViewModel.currentItemResponse?.responseOrdinalScale == steps[stepIndex].value {
                // If the new selection is already selected, toggle it
                surveyViewModel.currentItemResponse?.responseOrdinalScale = nil
            } else {
                // Otherwise, update the item response to reflect the current selection
                surveyViewModel.currentItemResponse?.responseOrdinalScale = steps[stepIndex].value
            }
            // Notify the view that changes occurred
            objectWillChange.send()
            surveyViewModel.objectWillChange.send()
        }
    }
}