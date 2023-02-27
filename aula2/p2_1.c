#include <detpic32.h>

void delay(unsigned int ms);

int main(void) {
    int cnt1 = 0;
    int cnt5 = 0;
    int cnt10 = 0;
    int aux = 0;
    while(1) {
        delay(100);
        printInt(cnt1++, 10 | 4 << 16); 
        printStr("\t");
        printInt(cnt5, 10 | 4 << 16); 
        printStr("\t");
        printInt(cnt10, 10 | 4 << 16); 
        if(aux%2==0)cnt5++;
        if(aux==10)
        {
            cnt10++;
            aux = 0;
        }
        aux++;
        putChar('\r');
    }
    return 0;
}

void delay(unsigned int ms){
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
} 