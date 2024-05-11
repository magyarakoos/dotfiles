#pragma once

#include <bits/stdc++.h>
using namespace std;

template<typename T>
class is_iterable {
    template<typename U> static auto test(U* p) -> decltype(begin(*p), end(*p), true_type{});
    template<typename> static auto test(...) -> false_type;
public:
    static constexpr bool value = decltype(test<T>(nullptr))::value;
};

template<typename T>
typename enable_if<!is_iterable<T>::value>::type debug(T arg, string arg_name) {
    #ifndef LOCAL
        return;
    #endif
    cerr << "[ " << arg_name << " : ";
    cerr << fixed << setprecision(15) << arg;
    cerr << " ]" << endl;
}

template<typename T>
typename enable_if<is_iterable<T>::value>::type debug(T arg, string arg_name) {
    #ifndef LOCAL
        return;
    #endif
    cerr << "[ " << arg_name << " : ";
    for (const auto& item : arg) {
        cerr << fixed << setprecision(15) << item << " ";
    }
    cerr << "]" << endl;
}

#define DEBUG(x) debug(x, #x)
#define DB1(x) DEBUG(x)
#define DB2(x, ...) DEBUG(x), DB1(__VA_ARGS__)
#define DB3(x, ...) DEBUG(x), DB2(__VA_ARGS__)
#define DB4(x, ...) DEBUG(x), DB3(__VA_ARGS__)
#define DB5(x, ...) DEBUG(x), DB4(__VA_ARGS__)
#define GET_MACRO(_1, _2, _3, _4, _5, NAME, ...) NAME
#define DB(...) GET_MACRO(__VA_ARGS__, DB5, DB4, DB3, DB2, DB1)(__VA_ARGS__)
