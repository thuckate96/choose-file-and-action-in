#ifndef TESTFILEDIALOG_H
#define TESTFILEDIALOG_H
#include <QObject>
class TestFileDialog : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString imgUrl READ imgUrl WRITE setImgUrl NOTIFY imgUrlChanged)
public:
    explicit TestFileDialog(QObject* parent = 0);
    QString imgUrl(){return imgPath;}
    void setImgUrl(QString url);
   signals:
    void imgUrlChanged();
public slots:
    void chooseImg();
private:
    QString imgPath;

};
#endif // TESTFILEDIALOG_H
