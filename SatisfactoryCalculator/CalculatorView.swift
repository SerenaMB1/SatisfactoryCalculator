//
//  CalculatorView.swift
//  SatisfactoryCalculator
//
//  Created by Serena Badesha on 05/12/2022.
//

import Foundation
import SwiftUI

struct CalculatorView: View {
    
    @ObservedObject var purpleDataVm: PurpleDataViewModel
    @State private var selectedRecipe: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Rectangle()
                    .frame(height: 1)
                    .background(.ultraThinMaterial)
                Text("Selected Item: \(selectedRecipe)")
                Spacer()
                Picker("Select a recipe", selection: $selectedRecipe) {
                    let recipeNameRange = 0 ..< purpleDataVm.recipeNames.count
                    ForEach(recipeNameRange) { index in
                        Text(purpleDataVm.recipeNames[index])
                    }.pickerStyle(WheelPickerStyle())
                        .font(.subheadline)
                }
            }
            .navigationBarTitle(Text("Satisfactory Calculator"), displayMode: .inline)
        }
        .colorMultiply(.orange)
    }
        
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        let purpleDataVm = PurpleDataViewModel()
        return CalculatorView(purpleDataVm: purpleDataVm)
    }
}
