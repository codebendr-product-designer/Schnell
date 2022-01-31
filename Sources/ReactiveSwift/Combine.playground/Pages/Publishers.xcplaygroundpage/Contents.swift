import Combine

var cancellables: Set<AnyCancellable> = []
[1, 2, 3, 4].publisher
    .map { "number \($0)" }
    .sink(receiveCompletion: {
        print($0)
    }, receiveValue: {
        print($0)
    })
    .store(in: &cancellables)

class User {
    var email = "unassigned"
}


var user = User()
["test@email.com"].publisher.assign(to: \.email, on: user)
user.email
