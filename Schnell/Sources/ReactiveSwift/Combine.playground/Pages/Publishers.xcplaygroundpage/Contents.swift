import Combine

var cancellables: Set<AnyCancellable> = []
[1, 2, 3, 4].publisher
    .sink {
        print($0)
    }
    .store(in: &cancellables)
