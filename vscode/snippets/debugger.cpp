#include <bits/stdc++.h>
using namespace std;

template<class T, class... Args>
void debug(T arg, string arg_name, Args... args) {
    #ifndef LOCAL
        return;
    #endif

    cout << "[ " << arg_name << " : ";

    bool can_iter = decltype(begin(declval<T>()), end(declval<T>()), true);
    if (can_iter) {
        for (const auto& item : arg) {

        }
    } else {

    }

    cout << " ]\n";
    debug(args);
}