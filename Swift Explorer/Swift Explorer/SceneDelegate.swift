//
//  SceneDelegate.swift
//  Swift Explorer
//
//  Created by Mac on 29.05.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		loadCurrentScene(scene: scene)
	}

    func sceneDidDisconnect(_ scene: UIScene) {
		print("sceneDidDisconnect")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
		print("sceneDidBecomeActive")
    }

    func sceneWillResignActive(_ scene: UIScene) {
		print("sceneWillResignActive")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
		print("sceneWillResignActive")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
		print("sceneWillResignActive")
    }

	/// загрузить стартовый экран если данных еще нет
	private func loadSceneWithGreeting(scene: UIScene) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(windowScene: windowScene)
		let view = FirstGreetingView()
		let presenter = FirstGreetingPresenter(view: view)
		let navigationController = UINavigationController(rootViewController: FirstGreetingViewController(presenter: presenter))
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
	}

	/// загрузить основной экран если данные уже есть
	private func loadSceneWithMainScreen(scene: UIScene) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(windowScene: windowScene)
		let mainScreenView = MainScreenView()
		let presenter = MainScreenPresenter(view: mainScreenView)
		let navigationController = UINavigationController(rootViewController: MainScreenViewController(presenter: presenter))
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
	}

	/// загрузить сцену в соответствии с отсутствием или наличием данных по пользователю
	private func loadCurrentScene(scene: UIScene) {
		let data = UserData.loadData()

		if data != nil {
			loadSceneWithMainScreen(scene: scene)
		} else {
			loadSceneWithGreeting(scene: scene)
		}
	}
}
