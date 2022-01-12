//
//  HomeView.swift
//  Restart
//
//  Created by Dalton Ulrich on 1/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            ZStack {
                
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation
                            .easeOut(duration: 3.5)
                            .repeatForever()
                        , value: isAnimating
                    )
            }
            
            Text("Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...")
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            
            Button(action: {
                withAnimation {
                    isOnboardingViewActive = true
                    playSound(sound: "success", type: "m4a")
                    hapticFeedback.notificationOccurred(.success)
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
        .background(Color.orange.opacity(0.6))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
