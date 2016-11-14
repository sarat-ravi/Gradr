#pragma once

#ifdef __cplusplus
extern "C" {
#endif

    typedef void DigitRecognizerCpp;
    
    DigitRecognizerCpp* newDigitRecognizer(const char*);
    
    // class methods
    const char* DigitRecognizer_getInputString(DigitRecognizerCpp* digitRecognizer);
    
    void deleteDigitRecognizer(DigitRecognizerCpp* digitRecognizer);
    
#ifdef __cplusplus
}
#endif
