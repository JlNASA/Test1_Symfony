<?php

namespace App\DataFixtures;

use App\Entity\Article;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class ArticleFixtures extends AppFixtures
{
    public function load(ObjectManager $manager): void
    {
        $state=["brouillon","publier"];
        for ($i=1; $i <=10 ; $i++) { 
            $article=new Article();
            $article->setTitre("Article n°".$i);
            $article->setContenu("Lorem Ipsum");
            $date=new \DateTime();
            $date->modify('-'.$i.'days');
            $article->setDateCreation($date);
            $article->setState($state[array_rand($state)]);
            $manager->persist($article);
            $this->addReference("article".$i, $article);
    } 
        $manager->flush();
        }
        
}
