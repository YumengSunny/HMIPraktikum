/****************************************************************************
** Meta object code from reading C++ file 'readdata.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../Termin32/readdata.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'readdata.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_ReadData_t {
    QByteArrayData data[17];
    char stringdata0[182];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ReadData_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ReadData_t qt_meta_stringdata_ReadData = {
    {
QT_MOC_LITERAL(0, 0, 8), // "ReadData"
QT_MOC_LITERAL(1, 9, 12), // "lightChanged"
QT_MOC_LITERAL(2, 22, 0), // ""
QT_MOC_LITERAL(3, 23, 11), // "tempChanged"
QT_MOC_LITERAL(4, 35, 12), // "humidChanged"
QT_MOC_LITERAL(5, 48, 12), // "pressChanged"
QT_MOC_LITERAL(6, 61, 10), // "altChanged"
QT_MOC_LITERAL(7, 72, 12), // "blockChanged"
QT_MOC_LITERAL(8, 85, 10), // "UpdateData"
QT_MOC_LITERAL(9, 96, 11), // "blockSignal"
QT_MOC_LITERAL(10, 108, 13), // "unblockSignal"
QT_MOC_LITERAL(11, 122, 10), // "lightValue"
QT_MOC_LITERAL(12, 133, 11), // "temperature"
QT_MOC_LITERAL(13, 145, 8), // "humidity"
QT_MOC_LITERAL(14, 154, 8), // "pressure"
QT_MOC_LITERAL(15, 163, 8), // "altitude"
QT_MOC_LITERAL(16, 172, 9) // "isBlocked"

    },
    "ReadData\0lightChanged\0\0tempChanged\0"
    "humidChanged\0pressChanged\0altChanged\0"
    "blockChanged\0UpdateData\0blockSignal\0"
    "unblockSignal\0lightValue\0temperature\0"
    "humidity\0pressure\0altitude\0isBlocked"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ReadData[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       6,   68, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       6,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   59,    2, 0x06 /* Public */,
       3,    0,   60,    2, 0x06 /* Public */,
       4,    0,   61,    2, 0x06 /* Public */,
       5,    0,   62,    2, 0x06 /* Public */,
       6,    0,   63,    2, 0x06 /* Public */,
       7,    0,   64,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       8,    0,   65,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       9,    0,   66,    2, 0x02 /* Public */,
      10,    0,   67,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,

 // methods: parameters
    QMetaType::Bool,
    QMetaType::Bool,

 // properties: name, type, flags
      11, QMetaType::Int, 0x00495001,
      12, QMetaType::Float, 0x00495001,
      13, QMetaType::Float, 0x00495001,
      14, QMetaType::Float, 0x00495001,
      15, QMetaType::Float, 0x00495001,
      16, QMetaType::Bool, 0x00495001,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,
       4,
       5,

       0        // eod
};

void ReadData::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<ReadData *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->lightChanged(); break;
        case 1: _t->tempChanged(); break;
        case 2: _t->humidChanged(); break;
        case 3: _t->pressChanged(); break;
        case 4: _t->altChanged(); break;
        case 5: _t->blockChanged(); break;
        case 6: _t->UpdateData(); break;
        case 7: { bool _r = _t->blockSignal();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 8: { bool _r = _t->unblockSignal();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (ReadData::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ReadData::lightChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (ReadData::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ReadData::tempChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (ReadData::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ReadData::humidChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (ReadData::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ReadData::pressChanged)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (ReadData::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ReadData::altChanged)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (ReadData::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ReadData::blockChanged)) {
                *result = 5;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<ReadData *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = _t->getLight(); break;
        case 1: *reinterpret_cast< float*>(_v) = _t->getTemperature(); break;
        case 2: *reinterpret_cast< float*>(_v) = _t->getHumidity(); break;
        case 3: *reinterpret_cast< float*>(_v) = _t->getPressure(); break;
        case 4: *reinterpret_cast< float*>(_v) = _t->getMyAltitude(); break;
        case 5: *reinterpret_cast< bool*>(_v) = _t->getIsBlocked(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject ReadData::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_ReadData.data,
    qt_meta_data_ReadData,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *ReadData::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ReadData::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ReadData.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int ReadData::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 9;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 6;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void ReadData::lightChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void ReadData::tempChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void ReadData::humidChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void ReadData::pressChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void ReadData::altChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void ReadData::blockChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
