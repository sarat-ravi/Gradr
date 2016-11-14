#include <string>
#include "DigitRecognizer.hpp"
#include "digitrecognizerwrapper.h"

    
extern "C" {
    DigitRecognizer* newDigitRecognizer(const char* classifierFileName) {
        return new DigitRecognizer(std::string(classifierFileName));
    }
    
    const char* DigitRecognizer_getClassifierFileName(DigitRecognizer* digitRecognizer) {
        return digitRecognizer->getClassifierFileName().c_str();
    }
    
    void deleteDigitRecognizer(DigitRecognizer* digitRecognizer) {
        delete digitRecognizer;
    }
}
