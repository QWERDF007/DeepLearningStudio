#ifndef STDAFX_H
#define STDAFX_H

/**
 * 定义一个 Q_PROPERTY, type 为 `TYPE`, 名字为 `M`, 包含一个读取和写入的函数, 通知信号
 **/

#define Q_PROPERTY_AUTO(TYPE, M)                                                                                       \
  Q_PROPERTY(TYPE M MEMBER _##M NOTIFY M##Changed)                                                                     \
public:                                                                                                                \
  Q_SIGNAL void M##Changed();                                                                                          \
  void M(TYPE in_##M)                                                                                                  \
  {                                                                                                                    \
    _##M = in_##M;                                                                                                     \
    Q_EMIT M##Changed();                                                                                               \
  }                                                                                                                    \
  TYPE M()                                                                                                             \
  {                                                                                                                    \
    return _##M;                                                                                                       \
  }                                                                                                                    \
                                                                                                                       \
private:                                                                                                               \
  TYPE _##M;

#endif  // STDAFX_H
