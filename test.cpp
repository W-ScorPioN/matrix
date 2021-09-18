#include<math.h>
#include<stdlib.h>
#include<stdio.h>
#include <time.h>

#define N 20
#define oneStep 5
int array[2][N][N];
int answer[N][N];

void caculate(){
		for(int i=0;i<N;i++){
			for(int j=0;j<N;j++){
				int sum=0;
				for(int k=0;k<N;k++){
					sum+=array[0][i][k]*array[1][k][j];
				}
				answer[i][j]=sum;				
			}
		}
	}
int main(){
	clock_t beginT;
	clock_t endT;
	for(int i =0;i<2;i++){
		printf("\n[");
		for(int j=0;j<N;j++){
			printf("[");
			for(int k=0;k<N;k++){
				if(k<N-1){
					array[i][j][k]=rand()%50;
					printf("%d,",array[i][j][k]);
				}
				else if(k==N-1){
					array[i][j][k]=rand()%50;
					printf("%d",array[i][j][k]);
				}
			}
			if(j<N-1){
			printf("],");
		}
			else{
			printf("]");
		}
			if((j+1)%oneStep==0){
						printf("\n");
					}
		}
		printf("],");
	}
	printf("\"%d\",",N);
	printf("[");
	for(int j=0;j<6;j++){
		printf("[");
		for(int k=0;k<N;k++){
			if(k<N-1){
				printf("%d,",k);
			}
			else{
				printf("%d",k);
			}
		}
			if(j<5)
			printf("],");
			else{
				printf("]");
			}
		}
	printf("],[");
	for(int i=0;i<6;i++){
		printf("[");
		for(int j=0;j<N;j++){
			if(j<N-1){
				printf("%d,",1);
			}
			else{
				printf("%d",1);
			}
		}
		if(i<5)
		printf("],");
		else{
			printf("]");
		}
	 }
	 printf("],\"%d",N);
	 printf("\",\"%d\"",N);
	printf("\n");
	beginT = clock();
	for(int i =0;i<1000;i++){
		caculate();
	}
	endT = clock();
	printf("[[");
	for(int i=0;i<N;i++){
		if(i%5==0 && i!= 0){
			printf("\n");
		}
		printf("["); 
		for(int j=0;j<N;j++){
			if(j<N-1){
				printf("%d,",answer[i][j]);
			}else{
				printf("%d",answer[i][j]);
			}
		}
		if(i<N-1){
			printf("],");
		}else{
			printf("]]");
		}
	}
	
	printf("运算时间：%lf",(float)(endT-beginT));
}

