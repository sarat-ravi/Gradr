#include "digitrecognizer.hpp"

DigitRecognizer::DigitRecognizer(std::string classifierFileName) : classifierFileName(classifierFileName) {
}

const std::string& DigitRecognizer::getClassifierFileName() const {
    return classifierFileName;
}
    
