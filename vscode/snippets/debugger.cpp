#include <bits/stdc++.h>
using namespace std;

template<class T>
void debug(T arg, string arg_name) {
    #ifndef LOCAL
        return;
    #endif

    cerr << "[ " << arg_name << " : ";

    bool can_iter = decltype(begin(declval<T>()), end(declval<T>()), true);
    if (can_iter) {
        for (const auto& item : arg) {
            cerr << "   [ " << item << " ]\n";
        }
    } else {
        cerr << item;
    }

    cerr << " ]" << endl;
}

#define DEBUG(...) do { \
    debug(__VA_ARGS__, #__VA_ARGS__); \
} while(0)

int main() {
    
}