<?php

namespace App\Tests;

use App\Entity\Comment;
use App\Service\VerificationComment;
use PHPUnit\Framework\TestCase;

class VerificationCommentTest extends TestCase
{

    protected $comment;

    protected function setUp():void{
        $this->comment=new Comment();
    }

    public function testBanWord(){
        $service=new VerificationComment();
        $this->comment->setContenu("Le mot fdp est un banword");
        $result=$service->verifyComment($this->comment);
        $this->assertTrue($result);
    }

    public function testNoBanWord(){
        $service=new VerificationComment();
        $this->comment->setContenu("Le mot sympa n'est pas un banword");
        $result=$service->verifyComment($this->comment);
        $this->assertFalse($result);
    }
}
