# quazip-binaries
Windows 环境下编译 [Qt](https://www.qt.io/) 解压缩库 [quazip](https://github.com/stachenov/quazip) 多个版本。

## 一、简要说明

### （一）QuaZip-1.x 编译要点

以编译 **quazip-v1.4** 为例，修改 **CMakeLists.txt** 文件：

1. 编译 quazip 需要 zlib，而 Qt 自带 zlib，因此无需自行编译 zlib，只需将 **set(QUAZIP_QT_ZLIB_USED OFF)** 改为 **set(QUAZIP_QT_ZLIB_USED ON)**；

2. 默认动态编译（shared），若要静态编译（static），需将 **option(BUILD_SHARED_LIBS "" ON)** 改为 **option(BUILD_SHARED_LIBS "" OFF)**；

3. 使用低版本 Qt 编译，默认编译为 release 版，需要编译 debug 版本，将 **set(CMAKE_BUILD_TYPE RELEASE)** 改为 **set(CMAKE_BUILD_TYPE DEBUG)**；

4. 建议不要同时使用 Qt Creator 编译不同的版本，可能会报“找不到 zlib”之类的错误。


### （二）MinGW

**编译环境：**

1. ***Qt5.15.6_MinGW_8.1.0_64bit***

   - [quazip-1.3](https://github.com/snolkmg/quazip-binaries/releases/download/1.0/quazip-1.3-Qt.5.15.6-mingw64.zip) 
   - [quazip-1.4](https://github.com/snolkmg/quazip-binaries/releases/download/1.4/quazip-1.4-Qt_5.15.6-win64-mingw810.zip) 
2. ***Qt5.5.1_MinGW_4.9.2_32bit***

   - [quazip-0.8.1](https://github.com/snolkmg/quazip-binaries/releases/download/1.0/quazip-0.8.1-Qt5.5.1-mingw.zip)
   - [quazip-0.9.1](https://github.com/snolkmg/quazip-binaries/releases/download/1.0/quazip-0.9.1-Qt5.5.1-mingw.zip)
   - [quazip-1.3](https://github.com/snolkmg/quazip-binaries/releases/download/1.0/quazip-1.3-Qt5.5.1-mingw.zip) 
   - [quazip-1.4](https://github.com/snolkmg/quazip-binaries/releases/download/1.4/quazip-1.4-Qt_5.5.1-win32-mingw492.zip) 

3. ***时间久远无法确定***

   - [quazip-0.7.x](https://github.com/snolkmg/quazip-binaries/releases/download/1.0/quazip-0.7.x-mingw.zip)

   注：可能通过***Qt5.5.1_MinGW_4.9.2_32bit***编译，也可能通过***Qt5.4.1_MinGW_4.9.1_32bit***编译。

### （三）MSVC

**编译环境：**：

1. ***Qt5.4.1_MSVC2010_32bit***
   - [quazip-0.7.2](https://github.com/snolkmg/quazip-binaries/releases/download/1.0/quazip-0.7.2-Qt-5.4.1-msvc2010.zip)

2. ***Qt5.15.2_MSVC2019_32/64bit***
   - [quazip-0.9.1](https://github.com/snolkmg/quazip-binaries/releases/download/1.0/quazip-0.9.1-Qt5.15.2-msvc2019.zip)

   - [quazip-1.3](https://github.com/snolkmg/quazip-binaries/releases/download/1.0/quazip-1.3-Qt5.15.2-msvc2019.zip)

   - [quazip-1.4（64bit）](https://github.com/snolkmg/quazip-binaries/releases/download/1.4/quazip-1.4-Qt_5.15.2-win64-msvc2019.zip)

### （四）其他说明

- **static**: 静态库

## 二、使用

以MinGW版本为例（将quazip文件夹放在pro文件所在文件夹下）：

```cpp
# .pro文件
# quazip-0.9.1
win32:CONFIG(release, debug|release): LIBS += -L$$PWD/quazip-0.9.1/static/ -lquazip
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/quazip-0.9.1/static/ -lquazipd

INCLUDEPATH += $$PWD/quazip-0.9.1/include
DEPENDPATH += $$PWD/quazip-0.9.1/include

INCLUDEPATH += $$[QT_INSTALL_HEADERS]/QtZlib // 连接静态库有时找不到zlib，需要添加这句话

或者

# quazip-1.3
win32:CONFIG(release, debug|release): LIBS += -L$$PWD/quazip-1.3/lib/ -lquazip1-qt5
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/quazip-1.3/lib/ -lquazip1-qt5d
else:unix: LIBS += -L$$PWD/quazip-1.3/lib/ -lquazip1-qt5

INCLUDEPATH += $$PWD/quazip-1.3/include
DEPENDPATH += $$PWD/quazip-1.3/include
```

```cpp
#include "JlCompress.h" // quazip 0.x 版本，默认 include
#include "QuaZip-Qt5-1.3/quazip/JlCompress.h" // quazip 1.x 版本，默认 include

// 压缩 test 文件夹
void zip()
{
    QString dirPath = "F:/example/test";
    QString filePath = dirPath + ".zip";
    JlCompress::compressDir(filePath, dirPath);
}

// 解压 test.zip 文件
void unzip()
{
    QString filePath = "F:/example/test.zip";
    QString dirPath = filePath;
    dirPath = dirPath.mid(0, dirPath.lastIndexOf("."));
    JlCompress::extractDir(filePath, dirPath);
}

```

更多使用方法参考 [quazip](https://github.com/stachenov/quazip) 和 [文档](https://stachenov.github.io/quazip/)。

