#include <string>
#include "DigitRecognizer.hpp"
#include "digitrecognizerwrapper.h"

    
extern "C" {
    DigitRecognizer* newDigitRecognizer(const char* inputString) {
        return new DigitRecognizer(std::string(inputString));
    }
    
    const char* DigitRecognizer_getInputString(DigitRecognizer* digitRecognizer) {
        return digitRecognizer->getInputString().c_str();
    }
    
    void deleteDigitRecognizer(DigitRecognizer* digitRecognizer) {
        delete digitRecognizer;
    }
}
