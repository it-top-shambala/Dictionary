#ifndef RUSTOENGWINDOW_H
#define RUSTOENGWINDOW_H

#include <QMainWindow>

namespace Ui {
class RusToEngWindow;
}

class RusToEngWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit RusToEngWindow(QWidget *parent = nullptr);
    ~RusToEngWindow();

private:
    Ui::RusToEngWindow *ui;
};

#endif // RUSTOENGWINDOW_H
