//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by VietMac on 26/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var number: Int = 18
    @State var isShowAlert: Bool = true
    @State var message: String = ""
    
    var body: some View {
        VStack {
            Text("Count")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundStyle(.orange)

            ZStack (alignment: .topTrailing) {
                Text("Hello world")
                    .fontDesign(.monospaced)
                    .font(.system(size: 35))
                    .padding(30)
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray)
                    )
                if number > 0 {
                    ZStack {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 40, height: 40)
                        
                        Text(number > 99 ? "99+" : "\(number)")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .offset(x: 15, y: -15)
                }
            }
            //BUTTON ACTION
            .alert(isPresented: $isShowAlert, content: {
                Alert(title: Text("Error"),
                      message: Text(message))
            })
            Button (action: {
                if number < 20 {
                    number += 1
                } else {
                    isShowAlert = true
                    message = "Maximum"
                }
                
            }) {
                Image(systemName: "arrowtriangle.up.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
            }
            Button (action: {
                if number > 0 {
                    number -= 1
                } else {
                    isShowAlert = true
                    message = "Minimun"
                }
            }) {
                Image(systemName: "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
