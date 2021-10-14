//: [Previous](@previous)
import UIKit
import SwiftUI
import PlaygroundSupport
import AVKit
import CoreGraphics

struct ContentView: View {
    
    @State private var mainViewDim:[String:CGFloat] = ["x": 600, "y": 450]
    @State private var varchetellaDim:CGFloat = 300
    @State private var navicellaDim: CGFloat = 0
    
    @State private var cloudOnePos:[String:CGFloat] = ["x": 270, "y": -300]
    @State private var cloudTwoPos:[String:CGFloat] = ["x": 100, "y": -370]
    @State private var cloudThreePos:[String:CGFloat] = ["x": 440, "y": -370]
    
    @State private var navicellaPos:[String:CGFloat] = ["x": 900, "y": 100]
    @State private var lightPos:[String:CGFloat] = ["x": 280, "y": 250]
    @State private var lightOpacity:Double = 0.0
    @State private var lightDim:CGFloat = 335
    
    @State private var boatPos:[String:CGFloat] = ["x": -150, "y": 280]
    @State private var pirateOnePos:[String:CGFloat] = ["x": 145, "y": -45]
    @State private var pirateTwoPos:[String:CGFloat] = ["x": 180, "y": -45]
    @State private var pirateThreePos:[String:CGFloat] = ["x": 65, "y": -65]
    
    @State private var animDurationShip:Double = 6
    @State private var animDurationNavicella:Double = 0.8
    
    @State private var player:AVAudioPlayer!
    @State private var playerMain:AVAudioPlayer!
    @State private var animation = 1

    var body: some View {
        GeometryReader { gp in
            // main container
            ZStack(alignment: .bottomLeading){
                
                // Faraglioni
                Image(uiImage: UIImage(named: "faraglioni.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, alignment: .topLeading)
                    .offset(x:370, y:-175)
                
                // Cloud 1
                Image(uiImage: UIImage(named: "cloud-1.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, alignment: .topLeading)
                    .offset(x: cloudOnePos["x"]!, y: cloudOnePos["y"]!)
                
                // Cloud 2
                Image(uiImage: UIImage(named: "cloud-2.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, alignment: .topLeading)
                    .offset(x:cloudTwoPos["x"]!, y:cloudTwoPos["y"]!)
                
                // Cloud 3
                Image(uiImage: UIImage(named: "cloud-2.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, alignment: .topLeading)
                    .offset(x:cloudThreePos["x"]!, y:cloudThreePos["y"]!)
                
                // Sea
                Image(uiImage: UIImage(named: "sea.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 602, alignment: .bottomLeading)
                    .offset(x:0, y:0)
/*                    .gesture(TapGesture().onEnded {
                        
                        //Lettore audio per i suoni
                        //let oceanSound = Bundle.main.path(forResource: "ocean", ofType: "mp3")
                        //player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: oceanSound!))
                        //player.prepareToPlay()
                        //player.play()
                        
      //                  boatPos["x"] = CGFloat(180)
                    })*/
                
                // Container for pirates and ship
                ZStack(alignment: .bottomLeading){
                    
                    Image(uiImage: UIImage(named: "pirate-3.png")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 47)
                        .offset(x: pirateOnePos["x"]!, y: pirateOnePos["y"]!)
                        .animation(
                            .linear(duration: animDurationShip)
                        )
                    
                    Image(uiImage: UIImage(named: "pirate-1.png")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 47)
                        .offset(x: pirateTwoPos["x"]!, y: pirateTwoPos["y"]!)
                        .animation(
                            .linear(duration: animDurationShip)
                        )
                    
                    Image(uiImage: UIImage(named: "pirate-2.png")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 47)
                        .offset(x: pirateThreePos["x"]!, y: pirateThreePos["y"]!)
                        .animation(
                            .linear(duration: animDurationShip)
                        )
                    
                    Image(uiImage: UIImage(named: "ship.png")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: varchetellaDim)
                }
                .position( x: boatPos["x"]!, y:boatPos["y"]! )
                .animation(
                    .linear(duration: animDurationShip)
                )
                
                // luce
                Image(uiImage: UIImage(named: "ufo-light")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: lightDim)
                    .position(x: lightPos["x"]!, y: lightPos["y"]! )
                    .animation(
                        .linear(duration: 3)
                    )
                    .opacity(lightOpacity)
                
                // ufo
                Image(uiImage: UIImage(named: "navicella.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: navicellaDim, alignment: .topLeading)
                    .position(x: navicellaPos["x"]!, y: navicellaPos["y"]! )
                    .animation(
                        .linear(duration: animDurationNavicella)
                    )
                
            }
            .frame(width: mainViewDim["x"], height: mainViewDim["y"]!)
            .background(Color.init(red: 157/255, green: 220/255, blue: 249/255))
            
        }
        .frame(width: mainViewDim["x"], height: mainViewDim["y"])
        .gesture(TapGesture().onEnded {
            

            //nave che entra
            if(animation == 1){
                boatPos["x"] = 180
                
                let oceanSound = Bundle.main.path(forResource: "ocean", ofType: "mp3")
                playerMain = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: oceanSound!))
                playerMain.prepareToPlay()
                playerMain.play()
                
            //pirati che zompettano
            }else if(animation == 2){
                
                let ufoSound = Bundle.main.path(forResource: "ufo-sound", ofType: "mp3")
                player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: ufoSound!))
                player.prepareToPlay()
                player.play()
                
                navicellaPos["x"] = 400
                navicellaDim = 250
            //alieni che arrivano
            }else if(animation == 3) {
                lightOpacity = 1
            }else if(animation == 4){
                animDurationShip = 2
                
                pirateOnePos["x"] = 370
                pirateOnePos["y"] = -250
                pirateTwoPos["x"] = 370
                pirateTwoPos["y"] = -250
                pirateThreePos["x"] = 370
                pirateThreePos["y"] = -250
                
            }else{
                player.stop()
            }
            
            animation += 1
        })
        
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
