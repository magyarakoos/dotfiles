#include <bits/stdc++.h>
using namespace std;

#define VARNAME(x) #x
template<class T, class... Args>
void debug(T arg, Args... args) {
    bool can_iter = decltype(begin(declval<T>()), end(declval<T>()), true);
    if (can_iter) {
    } else {

    }

    debug(args);
}