pragma solidity ^0.4.15;

contract AuthenticationContract  {
    uint256 public counter;
    string[] public userEmailLists;
    address[] public userAddresses;
    
    function AuthenticationContract(){
        counter=0;
    }
    
   struct  Details{
       string emailID;
       string password;
       string gender;
   }
   mapping(address =>Details) public registrationInfo;

  function stringsEqual(string storage _a, string memory _b) internal returns (bool) {
		bytes storage a = bytes(_a);
		bytes memory b = bytes(_b);
		if (a.length != b.length)
			return false;
		// @todo unroll this loop
		for (uint i = 0; i < a.length; i ++)
			if (a[i] != b[i])
				return false;
		return true;
	}

   function checkEmailExistence(string emailID) public constant returns(string){
       uint256 i;
        for(i=0;i<counter;i++){
            if(stringsEqual(userEmailLists[i],emailID))
             return "userExist";
        }
        if(i==counter)
        return "userNotExist";
   }

    function doSignUp(address userAddress, string userEmail, string userPassword, string userGender) public returns(string)  {
               registrationInfo[userAddress]=Details(userEmail,userPassword,userGender);
               userEmailLists.push(userEmail);
               userAddresses.push(userAddress);
               counter++;
               return "success";
    }
  
   function doLogin(string userEmail, string userPassword) public constant returns(bool){
       uint256 i;
       for(i=0;i<userAddresses.length;i++){
           if(stringsEqual(registrationInfo[userAddresses[i]].emailID,userEmail) && stringsEqual(registrationInfo[userAddresses[i]].password,userPassword)){
               return true;
           }
       }
       return false;
   }
}