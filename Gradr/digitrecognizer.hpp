#pragma once

#include <string>

class DigitRecognizer {
public:
    explicit DigitRecognizer(std::string classifierFileName);
    const std::string& getClassifierFileName() const;
private:
    std::string classifierFileName;
};
    
