import UIKit
import SwiftUI
import PlaygroundSupport
import AVKit
import CoreGraphics


struct ContentView: View {
    
    @State private var mainViewDim = ["x": CGFloat(600), "y": CGFloat(450)]
    @State private var varchetellaDim = CGFloat(300)
    
    @State private var pirateOneOffset = ["x": CGFloat(0), "y": CGFloat(0)]
    @State private var pirateTwoOffset = ["x": CGFloat(0), "y": CGFloat(0)]
    @State private var pirateThreeOffset = ["x": CGFloat(0), "y": CGFloat(0)]
    
    @State private var counter = 1
    var body: some View {
        
        GeometryReader { gp in
            
            ZStack {
                
                Image(uiImage: UIImage(named: "background-start")!)
                    .resizable()
                    .frame(width: mainViewDim["x"], height: mainViewDim["y"])
                
                ZStack {
                    
                    Image(uiImage: UIImage(named: "pirate-3.png")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 47)
                        .offset(x: pirateOneOffset["x"]!, y: pirateOneOffset["y"]!)
                        .animation(
                            .linear(duration: 1)
                        )
                    
                    Image(uiImage: UIImage(named: "pirate-1.png")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 47)
                        .offset(x: pirateTwoOffset["x"]!, y: pirateTwoOffset["y"]!)
                        .animation(
                            .linear(duration: 1)
                        )
                    
                    Image(uiImage: UIImage(named: "pirate-2.png")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 47)
                        .offset(x: pirateThreeOffset["x"]!, y: pirateThreeOffset["y"]!)
                        .animation(
                            .linear(duration: 1)
                        )
                    
                    Image(uiImage: UIImage(named: "ship.png")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: varchetellaDim)

                    
                }
                .offset(x: -110, y:50)
                
            }
            .frame(width: mainViewDim["x"], height: mainViewDim["y"])
            .gesture(TapGesture().onEnded {
                print(counter)
                counter += 1
            })
            
        }
        .frame(width: mainViewDim["x"], height: mainViewDim["y"])
        .gesture(TapGesture().onEnded {
            print(counter)
            counter += 1
        })
        
    }
    
}

PlaygroundPage.current.setLiveView(ContentView())
