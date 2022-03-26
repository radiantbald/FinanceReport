//
//  MainPageView.swift
//  FinanceReport
//
//  Created by Олег Попов on 20.02.2022.
//

import SwiftUI

struct MainPageView: View {
    
    var body: some View {
       
            ZStack {
                
                VStack {
                    
                    UpperBar()
                    
                    ScrollView {
                        MyFunds()
                        LastMonth()
                        PlanningTab()
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

struct MyFunds: View { // Мои Накопления
    
    @State private var isMyFundsShow = false
    
    var body: some View {
        
        VStack {
            
            Button{
                isMyFundsShow.toggle()
            }label: {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Мои накопления")
                            HStack(spacing: 0) {
                                Text("")
                                Text("₽")
                            }
                        }
                        Spacer()
                        Image(systemName: "rectangle.portrait.and.arrow.right")
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
        .background(.white)
        .cornerRadius(12)
        .foregroundColor(.black)
        .padding(.horizontal)
        .padding(.top, 20)
        .padding(.bottom, 10)
        .shadow(radius: 6)
        .fullScreenCover(isPresented: $isMyFundsShow, content: {
            FundsTabView()
        })
    }
}

struct LastMonth: View { // Перенос с прошлого месяца

    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                Button {
                    showSheet.toggle()
                } label: {
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Перенос с прошлого месяца")
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
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(12)
                .foregroundColor(.black)
                .padding(.horizontal)
                .padding(.bottom, 10)
                .shadow(radius: 6)
            }
        }
    }
}

struct PlanningTab: View{ // Предполагаемые доходы

    var body: some View {
        
        VStack (spacing: 0) {
            
            Button {
                print("Календарь доходов")
            } label: {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Предполагаемые доходы")
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
            } // Предполагаемые доходы
            
            // Планируемые расходы
            Button {
                print("Календарь расходов")
            } label: {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Планируемые расходы")
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
            } // Планируемые расходы
            
            // Предполагаемый остаток
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Предполагаемый остаток")
                        HStack(spacing: 0) {
                            Text("")
                            Text("₽")
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(Color("Ice8"))
                .shadow(radius: 2)
                .foregroundColor(.black)
            } // Предполагаемый остаток
            
        } // VStack
        .frame(maxWidth: .infinity)
        .cornerRadius(12)
        .padding(.horizontal)
        .padding(.bottom, 10)
        .foregroundColor(.black)
        .shadow(radius: 6)
    }
}

struct FactTab: View { // Фактические доходы и расходы
    
    var body: some View {
        
        VStack (spacing: 0) {
            
            Button { // Фактические доходы
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
            } // Фактические доходы
            
            // Фактические расходы
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
            } // Фактические расходы
            
            // Средства на руках
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
            } // Средства на руках
        }
        .frame(maxWidth: .infinity)
        .cornerRadius(12)
        .padding(.horizontal)
        .padding(.bottom, 10)
        .foregroundColor(.black)
        .shadow(radius: 6)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainPageView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
