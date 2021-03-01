//
//  CoverView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 1/3/21.
//

import SwiftUI

struct CoverView: View {
    
    @State private var show : Bool = false
    @State private var isDragging : Bool = false
    @State private var dragPosition : CGSize = CGSize.zero
    
    var body: some View {
        VStack {
            VStack(spacing: 15.0) {
                Text("Learn design & code.\nFrom scratch.")
                    .font(.largeTitle, weight: .bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .offset(x: self.dragPosition.width / 15, y: self.dragPosition.height / 15)
                
                Text("80 hours of courses of SwiftUI, React and design tools.")
                    .font(.subheadline)
                    .frame(width: 250)
                    .multilineTextAlignment(.center)
                    .offset(x: self.dragPosition.width / 20, y: self.dragPosition.height / 20)
                
                Spacer()
            }
            .padding(.top, 100)
            .frame(height: 477)
            .frame(maxWidth: .infinity)
            .background(
                Image(uiImage: #imageLiteral(resourceName: "Card3"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 500)
                    .offset(x: self.dragPosition.width / 25, y: self.dragPosition.height / 25)
                ,
                alignment: .bottom
            )
            .background(
                Image(uiImage: #imageLiteral(resourceName: "Blob"))
                    .offset(x: -150, y: -200)
                    .rotationEffect(Angle(degrees: self.show ? 360+90 : 90))
                    .blendMode(.plusDarker)
                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false), value: self.show)
            )
            .background(
                Image(uiImage: #imageLiteral(resourceName: "Blob"))
                    .offset(x: -200, y: -250)
                    .rotationEffect(Angle(degrees: self.show ? 360 : 0), anchor:.center)
                    .blendMode(.overlay)
                    .animation(Animation.linear(duration: 100).repeatForever(autoreverses: false), value: self.show)
            )
            .background(Color(#colorLiteral(red: 0.4117647059, green: 0.4705882353, blue: 1, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .scaleEffect(self.isDragging ? 0.92 : 1)
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            .rotation3DEffect(
                Angle(degrees: 5),
                axis: (x: self.dragPosition.width, y: self.dragPosition.height, z: 0)
            )
            .gesture(
                DragGesture().onChanged { value in
                    self.dragPosition = value.translation
                    self.isDragging = true
                }
                .onEnded { value in
                    self.dragPosition = .zero
                    self.isDragging = false
                }
            )
            
            Spacer()
        }
        .onAppear {
            self.show = true
        }
    }
}

struct CoverView_Previews: PreviewProvider {
    static var previews: some View {
        CoverView()
    }
}
