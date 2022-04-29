<?php

namespace App\Service;

use App\Entity\Comment;

class VerificationComment{
    public function verifyComment(Comment $comment){
        $pasAutorise=[
            "fdp",
            "salope",
            "pute",
            "con",
            "batard"
        ];
        foreach($pasAutorise as $word)
        if(strpos(" ".$comment->getContenu(),$word)){
            return true;
        }
       return false; 
    }
}