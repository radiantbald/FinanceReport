//
//  AuthView.swift
//  FinanceReport
//
//  Created by Radiant Bald on 17.02.2022.
//

import SwiftUI


let screenSize = UIScreen.main.bounds


extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct AuthView: View {
    
    @State private var isAuth = true
    @State private var login = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isKeyboardOpened = false
    @State private var isShowAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                if isKeyboardOpened == false {
                    
                    VStack{
                        Spacer()
                        NavigationLink(destination: MainPageView()){
                            Text("Войти без регистрации")
                                .padding(.bottom, 60)
                                .font(.custom("AvenirNext", size: 16))
                                .foregroundColor(.black)
                        }
                    }
                } // кнопка входа без регистрации
                
                ZStack{
                    
                    VStack {
                        
                        VStack(alignment: .center) {
                            Text(isAuth ? "Авторизация" : "Регистрация")
                                .font(.custom("AvenirNext", size: 30))
                            
                            VStack {
                                TextField("Введите email", text: $login)
                                    .padding()
                                    .background(.white)
                                    .cornerRadius(12)
                                    .shadow(radius: 6)
                                
                                
                                SecureField("Введите пароль", text: $password)
                                    .padding()
                                    .background(.white)
                                    .cornerRadius(12)
                                    .shadow(radius: 6)
                                
                                
                                if !isAuth {
                                    SecureField("Повторите пароль", text: $confirmPassword)
                                        .padding()
                                        .background(.white)
                                        .cornerRadius(12)
                                        .shadow(radius: 6)
                                    
                                }
                            } // Поля для ввода email и пароля
                            
                            VStack {
                                Button {
                                    if isAuth {
                                        print("Авторизация")
                                    } else {
                                        print("Регистрация")
                                        
                                        guard password == confirmPassword else {
                                            
                                            self.alertMessage = "Пароли не совпадают"
                                            isShowAlert.toggle()
                                            return
                                        }
                                        
                                        AuthService.shared.signUp(email: login,
                                        password: password)
                                        
                                        (let user):
                                        print("Успех")
                                        login = ""
                                        password = ""
                                        confirmPassword = ""
                                        self.alertMessage = "Вы успешно зарегистрировались с email: \(user.email!)"
                                    }
                                } label: {
                                    Text(isAuth ? "Войти" : "Зарегистрироваться")
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color("Ice4"))
                                        .cornerRadius(12)
                                        .foregroundColor(.black)
                                        .shadow(radius: 6)
                                    
                                }
                                Button {
                                    isAuth.toggle()
                                } label: {
                                    Text(isAuth ? "Зарегистрироваться" : "У меня есть аккаунт")
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(.clear)
                                        .cornerRadius(12)
                                        .foregroundColor(.black)
                                }
                            } // Кнопки "Войти / зарегистрироваться / уже есть аккаунт"
                        }
                        .padding()
                        .background(Color("Ice7"))
                        .cornerRadius(12)
                        .padding(.top, 40)
                        .padding(.horizontal, 40)
                        .offset(y: -50)
                        .animation(.easeInOut(duration: 0.3), value: isAuth)
                        .shadow(radius: 12)
                        .alert(self.alertMessage, isPresented: $isShowAlert) {
                            Button {
                                
                            } label: {
                                Text("OK")
                            }
                            
                        }
                    }
                    .frame(width: screenSize.width , height: screenSize.height, alignment: .center)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        self.dismissKeyboard()
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidShowNotification)) { _ in
                        self.isKeyboardOpened = true
                    }.onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidHideNotification)) { _ in
                        self.isKeyboardOpened = false
                    }
                } // Окно "Авторизация/Регистрация"
            } //Весь экран
            .navigationBarHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .navigationBarBackButtonHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                AuthView()
                    .previewInterfaceOrientation(.portrait)
            }
        }
    }
}
