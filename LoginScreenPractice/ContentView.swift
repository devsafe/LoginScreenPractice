//
//  ContentView.swift
//  LoginScreenPractice
//
//  Created by Сахар Кубический on 08.05.2021.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    var body: some View {
        GeometryReader { _ in
            VStack {
                Image(systemName: "flame.fill")
                    .resizable()
                    .gradientForeground(colors: [.pink, .orange])
                    .font(.largeTitle)
                    .frame(width: 170, height: 200)
                ZStack {
                    SignUp(index: self.$index)
                        .zIndex(Double(self.index))
                    Login(index: self.$index)
                }
                HStack(spacing: 15) {
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 1)
                    Text("OR")
                        .foregroundColor(.white)
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 1)
                }
                .padding(.horizontal,30)
                .padding(.top,50)
                HStack(spacing: 25) {
                    Button(action: {} ) {
                        Image(systemName: "folder.circle.fill")
                            
                            .resizable()

                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                    }
                    Button(action: {} ) {
                        Image(systemName: "bolt.horizontal.circle.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                    }
                    Button(action: {} ) {
                        Image(systemName: "pencil.circle.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                    }
                }
                .padding(.top, 30)
            }
            .padding(.vertical)
        }
        .background(Color("background").edgesIgnoringSafeArea(.all))
    }
}



struct CShape1: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {
            path in
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct CShape2: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {
            path in
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}


struct Login: View {
    @State var email = ""
    @State var pass = ""
    @Binding var index: Int
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack(spacing: 15) {
                    VStack(spacing: 10) {
                        Text("Login")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .opacity(self.index == 0 ? 1 : 0.5)
                            .font(.title)
                            .blur(radius: self.index == 0 ? 0 : 2)
                    
                        Capsule()
                            .fill(self.index == 0 ? Color.black : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    Spacer()
                    
                }
                .padding(.top, 30)
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill").foregroundColor(.red)
                        TextField("e-mail", text: self.$email)
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "lock.circle.fill").foregroundColor(.red)
                        SecureField("password", text: self.$pass)
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                HStack {
                    Spacer(minLength: 0)
                    Button(action: {}) {
                        Text("Forget password?")
                            .foregroundColor(Color.black.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color.white.opacity(0.9))
            .clipShape(CShape1())
            .contentShape(CShape1())
            
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
            .padding(.horizontal, 20)
            Button(action: {}) {
                ZStack {
                    Text("LOGIN")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal, 50)
                        .background(Color.white.opacity(0.9).blur(radius: 1))
                        .gradientForeground(colors: [.pink, .orange])
                        //.blur(radius: 3)
                        .clipShape(Capsule())
                        
                        .shadow(color: Color.white.opacity(0), radius: 5, x: 0, y: 0)
                        
                    Text("LOGIN")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                
            }
            .offset(y: 35)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
}

struct SignUp: View {
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @Binding var index: Int
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack(spacing: 15) {
                    Spacer()
                    VStack(spacing: 10) {
                        Text("SignUp")
                            .foregroundColor(self.index == 1 ? .black : .gray)
                            .fontWeight(.bold)
                            .opacity(self.index == 1 ? 1 : 0.5)
                            .font(.title)
                            .blur(radius: self.index == 1 ? 0 : 2)
                            
                        Capsule()
                            .fill(self.index == 1 ? Color.black : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    
                }
                .padding(.top, 30)
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill").foregroundColor(.red)
                        TextField("e-mail", text: self.$email)
                    }
                    Divider()
                        .background(Color.black.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "lock.circle.fill").foregroundColor(.red)
                        SecureField("password", text: self.$pass)
                    }
                    Divider()
                        .background(Color.black.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                HStack {
                    Spacer(minLength: 0)
                    Button(action: {}) {
                        Text("Forget password?")
                            .foregroundColor(Color.black.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color.white.opacity(0.9))
            .clipShape(CShape2())
            .contentShape(CShape2())
            
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .padding(.horizontal, 20)
            Button(action: {}) {
                ZStack {
                    Text("SIGNUP")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal, 50)
                        .background(Color.white.opacity(0.9).blur(radius: 1))
                        .gradientForeground(colors: [.blue, .purple])
                        //.blur(radius: 3)
                        .clipShape(Capsule())
                        
                        .shadow(color: Color.white.opacity(0), radius: 5, x: 0, y: 0)
                        
                    Text("SIGNUP")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                
            }
            .offset(y: 35)
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}
