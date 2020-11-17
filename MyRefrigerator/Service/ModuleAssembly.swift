//
//  Assembly.swift
//  MyRefrigerator
//
//  Created by Illya Sirosh on 17.11.2020.
//

import UIKit

protocol Assembly {
    static func getRefrigeratorModule() -> UIViewController
}

struct ModuleAssembly: Assembly {
    
    static func getRefrigeratorModule() -> UIViewController {
        let service = RefrigeratorServiceImpl()
        let presenter = RefrigeratorPresenterImpl()
        let view = RefrigeratorViewController()
        
        presenter.service = service
        presenter.view = view
        view.presenter = presenter

        return view
    }
    
}
