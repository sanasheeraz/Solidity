pragma solidity ^0.5.0;
contract EnrollStudent{
    address payable private myAccAdd;
    uint64 public NoOfStudents;
    uint256 public AmountCollected;
    struct Student{
        uint8 rollNo;
        string qualification;
        address Ethaddress;
        string name;
        uint8 age;
        gender stGender;
        courseType stCourse;
        bool BSdegree;
    }
    mapping(uint8 =>Student) students;
    enum gender{
        male,
        female
    }
    enum courseType{
        online,
        onsite
    }
    
    function setAddress(address payable add) public {
        myAccAdd = add;
    }
    function getBalance() public view returns(uint){
        return myAccAdd.balance;
    }
     function getAddress() public view returns(address){
        return myAccAdd;
    }
    function pay() public payable{
        myAccAdd.transfer(msg.value);
        AmountCollected+=msg.value;
    }
   
    function enrollStudent(uint8 _rollNo,string memory degree,address _Ethaddress,string memory _name,uint8 _age,gender _stGender,courseType _stCourse) public payable returns(uint256,uint256){
        bool b=false;
        // if(degree=="BS")
        // {
        //     b=true;
        // }
        if(keccak256('BS') == keccak256(bytes(degree))) {
            b=true;
        }
        require(msg.value == 2 ether);
        pay();
        students[_rollNo]=Student(_rollNo,degree,_Ethaddress,_name,_age,_stGender,_stCourse,b);
        //AmountCollected+=amount;
        NoOfStudents++;
        return(AmountCollected,NoOfStudents);
    }
}