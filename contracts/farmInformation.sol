pragma solidity ^0.4.24;
import "../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract farmInformation is Ownable
{

    address creator;     // At first, an empty "address"-type variable of the name "creator". Will be set in the constructor.

    string greetingString ;     // At first, an empty "string"-type variable of the name "greeting". Will be set in constructor and can be changed.

    uint totalUserRating;

    uint userRatingCount;

    constructor(string _greeting) public   // The constructor. It accepts a string input and saves it to the contract's "greeting" variable.

    {

        creator = msg.sender;

        greetingString = _greeting;

        totalUserRating = 0;

        userRatingCount = 0;

    }



    function greet() public returns (string)

    {

        return greetingString;

    }



    function getBlockNumber() public returns (uint) // this doesn't have anything to do with the act of greeting

    {                                                   // just demonstrating return of some global variable - can be used to track products as QR code.

        return block.number;

    }



    function getRatingCount() public returns (uint)

    {                                                   

        return userRatingCount;

    }

    function getTotalRating() public returns (uint)

    {                                                   

        return totalUserRating;

    }

    function setTotalRating(uint rating) public

    {                                                   

        totalUserRating += rating;

        userRatingCount += 1;

    }

    function setGreeting(string _newgreeting) public onlyOwner

    {

        greetingString = strConcat(greetingString,' ', _newgreeting, ' ');

    }

    function strConcat(string _a, string _b, string _c, string _d) internal returns (string){
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        bytes memory _bc = bytes(_c);
        bytes memory _bd = bytes(_d);
        string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length);
        bytes memory babcde = bytes(abcde);
        uint k = 0;
        for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
        for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
        for (i = 0; i < _bc.length; i++) babcde[k++] = _bc[i];
        for (i = 0; i < _bd.length; i++) babcde[k++] = _bd[i];
    return string(babcde);
    }
}