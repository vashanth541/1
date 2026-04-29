#include <reg51.h>

unsigned int sec=0,min=0,hr=0;

void delay()
{
    int i,j;
    for(i=0;i<200;i++)
    for(j=0;j<1275;j++);
}

void main()
{
    while(1)
    {
        sec++;

        if(sec>=60)
        {
            sec=0;
            min++;
        }

        if(min>=60)
        {
            min=0;
            hr++;
        }

        if(hr>=24)
        hr=0;

        P1 = sec;     // seconds
        P2 = min;     // minutes
        P3 = hr;      // hours

        delay();
    }
}