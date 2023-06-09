
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ChatDapp{
    struct Users{
        string name;
        friend [] friendList;

    }
    struct friend{
        address pkey;
        string name;

    }

struct AllUserStruck{
    string name;
    address accountAddress;
}
    struct message{
        address sender;
        uint256 timestamp;
        string msg;
    }
 AllUserStruck [] getAllUsers;

mapping (address => Users) userlist;
mapping(bytes32 => message[]) allmessage;

function Existence(address pkey) public view returns(bool){
    return bytes (userlist[pkey].name).length>0;

}
function Account(string calldata name) external {
    require(Existence(msg.sender) == false, "User Exist in the Application");
    require(bytes(name).length>0,"Please Enter Your UserName ");
    userlist[msg.sender].name=name;
getAllUsers.push(AllUserStruck(name, msg.sender));
}

function GetUsername(address pkey) external view returns(string memory){

require(Existence(pkey), "You are not register ");
return userlist[pkey].name;
}

function addfriend(address friend_key1 , string calldata name ) external{
    require(Existence(msg.sender),"Create Your Account");
require(Existence(friend_key1),"User is not register");
require(msg.sender != friend_key1,"User is already registerd as a friend");
require(Alreadyfriend(msg.sender,friend_key1)==false,"Its already register as friend");

_addfriend(msg.sender, friend_key1,name);
_addfriend(friend_key1,msg.sender,userlist[msg.sender].name);
}
function Alreadyfriend(address pkey1, address pkey2)internal view returns (bool){
    if(userlist[pkey1].friendList.length > userlist[pkey2].friendList.length){
      address temp=pkey1;
      pkey1 =pkey2;
      pkey2=temp;
    }
    for (uint256 i=0; i< userlist[pkey1].friendList.length;i++) {


        if(userlist[pkey1].friendList[i].pkey==pkey2)
        return true;
    }
    return false;
    }

    function _addfriend (address me , address friend_key, string memory name ) internal{

        friend memory newfriend = friend(friend_key,name);

        userlist[me].friendList.push(newfriend);
    }

    function getfrienddata() external view returns (friend[] memory){
        return userlist[msg.sender].friendList;
    }

function _getchatcode(address pkey1, address pkey2) internal pure returns (bytes32){
    if(pkey1 <pkey2){
        return keccak256(abi.encodePacked(pkey1 ,pkey2));
    }
    else return keccak256(abi.encodePacked(pkey2 ,pkey1));
    }

    function sendMessage(address friend_key, string calldata _msg) external {
  require(Existence(msg.sender),"Create Your Account");
     require(Existence(friend_key),"You Are Not Register");
      require(Alreadyfriend(msg.sender,friend_key),"You Are Not a Friend with The User");
      bytes32 chatcode= _getchatcode(msg.sender , friend_key);
 message memory newMsg=  message(msg.sender, block.timestamp,_msg);
 allmessage[chatcode].push(newMsg);
}

function readmessage(address friend_key) external view returns (message[] memory){
     bytes32 chatcode= _getchatcode(msg.sender , friend_key);
     return allmessage[chatcode];
}
function getAllappUsers() public view returns ( AllUserStruck [] memory){
     return getAllUsers;
}
}