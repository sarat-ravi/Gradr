#include "digitrecognizer.hpp"

namespace srt {
    
DigitRecognizer::DigitRecognizer(std::string inputString) : inputString(inputString) {
}

const std::string& DigitRecognizer::getInputString() const {
    return inputString;
}
    
} // namespace srt
