#pragma once

#ifdef __cplusplus
extern "C" {
#endif

    typedef struct DigitRecognizer DigitRecognizer;
    
    DigitRecognizer* newDigitRecognizer(const char*);
    
    // class methods
    const char* DigitRecognizer_getClassifierFileName(DigitRecognizer* digitRecognizer);
    
    void deleteDigitRecognizer(DigitRecognizer* digitRecognizer);
    
#ifdef __cplusplus
}
#endif
