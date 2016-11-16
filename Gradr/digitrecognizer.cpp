#include "digitrecognizer.hpp"

namespace srt {
    
DigitRecognizer::DigitRecognizer(std::string inputString) : inputString(inputString) {
}

const std::string& DigitRecognizer::getInputString() const {
    return inputString;
}
    
int DigitRecognizer::recognizeDigit(cv::Mat imageMat, cv::Rect frame) {
    return 77;
}
    
} // namespace srt
