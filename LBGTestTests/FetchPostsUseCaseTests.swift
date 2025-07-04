import XCTest
@testable import LBGTest  

final class FetchPostsUseCaseTests: XCTestCase {

    // Mock class for NetworkServicing
    final class MockNetworkService: NetworkServicing {
        var postsToReturn: [Post] = []
        var shouldThrowError = false

        func fetchPosts() async throws -> [Post] {
            if shouldThrowError {
                throw NSError(domain: "TestError", code: 1, userInfo: nil)
            }
            return postsToReturn
        }
    }

    func testExecute_ReturnsPostsSuccessfully() async throws {
        // Arrange
        let mockService = MockNetworkService()
        let expectedPosts = [Post(id: 1, title: "Test", body: "Body")]
        mockService.postsToReturn = expectedPosts
        let useCase = DefaultFetchPostsUseCase(networkService: mockService)

        // Act
        let result = try await useCase.execute()

        // Assert
        XCTAssertEqual(result.count, expectedPosts.count)
        XCTAssertEqual(result.first?.id, expectedPosts.first?.id)
        XCTAssertEqual(result.first?.title, expectedPosts.first?.title)
        XCTAssertEqual(result.first?.body, expectedPosts.first?.body)
    }

    func testExecute_ThrowsError() async {
        // Arrange
        let mockService = MockNetworkService()
        mockService.shouldThrowError = true
        let useCase = DefaultFetchPostsUseCase(networkService: mockService)

        // Act & Assert
        do {
            _ = try await useCase.execute()
            XCTFail("Expected error to be thrown, but no error was thrown.")
        } catch {
            // Test passed
        }
    }
}
