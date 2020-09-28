pragma solidity ^0.5.0;

contract studentEnroll{
    
    address payable myAddress;
    
    enum Gender{
        male,
        female
    }
    
    enum Class{
        onsite,
        online
    }
 
    struct StudentData {
        string name;
        uint8 age;
        bool degree;
        uint rollNumber;
        address stdAddress;
        Gender gender;
        Class class;
    }   
    
    mapping (uint=>StudentData) studentRecord;
    
    function setAddress (address payable _myAddress) public{
        myAddress=_myAddress;
    }
    
    function getBalance() public view returns(uint){
        return myAddress.balance;
    }
    
    function enrollStudent(string memory _name, uint8 _age, bool _degree, uint _rollNumber, address _stdAddress, Gender _gender, Class _class) public payable {
        require(msg.value>=2 ether);
            StudentData memory student = StudentData(_name,_age,_degree,_rollNumber,_stdAddress,_gender,_class);
            studentRecord[_rollNumber]=student;
            myAddress.transfer(msg.value);
        
    }
    
    function getStudentRecord(uint _rollNumber) public view returns(string memory, uint8, bool, uint, address, Gender, Class){
        return (studentRecord[_rollNumber].name, studentRecord[_rollNumber].age, studentRecord[_rollNumber].degree, studentRecord[_rollNumber].rollNumber, studentRecord[_rollNumber].stdAddress, studentRecord[_rollNumber].gender, studentRecord[_rollNumber].class);
    }
    
    function hasDegree(uint _rollNumber) public view returns(bool){
        return studentRecord[_rollNumber].degree;
    }
    
}