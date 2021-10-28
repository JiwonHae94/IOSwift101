import Foundation
import Darwin

func initArray(_ size : Int) -> [[String]] {
    return Array(repeating: Array(repeating: " ", count: size), count: size)
}

func drawDiamod(_ size : Int){
    var sizeList = [1]
    for idx in 1..<max(1, size){
        sizeList.append(sizeList[idx-1] + 2)
    }
    
    let targetSize = sizeList[size-1]
    var grid = initArray(targetSize)
    let midIndex = targetSize / 2
    
    var numStars = [1]
    
    for idx in 1..<targetSize/2+1{
        numStars.append(numStars[idx-1] + 2)
    }
    
    for idx in numStars.count..<targetSize{
        numStars.append(numStars[idx-1] - 2)
    }
    
    for y in 0..<targetSize{
        let stars = numStars[y]
        for x in midIndex-stars/2..<max(1,midIndex+stars/2+1){
            grid[y][x] = "*"
        }
    }
    
    
    printArray(grid)
    
}

func drawStar(_ size : Int){
    print("start drawing star")
    let starSize = size * 2 + 2
    
    let a = starSize / 2, b = starSize / 2
    var xList : [Double] = [], yList : [Double] = []
    var grid = initArray(Int(starSize))
    
    for k in 0..<5{
        xList.append((Double(size) * cos(2 * Double.pi * Double(k) / 5 + Double.pi) + Double(a)).rounded() * 100 / 100)
        yList.append((Double(size) * sin(2 * Double.pi * Double(k) / 5 + Double.pi) + Double(b)).rounded() * 100 / 100)
     }
    
    func getPos(_ x : Int) -> Int{
        if x + 2 < 5{
            return x + 2
        }
        return x-3
    }
    
    let L1 = 0.5, L2 = 1.0
    
    for x in 0..<starSize{
        for y in 0..<starSize{
            for k in 0..<5{
                let x1 = xList[k], x2 = xList[getPos(k)]
                let y1 = yList[k], y2 = yList[getPos(k)]
                
                do{
                    //if abs((y-y1)-((y2-y1)/(x2-x1))*(x-x1)) < L1 and ((x-a)**2 + (y-b)**2 - r**2 < L2):
                    if (abs((Double(y)-y1)-((y2-y1)/(x2-x1))*(Double(x)-x1)) < L1) && (pow(Double(x-a), 2) + pow(Double(y-b), 2) - pow(Double(size), 2) < L2){
                        grid[x][y] = "*"
                    }
                }catch{
                    if (abs(Double(x)-x1) < L1) && (pow(Double(x-a), 2) + pow(Double(y-b), 2) - pow(Double(size), 2) < L2){
                        grid[x][y] = "*"
                    }
                }
            }
            
        }
    }

    printArray(grid)
}

func drawCircle(_ diameter : Int){
    var diameters = [1]
    
    for idx in 1..<max(1, diameter){
        diameters.append(diameters[idx-1] + 2)
    }
    
    let targetD = diameters[diameter-1]
    let targetR = Double(targetD / 2)
    
    var grid = initArray(targetD)
    var centerX = targetD/2 - 1 + targetD%2, centerY = centerX
    
    for y in 0..<targetD{
        for x in 0..<targetD{
            if pow(Double(x - centerX), 2.0) + pow(Double(y-centerY), 2.0) <= pow(targetR, 2.0){
                grid[y][x] = "*"
            }
        }
    }
    
    printArray(grid)
}

func printArray(_ grid : [[String]]){
    for row in grid{
        print(row.joined())
    }
}

//drawDiamod(10)
//drawCircle(10)

for i in 0...20{
    drawStar(i)
}
