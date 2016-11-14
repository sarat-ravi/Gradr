#include <string>
#include "DigitRecognizer.hpp"
#include "digitrecognizerwrapper.h"

using namespace srt;
    
extern "C" {
    DigitRecognizerCpp* newDigitRecognizer(const char* inputString) {
        return new DigitRecognizer(std::string(inputString));
    }
    
    const char* DigitRecognizer_getInputString(DigitRecognizerCpp* digitRecognizer) {
        return ((DigitRecognizer*)digitRecognizer)->getInputString().c_str();
    }
    
    void deleteDigitRecognizer(DigitRecognizerCpp* digitRecognizer) {
        delete (DigitRecognizer*)digitRecognizer;
    }
}
