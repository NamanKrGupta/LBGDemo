import XCTest
import SwiftUI
@testable import LBGTest

// MARK: - Mock Use Case
final class MockFetchPostsUseCase: FetchPostsUseCase {
    let result: Result<[Post], Error>

    init(result: Result<[Post], Error>) {
        self.result = result
    }

    func execute() async throws -> [Post] {
        return try result.get()
    }
}

// MARK: - Tests for PostsView and ViewModel
final class PostsViewTests: XCTestCase {
    
    func testViewModelLoadsPostsSuccessfully() async {
        // Arrange
        let mockPosts = [Post(id: 1, title: "Test Title", body: "Test Body")]
        let mockUseCase = MockFetchPostsUseCase(result: .success(mockPosts))
        let viewModel = await PostsViewModel(fetchPostsUseCase: mockUseCase)
        
        // Act
        await viewModel.loadPosts()
        
    }
}
