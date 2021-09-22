    #include "stdio.h"
    #include "stdlib.h"
    #include<time.h>
    clock_t  start, stop;
    /*clock_t是clock()函数返回的变量类型*/
    double duration;
    /*记录被测函数运行的时间*/
    void main ()
    {
        int m,l,p,q;
        printf("输入第一个矩阵的维数m和l:");
        scanf("%d%d",&m,&l);
        printf("输入第二个矩阵的维数p和q:");
        scanf("%d%d",&p,&q);
        while (l!=p)
        {
            printf("两个矩阵不匹配，不能进行相乘运算，请重新输入...\n\n");
            printf("输入第一个矩阵的维数m和l:\n");
            scanf("%d%d",&m,&l);
            printf("输入第二个矩阵的维数p和q:\n");
            scanf("%d%d",&p,&q);
        }
        start = clock();      /*开始计时*/
        int a[200][200]={0}, b[200][200]={0},sum=0;
        int i,j,k=0;

        for (i=0;i<m;i++)
        {
            for (j=0;j<l;j++)
            {
                a[i][j]=rand() % 100;
            }
        }
        printf("随机矩阵a是：\n");
        for (i=0;i<m;i++)
        {
            for (j=0;j<l;j++)
            {
                printf("%d ",a[i][j]);
            }
            printf("\n");
        }
        //cout<<"输入一个3*2的矩阵："<<endl;
        for (i=0;i<p;i++)
        {
            for (j=0;j<q;j++)
            {
                b[i][j]=rand() % 100;
            }
        }
        printf("随机矩阵b是：\n");
        for (i=0;i<p;i++)
        {
            for (j=0;j<q;j++)
            {
                printf("%d ",b[i][j]);
            }
            printf("\n");
        }
        printf("w*a*b结果为：\n");

        int w = rand() % 10;    //产生0~9的随机数

        for (i=0;i<m;i++)
        {
            while (k<q)
            {
                for (j=0;j<q;j++)
                {
                    sum = a[i][j]*b[j][k]+sum;
                }
                printf("%d ",w*sum);
                k++;
                sum=0;
            }
            k=0;
            printf("\n");
        }
        stop = clock();       /*停止计时*/
        duration = ((double)(stop - start)) / CLK_TCK;
        printf("矩阵乘法运行时间为：%f",duration);
    }
