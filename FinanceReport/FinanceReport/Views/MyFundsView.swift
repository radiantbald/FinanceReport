////
////  MyFundsView.swift
////  FinanceReport
////
////  Created by Олег Попов on 14.03.2022.
////
//
//import SwiftUI
//
//struct MyFundsView: View {
//    
//    @Environment(\.dismiss) var dismiss
//    @State var selected = 0
//    
//    var body: some View {
//        
//        ZStack {
//            
//            VStack {
//                
//                Spacer()
//                
//                ZStack {
//                    
//                    HStack {
//                        
//                        Spacer()
//                        
//                        Button(action: {
//                            self.selected = 0
//                            
//                        }) {
//                            VStack {
//                                Image(systemName: "star.circle")
//                                Text("Мои накопления")
//                                
//                            }
//                        }
//                        .foregroundColor(self.selected == 0 ? .green : .gray)
//                        
//                        Spacer()
//                        
//                        Button(action: {
//                            self.selected = 1
//                            
//                        }) {
//                            VStack{
//                                Image(systemName: "star.circle")
//                                Text("Мои долги")
//                            }
//                        }
//                        .foregroundColor(self.selected == 1 ? .red : .gray)
//                        
//                        Spacer()
//                    }
//                }
//            } // нижний Tabbar
//            .navigationBarHidden(true)
//            // .navigationBarBackButtonHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
//        }
//    }
//}
//
//
//
//struct DebtsView: View {
//    
//    var body: some View {
//        Text("Мои долги")
//    }
//}
//
//
//struct MyFundsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyFundsView()
//    }
//}
//
