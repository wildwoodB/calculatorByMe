//
//  ViewController.swift
//  calculatorByMe
//
//  Created by Админ on 06.10.2022.
//
import Foundation
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    enum Operations {
        case noActions
        case addition
        case substraction
        case multiplication
        case division
    }
    
    var currentNumber = "0"
    var firstNumber = 0.0
    var secondNumber = 0.0
    var result = ""
    var currentOperation = Operations.noActions
    
    
    //var numberValue: Int = 0
    
    let backView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    let textField : UITextField = {
        let sampleTextField =  UITextField(frame: CGRect(x: 40, y: 100, width: 300, height: 200))
        sampleTextField.font = UIFont.systemFont(ofSize: 80)
        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        sampleTextField.backgroundColor = .black
        sampleTextField.textColor = .white
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.keyboardType = UIKeyboardType.phonePad
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        sampleTextField.textAlignment = .right
        sampleTextField.contentVerticalAlignment = .bottom
        sampleTextField.placeholder = "0"
        sampleTextField.accessibilityTraits = .keyboardKey
        return sampleTextField
    }()
    
    let valueButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("=", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.tag = 11
        return button
    }()
    
    let plusButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.tag = 12
        return button
    }()
    
    let substractionButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("-", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 50)
        button.tag = 13
        return button
    }()
    
    let multiplyButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("х", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.tag = 14
        return button
    }()
    
    let divideButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("÷", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.tag = 18
        return button
    }()
    
    let procentButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("%", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.tag = 17
        return button
    }()
    
    let znakButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+/-", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.tag = 16
        return button
    }()
    
    let resetButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("AC", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.tag = 15
        return button
    }()
    
    let oneButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("1", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.tag = 1
        return button
    }()
    
    let twoButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("2", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.tag = 2
        return button
    }()
    
    let threeButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("3", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.tag = 3
        return button
    }()
    
    let fourButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("4", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.tag = 4
        return button
    }()
    
    let fiveButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("5", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.tag = 5
        return button
    }()
    
    let sixButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("6", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.tag = 6
        return button
    }()
    
    let sevenButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("7", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.tag = 7
        return button
    }()
    
    let eightButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("8", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.tag = 8
        return button
    }()
    
    let nineButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("9", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.tag = 9
        return button
    }()
    
    let zeroButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("0", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.tag = 0
        return button
    }()
    
    let pointButton : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 20
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(",", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.tag = 10
        return button
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setConstraints()
        
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        valueButton.addTarget(self, action: #selector(valueButtonTapped), for: .touchUpInside)
        substractionButton.addTarget(self, action: #selector(substractionButtonTapped), for: .touchUpInside)
        multiplyButton.addTarget(self, action: #selector(multiplyButtonTapped), for: .touchUpInside)
        divideButton.addTarget(self, action: #selector(divideButtonTapped), for: .touchUpInside)
        procentButton.addTarget(self, action: #selector(procentButtonTapped), for: .touchUpInside)
        znakButton.addTarget(self, action: #selector(znakButtonTapped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
        oneButton.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        twoButton.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        threeButton.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        fourButton.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        fiveButton.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        sixButton.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        sevenButton.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        eightButton.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        nineButton.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        zeroButton.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        pointButton.addTarget(self, action: #selector(pointButtonTapped), for: .touchUpInside)
        
        
    }
    
    @objc func pointButtonTapped() {
        
        if currentNumber.contains(".") {
            return
        } else {
            currentNumber += "."
            updateDispley(text: currentNumber)
        }
        
        
    }
    
    @objc func valueButtonTapped() {
        
        makeCalculations(operation: currentOperation)
        
        textField.text = ""
        textField.text = result
        
        plusButton.backgroundColor = .orange
        substractionButton.backgroundColor = .orange
        multiplyButton.backgroundColor = .orange
        divideButton.backgroundColor = .orange
        
        znakButton.backgroundColor = .lightGray
        procentButton.backgroundColor = .lightGray
        
        valueButton.alpha = 0.5
        UIView.animate(withDuration: 0.3) {
            self.valueButton.alpha = 1.0
        }
    }
    
    func namberAction(number: Int) {
        if currentNumber != "0" {
            currentNumber.append(String(number))
            updateDispley(text: currentNumber)
        } else {
            currentNumber = String (number)
            updateDispley(text: currentNumber)
        }
    }
    
    func makeCalculations(operation: Operations) {
        if currentOperation != .noActions {
            if currentNumber != "" {
                secondNumber = Double(currentNumber) ?? 0.0
                switch operation {
                    
                case .addition:
                    result = String(firstNumber + secondNumber)
                case .substraction:
                    result = String(firstNumber - secondNumber)
                case .multiplication:
                    result = String(firstNumber * secondNumber)
                case .division:
                    result = String(firstNumber / secondNumber)
                case .noActions:
                    print()
                }
                
                firstNumber = Double(result)!
                if Double(result)!.truncatingRemainder(dividingBy: 1) == 0 {
                    result = String(Int(Double(result)!))
                }
                currentNumber = result
                updateDispley(text: currentNumber)
                currentOperation = .noActions
            }
        } else {
            firstNumber = Double(currentNumber) ?? 0.0
            currentNumber = ""
            updateDispley(text: currentNumber)
            currentOperation = operation
        }
        print(result)
        
    }
    
    @objc func plusButtonTapped() {
        makeCalculations(operation: .addition)
        plusButton.backgroundColor = .systemTeal
    }
    
    @objc func substractionButtonTapped() {
        makeCalculations(operation: .substraction)
        substractionButton.backgroundColor = .systemTeal
    }
    
    @objc func multiplyButtonTapped() {
        makeCalculations(operation: .multiplication)
        multiplyButton.backgroundColor = .systemTeal
    }
    
    @objc func divideButtonTapped() {
        makeCalculations(operation: .division)
        divideButton.backgroundColor = .systemTeal
    }
    
    @objc func procentButtonTapped() {
        currentNumber = String(Double(currentNumber)! / 100)
        updateDispley(text: currentNumber)
        result = currentNumber
        firstNumber = Double(result)!
        
        procentButton.backgroundColor = .systemTeal
        
    }
    
    @objc func znakButtonTapped() {
        //  логика реализована благодаря функции фильтра и добавления знака к строке()
        var temp = currentNumber
        if temp.contains("-") {
            let sign = ["-"]
            temp = String(temp.filter {!sign.contains(String($0)) } )
            updateDispley(text: temp)
            currentNumber = temp
            
        } else {
            temp = "-" + currentNumber
            updateDispley(text: temp)
            currentNumber = temp
        }
        
        
        znakButton.backgroundColor = .systemTeal
    }
    
    @objc func resetButtonTapped() {
        
        currentNumber = ""
        firstNumber = 0.0
        secondNumber = 0.0
        result = ""
        currentOperation = Operations.noActions
        updateDispley(text: currentNumber)
    }
    
    @objc func keyPressed(sender: UIButton) {
        
        switch sender.tag {
        case 0...9:
            namberAction(number: sender.tag)
        case 10:
            pointButtonTapped()
        case 11:
            valueButtonTapped()
        case 12:
            plusButtonTapped()
        case 13:
            substractionButtonTapped()
        case 14:
            multiplyButtonTapped()
        case 15:
            resetButtonTapped()
        case 16:
            znakButtonTapped()
        case 17:
            procentButtonTapped()
        case 18:
            divideButtonTapped()
        default:
            break
            
        }
        
    }
    
    
    @objc func updateDispley(text: String) {
        
        DispatchQueue.main.async {
            self.textField.text! = text
        }
        
        
        
    }
    
    
    
    
}




extension ViewController {
    
    func setConstraints() {
        
        view.addSubview(backView)
        // указываем и активируем контрейнты
        NSLayoutConstraint.activate([
            // хадаем верхний/левый/правый/нижний контрейнты по 0
            backView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        backView.addSubview(valueButton)
        NSLayoutConstraint.activate([
            valueButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -40),
            valueButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            valueButton.heightAnchor.constraint(equalToConstant: 80),
            valueButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(plusButton)
        NSLayoutConstraint.activate([
            plusButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -130),
            plusButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            plusButton.heightAnchor.constraint(equalToConstant: 80),
            plusButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(substractionButton)
        NSLayoutConstraint.activate([
            substractionButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -220),
            substractionButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            substractionButton.heightAnchor.constraint(equalToConstant: 80),
            substractionButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(multiplyButton)
        NSLayoutConstraint.activate([
            multiplyButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -310),
            multiplyButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            multiplyButton.heightAnchor.constraint(equalToConstant: 80),
            multiplyButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(divideButton)
        NSLayoutConstraint.activate([
            divideButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -400),
            divideButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            divideButton.heightAnchor.constraint(equalToConstant: 80),
            divideButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(procentButton)
        NSLayoutConstraint.activate([
            procentButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -400),
            procentButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -109),
            procentButton.heightAnchor.constraint(equalToConstant: 80),
            procentButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(znakButton)
        NSLayoutConstraint.activate([
            znakButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -400),
            znakButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -203),
            znakButton.heightAnchor.constraint(equalToConstant: 80),
            znakButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(resetButton)
        NSLayoutConstraint.activate([
            resetButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -400),
            resetButton.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            resetButton.heightAnchor.constraint(equalToConstant: 80),
            resetButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(nineButton)
        NSLayoutConstraint.activate([
            nineButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -310),
            nineButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -109),
            nineButton.heightAnchor.constraint(equalToConstant: 80),
            nineButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(eightButton)
        NSLayoutConstraint.activate([
            eightButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -310),
            eightButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -203),
            eightButton.heightAnchor.constraint(equalToConstant: 80),
            eightButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(sevenButton)
        NSLayoutConstraint.activate([
            sevenButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -310),
            sevenButton.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            sevenButton.heightAnchor.constraint(equalToConstant: 80),
            sevenButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(sixButton)
        NSLayoutConstraint.activate([
            sixButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -220),
            sixButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -109),
            sixButton.heightAnchor.constraint(equalToConstant: 80),
            sixButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(fiveButton)
        NSLayoutConstraint.activate([
            fiveButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -220),
            fiveButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -203),
            fiveButton.heightAnchor.constraint(equalToConstant: 80),
            fiveButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(fourButton)
        NSLayoutConstraint.activate([
            fourButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -220),
            fourButton.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            fourButton.heightAnchor.constraint(equalToConstant: 80),
            fourButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(threeButton)
        NSLayoutConstraint.activate([
            threeButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -130),
            threeButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -109),
            threeButton.heightAnchor.constraint(equalToConstant: 80),
            threeButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(twoButton)
        NSLayoutConstraint.activate([
            twoButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -130),
            twoButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -203),
            twoButton.heightAnchor.constraint(equalToConstant: 80),
            twoButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(oneButton)
        NSLayoutConstraint.activate([
            oneButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -130),
            oneButton.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            oneButton.heightAnchor.constraint(equalToConstant: 80),
            oneButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(pointButton)
        NSLayoutConstraint.activate([
            pointButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -40),
            pointButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -109),
            pointButton.heightAnchor.constraint(equalToConstant: 80),
            pointButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        backView.addSubview(zeroButton)
        NSLayoutConstraint.activate([
            zeroButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -40),
            zeroButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -203),
            zeroButton.heightAnchor.constraint(equalToConstant: 80),
            zeroButton.widthAnchor.constraint(equalToConstant: 173)
        ])
        
        backView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -400),
            textField.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -100),
            textField.heightAnchor.constraint(equalToConstant: 90),
            textField.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        
        
    }
    
    
    
    
    
    
}
