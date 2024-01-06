//
//  RegisterView.swift
//  Be happy
//
//  Created by Дима Кожемякин on 22.12.2023.
//

import SwiftUI

struct RegisterView: View {
    @State private var indexView = 0
    var body: some View {
        SecondView()
        
        
        
        
        //        if indexView == 0 {
        //            FirstView()
        //        }
//        switch indexView {
//        case 0:
//            FirstView()
//        case 0:
//            <#code#>
//        case 0:
//            <#code#>
//        case 0:
//            <#code#>
//        case 0:
//            <#code#>
//        case 0:
//            <#code#>
//            
//        default:
//            <#code#>
//        }
            .padding()
            .opacity(transitionOpacity) // Применяем анимацию затухания
            .onAppear {
                // Вызываем метод для начала анимации
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.transitionOpacity = 1
                }
            }
    }
    
    
    // Флаг для анимации затухания
    @State private var transitionOpacity: Double = 0
}


#Preview {
    RegisterView()
}


struct FirstView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Hi, now you have to remember the newly generated password, and you will come up with the login yourself ")
                .font(.title)
                .multilineTextAlignment(.center)
            Spacer()
            Button("I am ready !", action: {} )
                .buttonStyle(.borderedProminent)
        }
    }
}

struct SecondView: View {
    @State private var text = "Okay, and now (in 3 seconds) we will show you the password and you will have to write it down in 1 minute and we will delete it."
    @State private var showGoText = false
    
    var body: some View {
        VStack {
            if !showGoText {
               Text(text)
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
            if showGoText {
                Text("Go, ")
                    .transition(.opacity)
            }
        }
        .onAppear {
            waitAndGenerate()
        }
    }
    
    func waitAndGenerate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                self.showGoText = true
            }
        }
    }
}
