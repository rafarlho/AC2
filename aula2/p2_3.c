#include <detpic32.h>

void delay(unsigned int ms);

int main(void) {
    int cnt1 = 0;
    int cnt5 = 0;
    int cnt10 = 0;
    int aux = 0;
    int delay_val = 100;
    while(1) {
        if(inkey() == 'a') delay_val = delay_val/2;
        if(inkey() == 'n') delay_val = delay_val*2;
        delay(delay_val);
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