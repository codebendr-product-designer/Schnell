import UIKit

//Map with Default Value of 0
["one", "2", "three", "4", "5"].publisher
  .map({ Int($0) })
  .replaceNil(with: 0)
  .sink(receiveValue: { int in
    print("map", int!)
  })

//Compact Map by replacing Nil with Zero
["one", "2", "three", "4", "5"].publisher
  .map({ Int($0) })
  .replaceNil(with: 0)
  .compactMap({ $0 })
  .sink(receiveValue: { int in
      print(int == 0 ? "replaced nil with \(0)" : int)
  })

//Map with ?? operator
["one", "2", "three", "4", "5"].publisher
  .map({ Int($0) })
  .sink(receiveValue: { int in
    print("??", int ?? 0)
  })

//Compact Map
["one", "2", "three", "4", "5"].publisher
  .compactMap({ Int($0) })
  .sink(receiveValue: { int in
    print("compact map", int)
  })

