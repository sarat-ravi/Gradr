#include "digitrecognizer.hpp"

DigitRecognizer::DigitRecognizer(std::string inputString) : inputString(inputString) {
}

const std::string& DigitRecognizer::getInputString() const {
    return inputString;
}
    
