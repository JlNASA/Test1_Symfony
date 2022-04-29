<?php

namespace App\Controller;

use App\Entity\Article;
use App\Repository\ArticleRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/admin")
 */
class AdminController extends AbstractController
{
    #[Route("/article/ajouter", name:"ajout_article")]
    #[Route("/article/{id}/edit", name:"edition_article",requirements:["id"=>"\d+"],methods:["GET","POST"])]
    
    public function ajout(Article $article=null,Request $request,EntityManagerInterface $manager){
        if($article===null){
            $article=new Article();
        }
        
        $form=$this->createForm(ArticleType::class,$article);
        $form->handleRequest($request);     
        if($form->isSubmitted() && $form->isValid()){
            if($form->get('brouillon')->isClicked()){
                $article->setState("brouillon");
            }else{
                $article->setState("a publier");
            }
           if($article->getId()===null){
               $manager->persist($article);
           }
           
           $manager->flush();
           return $this->redirectToRoute("liste_articles");
            
        }
        return $this->renderForm('default/ajout.html.twig',['form' => $form]);

        
    }
    #[Route("/article/brouillon",name:"article_brouillon")]
    Public function vueBrouillon(ArticleRepository $article){
        $articles=$article->findBy(["state"=>"brouillon"]);
        return $this->render('default/index.html.twig',['controller_name'=>"DefaultController", 'articles'=>$articles,"brouillon"=>true]);
    }
}

