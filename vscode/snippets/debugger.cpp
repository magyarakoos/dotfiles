#include <bits/stdc++.h>
using namespace std;

template<class T, class... Args>
void debug(T arg, Args... args) {
#ifndef LOCAL
    cout << typeid(arg).name()
#endif
}