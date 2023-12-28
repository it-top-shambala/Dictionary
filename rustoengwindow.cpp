#include "rustoengwindow.h"
#include "ui_rustoengwindow.h"

RusToEngWindow::RusToEngWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::RusToEngWindow)
{
    ui->setupUi(this);
}

RusToEngWindow::~RusToEngWindow()
{
    delete ui;
}
