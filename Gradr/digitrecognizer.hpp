#pragma once

#include <string>

namespace srt {
    
class DigitRecognizer {
public:
    explicit DigitRecognizer(std::string inputString);
    const std::string& getInputString() const;
private:
    std::string inputString;
};
    
} // namespace srt
