//
//  BRInternetsViewController.swift
//  BottleRocket
//
//  Created by Yulia on 14.09.2021.
//

import UIKit
import WebKit

class TAInternetsViewController: UIViewController, WKUIDelegate, UINavigationBarDelegate {
    var bgView = UIView()
    var webView = WKWebView()
    var navbar = UINavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        createNavbar()
        createWebView()
    }
    
    func createView() {
        bgView.frame = .zero
        view.addSubview(bgView)
        
        let layoutGuide = view.safeAreaLayoutGuide

        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        bgView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        bgView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
    }
    
    func createNavbar() {
        navbar.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50)
        navbar.delegate = self
        
        let item = UINavigationItem()
        
        let backButton = UIBarButtonItem(title: "←", style: .done, target: self, action: #selector(TAInternetsViewController.back(_:)))
        
        let forwardButton = UIBarButtonItem(title: "→", style: .done, target: self, action: #selector(TAInternetsViewController.forward(_:)))
        item.leftBarButtonItems = [backButton, forwardButton]
        
        let reloadButton = UIBarButtonItem(title: "⟳", style: .done, target: self, action: #selector(TAInternetsViewController.reload(_:)))
        item.rightBarButtonItem = reloadButton
        
        reloadButton.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 50, weight: .medium), .foregroundColor: UIColor.gray], for: .normal)
        backButton.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 30, weight: .medium), .foregroundColor: UIColor.gray], for: .normal)
        forwardButton.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 30, weight: .medium), .foregroundColor: UIColor.gray], for: .normal)
        
        navbar.items = [item]
        
        navbar.barTintColor = UIColor.white
        
        bgView.addSubview(navbar)
    }
    
    func createWebView() {
        bgView.addSubview(webView)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: bgView.trailingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: navbar.bottomAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor).isActive = true

        if let url = URL(string: TAConstants.webViewUrl) {
            webView.load(URLRequest(url: url))
        }
    }
    
    @objc private func back(_ sender: UIButton) {
        webView.goBack()
    }
    
    @objc private func forward(_ sender: UIButton) {
        webView.goForward()
    }
    
    @objc private func reload(_ sender: UIButton) {
        let request = URLRequest(url: webView.url!)
        webView.load(request)
    }
}

