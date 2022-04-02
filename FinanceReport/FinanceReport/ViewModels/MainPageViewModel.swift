//
//  MainPageViewModel.swift
//  FinanceReport
//
//  Created by Олег Попов on 29.03.2022.
//

import Foundation
import Firebase

class MainPageViewModel: ObservableObject {
    
    @Published var user: User

    init(user: User) {
        self.user = user
    }
}
