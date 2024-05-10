#include <bits/stdc++.h>
using namespace std;

template<class T, class... Args>
void debug(T arg, Args... args) {
    decltype(begin(declval<T>()), end(declval<T>()), true_type{});
}