#include "digitrecognizer.hpp"

namespace srt {
    
DigitRecognizer::DigitRecognizer(std::string inputString) : inputString(inputString) {
}

const std::string& DigitRecognizer::getInputString() const {
    return inputString;
}
    
int DigitRecognizer::recognizeDigit(cv::Mat imageMat, cv::Rect frame) {
    cv::Ptr<cv::ml::SVM> svm = cv::ml::StatModel::load<cv::ml::SVM>(inputString);
    cv::Mat feature = imageMat.clone().reshape(1,1);
    feature.convertTo(feature, CV_32F);
   
    return svm->predict(feature);
    
    return 77;
}
    
} // namespace srt
