//
//  RunningView.swift
//  GottaGoFast
//
//  Created by Erik Luu on 7/23/21.
//

import SwiftUI

struct RunningView: View {
    
    @StateObject var viewRouter = ViewRouter()
    @ObservedObject var stopWatch = StopWatch()
    
    var body: some View {
        
        VStack {
            
            Text(self.stopWatch.stopWatchTime)
                .font(.system(size: 80, weight: .semibold))
                .frame(width: UIScreen.main.bounds.size.width,
                       height: 300,
                       alignment: .center)
            
            HStack {
                StopWatchButton(viewRouter: viewRouter,
                                actions: [self.stopWatch.end, self.stopWatch.lap],
                                labels: ["End", "Lap"],
                                color: Color.red,
                                isPaused: self.stopWatch.isPaused())

                StopWatchButton(viewRouter: viewRouter,
                                actions: [self.stopWatch.start, self.stopWatch.pause],
                                labels: ["Start", "Pause"],
                                color: Color.blue,
                                isPaused: self.stopWatch.isPaused())
            }
            
            VStack(alignment: .leading) {
                Text("Laps")
                    .font(.title)
                    .padding()

                List {
                    ForEach(self.stopWatch.laps, id: \.uuid) { (lapItem) in
                        Text(lapItem.stringTime)
                    }
                }
            }
        }
    }
}

struct StopWatchButton: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var actions: [() -> Void]
    var labels: [String]
    var color: Color
    var isPaused: Bool
    
    var body: some View {
        let buttonWidth = (UIScreen.main.bounds.size.width / 2) - 12
        
        return Button(action: {
            if self.isPaused {
                self.actions[0]()
                // Save data to DB and say "SAVE INFO, exit to Home View"
            } else {
                self.actions[1]()
            }
        }) {
            if isPaused {
                Text(self.labels[0])
                    .foregroundColor(Color.white)
                    .frame(width: buttonWidth,
                           height: 50)
            } else {
                Text(self.labels[1])
                    .foregroundColor(Color.white)
                    .frame(width: buttonWidth,
                           height: 50)
            }
        }
        .background(self.color)
    }
}

struct RunningView_Previews: PreviewProvider {
    static var previews: some View {
        RunningView(viewRouter: ViewRouter())
    }
}
