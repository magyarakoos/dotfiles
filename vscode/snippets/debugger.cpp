#include <bits/stdc++.h>
using namespace std;

template<class T>
struct has_begin_end {
    template<class U>
    static auto test(int) -> decltype(std::begin(std::declval<U>()) == std::end(std::declval<U>()), std::true_type());
    template<class U>
    static std::false_type test(...);
    static constexpr bool value = std::is_same<decltype(test<T>(0)), std::true_type>::value;
};

template<class T>
void debug(T arg, string arg_name) {
    cerr << "[ " << arg_name << " : ";
    if (has_begin_end<T>::value) {
        for (auto item : arg) {
            cerr << "   [ " << item << " ]\n";
        }
    } else {
        cerr << arg;
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