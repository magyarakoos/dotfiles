#include <bits/stdc++.h>
using namespace std;

template<class T>
void debug_print(T arg, string arg_name) {
    cerr << "[ " << arg_name << " : ";
    if (decltype(begin(declval<T>()), end(declval<T>()), true)) {
        for (const auto& item : arg) {
            cerr << "   [ " << item << " ]\n";
        }
    } else {
        cerr << item;
    }
    cerr << " ]" << endl;
}

void debug() {
    #ifndef LOCAL 
        return;
    #endif
    
}
#define DEBUG(...) \
    #ifdef LOCAL \
     do { \
    string labels[] = {__VA_ARGS__}; \
    debug(__VA_ARGS__, labels); \
} while(0)

int main() {
    float PI = acos(-1.0);
    int x = 135;
    vector<int> list = {1, 5, 82, 5, 7};
}