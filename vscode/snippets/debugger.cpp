#include <bits/stdc++.h>
using namespace std;

template<class T>
void debug(T arg, string arg_name) {
    cerr << "[ " << arg_name << " : ";
    if (decltype(begin(declval<T>()), end(declval<T>()), true)) {
        for (const auto& item : arg) {
            cerr << "   [ " << item << " ]\n";
        }
    } else {
        cerr << arg;
    }
    cerr << " ]" << endl;
}

template<class T>
void debug(T arg, string labels[]) {
    #ifndef LOCAL
        return;
    #endif

    cerr << "[ ";
    for (int i = 0; i < sizeof(labels); ++i) {
        debug(arg, labels[i]);
    }
    cerr << " ]" << endl;
}

#define DEBUG(...) \
do { \
    string labels[] = {#__VA_ARGS__}; \
    debug(labels, __VA_ARGS__); \
} while(0)


int main() {
    float PI = acos(-1.0);
    int x = 135;
    vector<int> list = {1, 5, 82, 5, 7};
    DEBUG(PI, x, list);
}