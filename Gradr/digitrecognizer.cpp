#include "digitrecognizer.hpp"

namespace srt {
    
DigitRecognizer::DigitRecognizer(std::string inputString) : inputString(inputString) {
}

const std::string& DigitRecognizer::getInputString() const {
    return inputString;
}
    
int DigitRecognizer::recognizeDigit(std::shared_ptr<cv::Mat> imageMat, cv::Rect frame) {
    // Get feature vector from image
    cv::Ptr<cv::ml::SVM> svm = cv::ml::StatModel::load<cv::ml::SVM>(inputString);
    cv::Mat feature = imageMat->clone().reshape(1,1);
    feature.convertTo(feature, CV_32F);
   
    int predictedValue = svm->predict(feature);
    return predictedValue;
}
    
} // namespace srt
