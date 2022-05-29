//
//  UpperBarView.swift
//  FinanceReport
//
//  Created by Олег Попов on 03.05.2022.
//

import SwiftUI

struct UpperBarView: View { // Верхнее меню управления

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

struct UpperBarView_Previews: PreviewProvider {
    static var previews: some View {
        UpperBarView()
    }
}
