#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTranslator>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

	QTranslator *translator = new QTranslator();
	if (translator->load("qml_" + QLocale::system().name())) {
		app.installTranslator(translator);
	}

	QQmlApplicationEngine engine;
	engine.load(QUrl(QLatin1String("qrc:/main.qml")));
	if (engine.rootObjects().isEmpty())
		return -1;

	int ret = app.exec();
	delete translator;
	return ret;
}
