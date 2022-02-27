//
//  StoryboardInstantiable.swift
//  MVVM Coordinator Example
//
//  Created by Emre on 27.02.2022.
//

import UIKit

public protocol StoryboardInstantiable: AnyObject {
    associatedtype VCType

    static var storyboardFileName: String { get }
    static var storyboardIdentifier: String { get }
    static func instanceFromStoryboard(_ bundle: Bundle?) -> VCType
}

extension StoryboardInstantiable where Self: UIViewController {

    static var storyboardFileName: String {
        return storyboardIdentifier.components(separatedBy: "ViewController").first!
    }

    public static var storyboardIdentifier: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }

    public static func instanceFromStoryboard(_ bundle: Bundle? = nil) -> Self {
        let fileName = storyboardFileName
        let storyBoard = UIStoryboard(name: fileName, bundle: bundle)
        return storyBoard.instantiateViewController(withIdentifier: self.storyboardIdentifier) as! Self
    }

}
