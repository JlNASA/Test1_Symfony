<?php

namespace App\DataFixtures;

use App\Entity\Category;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class CategoryFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $sport=new Category();
        $sport->setName("sport");
        $sport->addArticle($this->getReference("article1"));
        $sport->addArticle($this->getReference("article2"));
        $sport->addArticle($this->getReference("article3"));
        $manager->persist($sport);

        $maison=new Category();
        $maison->setName("maison");
        $maison->addArticle($this->getReference("article2"));
        $maison->addArticle($this->getReference("article3"));
        $maison->addArticle($this->getReference("article4"));
        $manager->persist($maison);

        $manager->flush();
    }
    public function getDependencies(){
        return[
            ArticleFixtures::class
        ];
    }
}
