// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Proposal {
   
   
    struct aProposal {
        uint256 proposalId;
        string  typeOfProposal;   // short name (up to 32 bytes)
        string proposalByMemberId; // number of accumulated votes
        string  proposalText;
        string[] memberIdNo;
        string[] memberIdYes;
    }

    aProposal[] public proposals;

  
    function createProposal(string memory typeOfProposalInput, string memory proposedByMember, string memory proposalTextInput) public {
            string[] memory emptyArray;
          proposals.push(aProposal({proposalId:(proposals.length + 1), typeOfProposal: typeOfProposalInput,proposalByMemberId: proposedByMember, proposalText: proposalTextInput, memberIdNo:emptyArray,memberIdYes:emptyArray }));
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieveProposalByMemberId(string memory memberId) public view returns (string memory, string memory){
        
            string memory ppText = "No proposal found";
            string memory ppType = "No proposal found"; 
           for (uint i = 0; i < proposals.length; i++) {
            // 'Proposal({...})' creates a temporary
            // Proposal object and 'proposals.push(...)'
            // appends it to the end of 'proposals'.
            if(keccak256(abi.encodePacked((proposals[i].proposalByMemberId))) == keccak256(abi.encodePacked((memberId))) ){
                ppText = proposals[i].proposalText;
                ppType = proposals[i].typeOfProposal;
            }
        }
        return (ppText, ppType);
    }

        /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieveProposalByProposalId(uint256 proposalId) public view returns (string memory, string memory, string[] memory, string[] memory){
        
            string memory ppText = "No proposal found";
            string memory ppType = "No proposal found"; 
            string[] memory membersYes;
            string[] memory membersNo; 

           for (uint i = 0; i < proposals.length; i++) {
            // 'Proposal({...})' creates a temporary
            // Proposal object and 'proposals.push(...)'
            // appends it to the end of 'proposals'.
            if(proposals[i].proposalId == proposalId){
                ppText = proposals[i].proposalText;
                ppType = proposals[i].typeOfProposal;
                membersYes = proposals[i].memberIdYes;
                membersNo = proposals[i].memberIdNo;

            }
        }
        return (ppText, ppType, membersYes, membersNo);
    }

    function voteOnProposal(string memory memberId, uint256 proposalId, string memory vote) public {

            for (uint i = 0; i < proposals.length; i++) {

            if(proposals[i].proposalId == proposalId){

                if(keccak256(abi.encodePacked((vote))) == "Yes"){
                    proposals[i].memberIdYes.push(memberId);
                }
                else{
                    proposals[i].memberIdNo.push(memberId);
                }
            }
        }


    }

}
