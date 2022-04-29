<?php

namespace App\Command;

use App\Repository\ArticleRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;

#[AsCommand(
    name: 'app:publishArticle',
    description: 'Publie les articles',
)]
class PublishArticleCommand extends Command
{

    private $article;
    private $manager;

    public function __construct(ArticleRepository $article,  string $name =null,EntityManagerInterface $manager)
    {
        $this->article=$article;
        $this->manager=$manager;
        parent::__construct($name);
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);
        $articles=$this->article->findBy(["state"=>"a publier"]);
        foreach ($articles as $article) {
            $article->setState("publier");
        }
        $this->manager->flush();
        $io->success(count($articles).' articles publiés');

        return Command::SUCCESS;
    }
}
