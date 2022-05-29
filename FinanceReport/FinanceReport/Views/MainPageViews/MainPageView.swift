//
//  MainPageView.swift
//  FinanceReport
//
//  Created by Олег Попов on 20.02.2022.
//

import SwiftUI

struct MainPageView: View {
    
    var viewModel: MainPageViewModel
    
    var body: some View {
       
            ZStack {
                VStack {
                    UpperBarView()
                    
                    ScrollView {
                        MyFundsView()
                        LastMonthView()
                        PlanningView()
                        FactView()
                    }
                }
            }
            .navigationBarHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .navigationBarBackButtonHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}
