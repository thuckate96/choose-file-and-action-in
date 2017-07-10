#include "testfiledialog.h"
#include <QObject>

TestFileDialog::TestFileDialog(QObject *parent) : QObject(parent){

}
void TestFileDialog::setImgUrl(QString url){
    imgPath = url;
    emit imgUrlChanged();
}
void TestFileDialog::chooseImg(){

}
