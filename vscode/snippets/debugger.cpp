#include <bits/stdc++.h>
using namespace std;

// Helper struct to detect iterable types at compile time
template<typename T>
class is_iterable {
    template<typename U> static auto test(U* p) -> decltype(begin(*p), end(*p), true_type{});
    template<typename> static auto test(...) -> false_type;
public:
    static constexpr bool value = decltype(test<T>(nullptr))::value;
};

// Function template for printing non-iterable types
template<typename T>
typename enable_if<!is_iterable<T>::value>::type debug(T arg, string arg_name) {
    cerr << "[ " << arg_name << " : ";
    cerr << arg;
    cerr << " ]" << endl;
}

// Function template for printing iterable types
template<typename T>
typename enable_if<is_iterable<T>::value>::type debug(T arg, string arg_name) {
    cerr << "[ " << arg_name << " : ";
    for (const auto& item : arg) {
        cerr << item << " ";
    }
    cerr << "]" << endl;
}

// Debug macro
#define DEBUG(...) debug(__VA_ARGS__, #__VA_ARGS__)

int main() {
    float PI = acos(-1.0);
    int x = 135;
    vector<int> list = {1, 5, 82, 5, 7};
    DEBUG(PI);
    DEBUG(x);
    DEBUG(list);
}