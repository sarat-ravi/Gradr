#pragma once

#include <string>

class DigitRecognizer {
public:
    explicit DigitRecognizer(std::string inputString);
    const std::string& getInputString() const;
private:
    std::string inputString;
};
    
