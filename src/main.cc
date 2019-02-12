#include <stdio.h>

class Foo {
  Foo(int param);
  Foo(double param);
  Foo(bool param);
};

int main() {
    int* a = nullptr;
    void* p = (void*)a;
    if(p != nullptr)
    {
        return -1;
    }
    return 1;
}