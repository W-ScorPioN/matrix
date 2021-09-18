pragma solidity 0.4.19;
pragma experimental ABIEncoderV2;

contract BilindingContract{
    int256[][] BilindingArray1;
    int256[][] BilindingArray2;
    int256[][] BilindingArray3;
    int256[][] BilindingArray4;
    int256[][][2] answer;
    int256[][4] BilindingParamas;
    uint arraysize;
    uint oneStep=5;
    uint index1=0;
    uint index2=0;uint index3=0;uint index4=0;
    uint answerIndex1=0;
    uint answerIndex2 = 0;
    uint oneAnswerStep=5;
    
    function LoadArray(){
        
    }
    
    function inputArray_f(int256[][5] array) public{
        uint j =0;
        uint begin= index1*oneStep;
        uint end = begin + oneStep;
        for(begin; begin < end;begin++){
            for(uint k =0 ;k<arraysize ;k++){
            BilindingArray1[begin][0] = array[j][k];
                
            }
            j++;
        }
        
        index1++;
    }
    function inputArray_S(int256[][5] array) public{
        uint j =0;
        uint begin= index2*oneStep;
        uint end = begin + oneStep;
        for(begin; begin < end;begin++){
            for(uint k =0 ;k<arraysize ;k++){
            BilindingArray1[begin][0] = array[j][k];
                
            }
            j++;
        }
        
        index2++;
    }
    function inputArray_T(int256[][5] array) public{
        uint j =0;
        uint begin= index3*oneStep;
        uint end = begin + oneStep;
        for(begin; begin < end;begin++){
            for(uint k =0 ;k<arraysize ;k++){
            BilindingArray1[begin][0] = array[j][k];
                
            }
            j++;
        }
        
        index3++;
    }
    function inputArray_four(int256[][5] array) public{
        uint j =0;
        uint begin= index4*oneStep;
        uint end = begin + oneStep;
        for(begin; begin < end;begin++){
            for(uint k =0 ;k<arraysize ;k++){
            BilindingArray1[begin][0] = array[j][k];
                
            }
            j++;
        }
        
        index4++;
    }
    
    function ArraySize(uint n )public{
        arraysize = n;
        BilindingArray1.length = n;
            BilindingArray2.length = n;
            BilindingArray3.length = n;
            BilindingArray4.length = n;
            answer[0].length = n;
            answer[1].length = n;
            
        for(uint i = 0;i<n;i++){
            BilindingArray1[i].length = n;
            BilindingArray2[i].length = n;
            BilindingArray3[i].length = n;
            BilindingArray4[i].length = n;
            answer[0][i].length = n;
            answer[1][i].length = n;
            
        }
        for(i=0;i<4;i++){
            BilindingParamas[i].length = n;
        }
    }
    
    function initParamas(int256[][4] m_BilindingParamas) public {
        BilindingParamas = m_BilindingParamas;
        initAnswerWithoutConfuse();

    }
    
    function getData() public returns(int256[][] array){
        return BilindingArray1;
    }
    
    function initAnswer1(int256[][] answer1){
        uint j =0;
        uint begin = answerIndex1 * oneAnswerStep;
        uint end = (answerIndex1+1) * oneAnswerStep;
        for(;begin<end;begin++){
            for(uint k =0;k<arraysize;k++){
                answer[0][begin][k]= answer1[j][k];
            }
            
            j++;
            
        }
        answerIndex1++;
    }
    function initAnswer2(int256[][] answer2){
        uint j =0;
        uint begin = answerIndex2 * oneAnswerStep;
        uint end = (answerIndex2+1) * oneAnswerStep;
        for(;begin<end;begin++){
            for(uint k =0;k<arraysize;k++){
                answer[1][begin][k]= answer2[j][k];
            }
            j++;
            
        }
        answerIndex2++;
    }
    
    function initAnswerWithoutConfuse() public returns(int256[][] answerN){
            for(uint i=0;i<arraysize;i++){
                for(uint j=0;j<arraysize;j++){
                    answer[0][i][j] *=  BilindingParamas[0][i]*BilindingParamas[1][i];
                    answer[1][i][j] *=  BilindingParamas[2][i]*BilindingParamas[3][i];
            }
        }
    require(isSameMatrix(answer[0], answer[1]));
        return answer[0];
    }
    
    function isSameMatrix(int256[][] memory matrixFirst, int[][] memory matrixSecond) internal view returns (bool isSame){
        for(uint i = 0; i< arraysize; i++){
            for(uint j = 0; j< arraysize; j++){
                if(matrixFirst[i][j] != matrixSecond[i][j]){
                    return false;
                }
            }
        }
        return true;
    }
    
}
