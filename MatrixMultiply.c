    #include "stdio.h"
    #include "stdlib.h"
    #include<time.h>
    clock_t  start, stop;
    /*clock_t��clock()�������صı�������*/
    double duration;
    /*��¼���⺯�����е�ʱ��*/
    void main ()
    {
        int m,l,p,q;
        printf("�����һ�������ά��m��l:");
        scanf("%d%d",&m,&l);
        printf("����ڶ��������ά��p��q:");
        scanf("%d%d",&p,&q);
        while (l!=p)
        {
            printf("��������ƥ�䣬���ܽ���������㣬����������...\n\n");
            printf("�����һ�������ά��m��l:\n");
            scanf("%d%d",&m,&l);
            printf("����ڶ��������ά��p��q:\n");
            scanf("%d%d",&p,&q);
        }
        start = clock();      /*��ʼ��ʱ*/
        int a[200][200]={0}, b[200][200]={0},sum=0;
        int i,j,k=0;

        for (i=0;i<m;i++)
        {
            for (j=0;j<l;j++)
            {
                a[i][j]=rand() % 100;
            }
        }
        printf("�������a�ǣ�\n");
        for (i=0;i<m;i++)
        {
            for (j=0;j<l;j++)
            {
                printf("%d ",a[i][j]);
            }
            printf("\n");
        }
        //cout<<"����һ��3*2�ľ���"<<endl;
        for (i=0;i<p;i++)
        {
            for (j=0;j<q;j++)
            {
                b[i][j]=rand() % 100;
            }
        }
        printf("�������b�ǣ�\n");
        for (i=0;i<p;i++)
        {
            for (j=0;j<q;j++)
            {
                printf("%d ",b[i][j]);
            }
            printf("\n");
        }
        printf("w*a*b���Ϊ��\n");

        int w = rand() % 10;    //����0~9�������

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
        stop = clock();       /*ֹͣ��ʱ*/
        duration = ((double)(stop - start)) / CLK_TCK;
        printf("����˷�����ʱ��Ϊ��%f",duration);
    }
