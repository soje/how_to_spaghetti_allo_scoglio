
import UIKit
import SwiftUI
import PlaygroundSupport
import AVKit
import CoreGraphics
struct ContentView: View {
@State private var Fadeinout = false
    @State private var player: AVAudioPlayer!
    @State private var player2: AVAudioPlayer!
    @State private var titleDim = CGFloat(0)
    // Grandezza del canvas generale, non toccate
    @State private var mainViewDim = ["x": CGFloat(600), "y": CGFloat(450)]
    @State private var BackgroundDim = CGFloat(0)
    @State private var Button = CGFloat(0)
    @State var timeRemaining = 10
    @State var premimi = false
    @State var opacitybg:Double = 1
    @State var opacitybg2:Double = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var opacitybg1: CGFloat = 0
    @State var black : CGFloat = 100

    
    // Questa è la vista
    
    var body: some View {
        
        // Container generale non toccate
        // Tutti i Widget che vengono inseriti nello zstack
        // sono visualizzati uno sull'altro, il primo si trova nell'ultimo piano
        // l'ultimo si trova in primo piano
        ZStack {
            Image(uiImage: UIImage(named: "black.jpg")!)
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: 800, height: 450, alignment: .bottom)
                 .offset(x:0, y:0)
                 .animation(.linear(duration: 5))
                 .onAppear{
                     withAnimation(.linear(duration:5).delay(4.5)){opacitybg2 = 1
                         DispatchQueue.main.asyncAfter(deadline: .now() + 11, execute: {
                             withAnimation(.linear(duration:3)){opacitybg2 = 0}
                         })
                             
                         }
                     
                 }
                 .onTapGesture{ player2.prepareToPlay()
                     player2.play()
//                     player.stop()
                     withAnimation(.linear(duration:2).delay(2)){
                         opacitybg1 = 1}
                 }
            
                 
                 
            Image(uiImage: UIImage(named: "quote-1")!)
                      
                      .offset(x:0,y:0)
                      .animation(.linear(duration:4))
                      .opacity(opacitybg2)
                      .frame(width: 600, height: 450)
                 
                    // LO SFONDO TI SFONDO
            Image(uiImage: UIImage(named: "background")!)
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: 600, alignment: .topLeading)
                 .offset(x:0, y:0)
                 .animation(.easeOut(duration:2))
                 .opacity(Double(opacitybg1))
               
                 .onTapGesture { titleDim = CGFloat(400)
                 }
               
            // LA SCRITTA
            Image(uiImage: UIImage(named: "logo")!)
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: titleDim, alignment: .topLeading)
                 .offset(x:0, y:-100)
                 .animation(.linear(duration:4))
                 .onTapGesture {
                     premimi = true
                     Button = CGFloat(100)
                 }
                 
            // IL PIRATA BOTTONE
            if (premimi){
                
                Image(uiImage: UIImage(named: "button")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, alignment: .topLeading)
                        .offset(x:0, y:130)
                
            }
            
        }
        .frame(width: mainViewDim["x"], height: mainViewDim["y"])
            .background(Color.black)
            .onAppear{let piratevoice = Bundle.main.path(forResource: "piratevoice", ofType: "mp3")
                player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: piratevoice!))
                let Alberta = Bundle.main.path(forResource: "Alberta", ofType: "mp3")
                player2 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Alberta!))
                player.prepareToPlay()
                player.volume = 70
                player2.volume = 70
                player.play()
            }
    }
}
PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
