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
                    UpperBar()
                    
                    ScrollView {
                        MyFundsView()
                        LastMonthView()
                        PlanningView()
                        FactTab()
                        
                    }
                }
            }
            .navigationBarHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .navigationBarBackButtonHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}

struct UpperBar: View { // Верхнее меню управления

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            HStack {
                Text(date.formatToString(using: .ddMMyy))
                    .font(.system(size: 14))
                    .padding(.leading)
                Spacer()
            }
            HStack {
               // Здесь будет логотип
                //  .padding(.top, 10)
            }
        }
    }
}

//struct PlanningView: View{ // Предполагаемые доходы
//
//    var body: some View {
//        
//        VStack (spacing: 0) {
//            
//            Button {
//                print("Календарь доходов")
//            } label: {
//                VStack {
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text("Предполагаемые доходы")
//                            HStack(spacing: 0) {
//                                Text("")
//                                Text("₽")
//                            }
//                        }
//                        Spacer()
//                        Image(systemName: "calendar")
//                    }
//                    .padding(.horizontal)
//                    .padding(.vertical, 10)
//                    .frame(maxWidth: .infinity)
//                    .background(Color("Ice8"))
//                    .shadow(radius: 2)
//                    .foregroundColor(.black)
//                }
//            }
//            
//            Button {
//                print("Календарь расходов")
//            } label: {
//                VStack {
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text("Планируемые расходы")
//                            HStack(spacing: 0) {
//                                Text("")
//                                Text("₽")
//                            }
//                        }
//                        Spacer()
//                        Image(systemName: "calendar")
//                    }
//                    .padding(.horizontal)
//                    .padding(.vertical, 10)
//                    .frame(maxWidth: .infinity)
//                    .background(Color("Ice8"))
//                    .shadow(radius: 2)
//                    .foregroundColor(.black)
//                }
//            }
//            
//            VStack {
//                HStack {
//                    VStack(alignment: .leading) {
//                        Text("Предполагаемый остаток")
//                        HStack(spacing: 0) {
//                            Text("")
//                            Text("₽")
//                        }
//                    }
//                    Spacer()
//                }
//                .padding(.horizontal)
//                .padding(.vertical, 10)
//                .frame(maxWidth: .infinity)
//                .background(Color("Ice8"))
//                .shadow(radius: 2)
//                .foregroundColor(.black)
//            }
//            
//        }
//        .frame(maxWidth: .infinity)
//        .cornerRadius(12)
//        .padding(.horizontal)
//        .padding(.bottom, 10)
//        .foregroundColor(.black)
//        .shadow(radius: 6)
//    }
//}

struct FactTab: View {
    
    var body: some View {
        
        VStack (spacing: 0) {
            
            Button {
                print("Календарь доходов")
            } label: {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Фактические доходы")
                            HStack(spacing: 0) {
                                Text("")
                                Text("₽")
                            }
                        }
                        Spacer()
                        Image(systemName: "calendar")
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color("Ice8"))
                    .shadow(radius: 2)
                    .foregroundColor(.black)
                }
            }
            
            Button {
                print("Календарь расходов")
            } label: {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Фактические расходы")
                            HStack(spacing: 0) {
                                Text("")
                                Text("₽")
                            }
                        }
                        Spacer()
                        Image(systemName: "calendar")
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color("Ice8"))
                    .shadow(radius: 2)
                    .foregroundColor(.black)
                }
            }
            
            Button {
                print("Средства на руках")
            } label: {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Средства на руках")
                            HStack(spacing: 0) {
                                Text("")
                                Text("₽")
                            }
                        }
                        Spacer()
                        Image(systemName: "questionmark")
                            .padding(.trailing, 0)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color("Ice8"))
                    .shadow(radius: 2)
                    .foregroundColor(.black)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .cornerRadius(12)
        .padding(.horizontal)
        .padding(.bottom, 10)
        .foregroundColor(.black)
        .shadow(radius: 6)
    }
}
