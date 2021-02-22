//
//  HomeControllerViewModel.swift
//  InstagramClone
//
//  Created by Joel Alcantara burgos on 21/2/21.
//

import Foundation


class HomeControllerViewModel {
    private var postRepresentableRequestManager: HomeRepresentableRequest
    private var storyRepresentableRequestManager: HomeRepresentableRequest

    init(postRepresentable: HomeRepresentableRequest = PostRequest.shared, storyRepresentable: HomeRepresentableRequest = StoryRequest.shared) {
        self.postRepresentableRequestManager = postRepresentable
        self.storyRepresentableRequestManager = storyRepresentable
    }

    func listPostRepresentable() -> [HomeCollectionViewRepresentable] {
        return postRepresentableRequestManager.listAllRepresentableItems()
    }

    func listStoryRepresentable() -> [HomeCollectionViewRepresentable] {
        return storyRepresentableRequestManager.listAllRepresentableItems()
    }
}
