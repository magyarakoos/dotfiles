#include <bits/stdc++.h>
using namespace std;

template<class T>
void debug(T arg, string arg_name) {
    cerr << "[ " << arg_name << " : ";
    try {
        for (auto item : arg) {
            cerr << "   [ " << item << " ]\n";
        }
    } catch {
        try {
            cerr << arg;
        } catch {
            cerr << "Could not print out value `" << arg_name << "`.\n";
        }
    }
    cerr << " ]" << endl;
}
#define DEBUG(...) debug(__VA_ARGS__, #__VA_ARGS__)

int main() {
    float PI = acos(-1.0);
    int x = 135;
    vector<int> list = {1, 5, 82, 5, 7};
    DEBUG(PI);
    DEBUG(x);
    DEBUG(list);
}