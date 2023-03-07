package com.example.calculator;

public class Calculator {
    public  float calculate(float firstOperand, float secondOperand, char operator) {
        switch (operator) {
            case '+':
                return firstOperand + secondOperand;
            case '-':
                return firstOperand - secondOperand;
            case '*':
                return firstOperand * secondOperand;
            case '/':
                if (firstOperand == 0) {
                    throw new RuntimeException("Can not divide zero");
                }
                else {
                    return firstOperand / secondOperand;
                }
            default:
                throw new RuntimeException("No result");
        }
    }
}
