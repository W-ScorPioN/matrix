pragma solidity >=0.4.8 <0.8.17;

//matrix X all 3×3
contract OABE{
    string public state;
    struct X{
        uint8[10][10] X1;
        uint8[10][10] X2;
        uint8[10][10] X3;
        uint8[10][10] X4;        
    }

    struct C{
        uint16[10][10] C1;
        uint16[10][10] C2;
    }

    struct Y {
        uint16[10][10] Y1;
        uint16[10][10] Y2;
    }

    X private x;
    C private c;
    Y private y;

    address pkowner = 0xFeA919D83E060e73C5A43Dc14Cfb61B7a94Cf7a4;
    bytes32 commitment;
    bytes32 commitment_P;
    //address payable miner = 0xaB6132275d7CCf975f49b3496186E28f7f280605;
    
    //hash generate
    function generateHash(string memory str) public pure returns(bytes32) {
        return (sha256(bytes(str)));
    }
    //字符串比较
    function hashCompareInternal(string memory a, string memory b) public view returns (bool) {
        return (keccak256(bytes(a)) == keccak256(bytes(b)));
    }

    function uploadX1(uint8[10][10] memory inputX1, uint8[10][10] memory inputX2, uint8[10][10] memory inputX3, uint8[10][10] memory inputX4, bytes32 COMM, bytes32 COMM_P) public returns(bool){
        if (msg.sender!=pkowner){
            return false;
        }
        else {
            x.X1 = inputX1;
            x.X2 = inputX2;
            x.X3 = inputX3;
            x.X4 = inputX4;
            commitment = COMM;
            commitment_P = COMM_P;
            state = "X_Uploaded";
            return true;
        }
    }  
    function SendResult(uint16[10][10] memory inputC1, uint16[10][10] memory inputC2) public returns(bool){
        if(hashCompareInternal(state,"X_Uploaded")!=true){
            return false;
        }
        else if (msg.sender!=pkowner){
            return false;
        }
        else {
            c.C1 = inputC1;
            c.C2 = inputC2;  
            state = "Result_Uploaded";
            return true;
        }
    }

    function uploadP(uint8[10] memory inputP1, uint8[10] memory inputP3, uint8[10] memory inputP1_1, uint8[10] memory inputP3_1, string memory strbeforehash, string memory pbeforehash,uint res, uint x_digit, uint y_digit) public returns(bool){

        if(hashCompareInternal(state,"Result_Uploaded")!=true){
            return false;
        }
        else if (msg.sender!=pkowner){
            return false;
        }
        else if (generateHash(strbeforehash) != commitment){
            return false;
        }
        else if (generateHash(pbeforehash) != commitment_P){
            return false;
        }
        uint x_c1;
        uint y_c1;
        uint x_c2;
        uint y_c2;
        x_c1 = inputP1[x_digit-1];
        y_c1 = inputP3[y_digit-1];
        x_c2 = inputP1_1[x_digit-1];
        y_c2 = inputP3_1[y_digit-1];
        if (c.C1[x_c1][y_c1] != res && c.C2[x_c2][y_c2] != res) {
            return false;
        }
        state = "Finished";
        return true;
    }

    function getX() public view returns(X memory) {
        X memory tmpx = X({
            X1: x.X1,
            X2: x.X2,
            X3: x.X3,
            X4: x.X4
        });
        return tmpx;

    }
}