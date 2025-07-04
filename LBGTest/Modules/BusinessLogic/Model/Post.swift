import Foundation

struct Post: Codable, Identifiable,Equatable {
    let id: Int
    let title: String
    let body: String
}


protocol FetchPostsUseCaseProtocol {
    func execute() async throws -> [Post]
}
