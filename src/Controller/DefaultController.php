<?php

namespace App\Controller;

use App\Entity\Article;
use App\Entity\Comment;
use App\Form\ArticleType;
use App\Form\CommentType;
use App\Repository\ArticleRepository;
use App\Repository\CategoryRepository;
use App\Service\VerificationComment;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Psr\Log\LoggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Flash\FlashBagInterface;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends AbstractController
{
    public function __construct(EntityManagerInterface $manager){
        $this->manager=$manager;
    }

    #[Route("/", name:"liste_articles")]
    public function listeArticles(ArticleRepository $articleRepository): Response
    {
        $articles=$articleRepository->findBy(["state"=>"publier"]);
        
        return $this->render('default/index.html.twig',['controller_name'=>"DefaultController", 'articles'=>$articles,"brouillon"=>false]);
    }



    /**
     * @Route("/{id}", name="vue-article", requirements={"id"="\d+"}, methods={"GET","POST"})
     */
    
    public function vueArticle(Article $article,Request $request, VerificationComment $verify)
    {
        
        $comment=new Comment();
        $comment->setArticle($article);
        $form=$this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            if($verify->verifyComment($comment)===false){
                $this->manager->persist($comment);
                $this->manager->flush();
                return $this-> redirectToRoute("vue-article",["id"=>$article->getId()]); 
            }else{
                $this->addFlash("danger", "Ton commentaire est méchant");
            }
            
        }
        return $this->renderForm('default/vue.html.twig', ['article'=>$article,"form"=>$form]);
    }

}