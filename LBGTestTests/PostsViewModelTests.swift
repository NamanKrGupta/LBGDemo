import XCTest
@testable import LBGTest

final class PostsViewModelTests: XCTestCase {

    // Mock Use Case
    final class MockFetchPostsUseCase: FetchPostsUseCase {
        func execute() async throws -> [Post] {
            return [Post(id: 1, title: "Test Post", body: "Body")]
        }
    }

    func testLoadPostsSuccess() async {
        // Given
        let mockUseCase = MockFetchPostsUseCase()
        let viewModel = await PostsViewModel(fetchPostsUseCase: mockUseCase)
        
        // When
        await viewModel.loadPosts()
        
 

    }
}
