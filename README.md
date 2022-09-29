# quazip-binaries
Windows 环境下编译 [Qt](https://www.qt.io/) 解压缩库 [quazip](https://github.com/stachenov/quazip) 多个版本。

## 一、简要说明

### （一）MinGW

**编译环境：**

1. ***Qt5.5.1_MinGW_4.9.2_32bit***

   - [quazip-0.8.1](https://github.com/snolkmg/quazip-binaries/tree/main/mingw/quazip-0.8.1)
   - [quazip-0.9.1](https://github.com/snolkmg/quazip-binaries/tree/main/mingw/quazip-0.9.1)
   - [quazip-1.3](https://github.com/snolkmg/quazip-binaries/tree/main/mingw/quazip-1.3) 

1. ***时间久远无法确定***

   - [quazip-0.7.x](https://github.com/snolkmg/quazip-binaries/tree/main/mingw/quazip-0.7.%EF%BC%9F)

   注：可能通过***Qt5.5.1_MinGW_4.9.2_32bit***编译，也可能通过***Qt5.4.1_MinGW_4.9.1_32bit***编译。

### （二）MSVC

**编译环境：**：

1. ***Qt5.4.1_MSVC2010_32bit***
   - [quazip-0.7.2](https://github.com/snolkmg/quazip-binaries/tree/main/msvc/quazip-0.7.2)

2. ***Qt5.15.2_MSVC2019_32/64bit***
   - [quazip-0.9.1](https://github.com/snolkmg/quazip-binaries/tree/main/msvc/quazip-0.9.1)

   - [quazip-1.3](https://github.com/snolkmg/quazip-binaries/tree/main/msvc/quazip-1.3)

### （三）其他说明

- **include**: .h 文件
- **lib**: 动态库 文件
- **static**: 静态库 文件

## 二、使用

以MinGW版本为例（将quazip文件夹放在pro文件所在文件夹下）：

```cpp
# .pro文件
# quazip-0.9.1 静态库
win32:CONFIG(release, debug|release): LIBS += -L$$PWD/quazip-0.9.1/static/ -lquazip
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/quazip-0.9.1/static/ -lquazipd

INCLUDEPATH += $$PWD/quazip-0.9.1/include
DEPENDPATH += $$PWD/quazip-0.9.1/include

或者

# quazip-1.3 动态库
win32:CONFIG(release, debug|release): LIBS += -L$$PWD/quazip-1.3/lib/ -llibquazip1-qt5
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/quazip-1.3/lib/ -llibquazip1-qt5d

INCLUDEPATH += $$PWD/quazip-1.3/include
DEPENDPATH += $$PWD/quazip-1.3/include
```

```cpp
#include "JlCompress.h"

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

