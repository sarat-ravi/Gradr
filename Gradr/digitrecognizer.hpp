#pragma once

#include <string>
#include <OpenCV2/opencv.hpp>

namespace srt {
    
class DigitRecognizer {
public:
    explicit DigitRecognizer(std::string inputString);
    const std::string& getInputString() const;
    int recognizeDigit(std::shared_ptr<cv::Mat>, cv::Rect);
private:
    std::string inputString;
};
    
} // namespace srt
