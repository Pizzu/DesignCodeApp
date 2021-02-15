//
//  ContentView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 27/10/20.
//

import SwiftUI

struct CertficateView: View {
    
    @State private var showOnDrag : Bool = false
    @State private var showCard : Bool = false
    @State private var cardsPosition : CGSize = CGSize.zero
    @State private var bottomCardPosition : CGSize = CGSize.zero
    @State private var showFullBottomCard : Bool = false
    
    var body: some View {
        ZStack {
            
            TitleView()
                .blur(radius: self.showOnDrag ? 20 : 0)
                .opacity(self.showCard ? 0.4 : 1)
                .offset(y: self.showCard ? -200 : 0)
                .animation(Animation
                            .default
                            .delay(0.1)
                )
            
            BackCardView()
                .frame(width: self.showCard ? 300 : 340, height: 220)
                .background(self.showOnDrag ? Color("card3") : Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: self.showOnDrag ? -400 : -40)
                .offset(x: self.cardsPosition.width, y: self.cardsPosition.height)
                .offset(y: self.showCard ? -180 : 0)
                .scaleEffect(self.showCard ? 1 : 0.95)
                .rotationEffect(Angle(degrees: self.showOnDrag ? 0 : 10))
                .rotationEffect(Angle(degrees: self.showCard ? -10 : 0))
                .rotation3DEffect(Angle(degrees: self.showCard ? 0 : 10), axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            BackCardView()
                .frame(width: 340, height: 220)
                .background(self.showOnDrag ? Color("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: self.showOnDrag ? -200 : -20)
                .offset(x: self.cardsPosition.width, y: self.cardsPosition.height)
                .offset(y: self.showCard ? -140 : 0)
                .scaleEffect(self.showCard ? 1 : 0.95)
                .rotationEffect(Angle(degrees: self.showOnDrag ? 0 : 5))
                .rotationEffect(Angle(degrees: self.showCard ? -5 : 0))
                .rotation3DEffect(Angle(degrees: self.showCard ? 0 : 5), axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            FrontCardView()
                .frame(width: self.showCard ? 375 : 340, height: 220)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: self.cardsPosition.width, y: self.cardsPosition.height)
                .offset(y: self.showCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            self.showOnDrag = true
                            self.showCard = false
                            self.cardsPosition = value.translation
                        })
                        .onEnded({ (value) in
                            self.cardsPosition = CGSize.zero
                            self.showOnDrag = false
                        })
                )
            
            BottomCardView()
                .offset(y: self.showCard ? 400 : UIScreen.main.bounds.height)
                .offset(y: self.bottomCardPosition.height)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            self.bottomCardPosition = value.translation
                            if self.showFullBottomCard {
                                self.bottomCardPosition.height += -300
                            }
                            if self.bottomCardPosition.height < -300 {
                                self.bottomCardPosition.height = -300
                            }
                        })
                        .onEnded({ (value) in
                            if self.bottomCardPosition.height > 70 {
                                self.showCard = false
                            }
                            if self.bottomCardPosition.height < -100 {
                                self.bottomCardPosition.height = -300
                                self.showFullBottomCard = true
                            } else {
                                self.showFullBottomCard = false
                                self.bottomCardPosition = .zero
                            }
                        })
                )
            
        }
    }
} 

struct CertificateView_Previews: PreviewProvider {
    static var previews: some View {
        CertficateView()
    }
}
