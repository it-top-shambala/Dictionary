#include "mainwindow.h"
#include "rustoengwindow.h"
#include "ui_mainwindow.h"

#include <QScreen>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    this->setWindowFlag(Qt::WindowMinimizeButtonHint, false);
    this->setWindowFlag(Qt::WindowMinMaxButtonsHint, false);
    this->setWindowFlag(Qt::WindowSystemMenuHint, false);
    this->setWindowFlag(Qt::WindowFullscreenButtonHint, false);
    this->setWindowFlag(Qt::MSWindowsFixedSizeDialogHint);
    ui->setupUi(this);
    move(QGuiApplication::screens().at(0)->geometry().center() - frameGeometry().center());

    connect(ui->buttonRusToEng, SIGNAL(clicked()), this, SLOT(RusToEngWindowOpen()));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::RusToEngWindowOpen()
{
    auto window = new RusToEngWindow();
    window->show();
}
