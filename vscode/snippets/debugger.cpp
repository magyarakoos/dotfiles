#include <bits/stdc++.h>
using namespace std;

template<class T, class... Args>
void debug(T arg, Args... args) {
    decltype(std::begin(std::declval<T>()), std::end(std::declval<T>()), std::true_type{});
}