<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class UserFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $user=new User();
        $user->setUsername("Paul");
        $user->setPassword("$2y$13\$KKdvv.j/tHAJWXI1urrRHuMP/ziBvTgKZTLfWzoqbssMcG/cXpRqG");
        
        $manager->persist($user);
        $admin=new User();
        $admin->setUsername("admin");
        $admin->setPassword("$2y$13\$m2PbyiZfMd/mFovytA2Ob.8deCLXGgZhj2gqHVeVAe5Luuwz9eh7C");
        $admin->setRoles(["ROLE_ADMIN"]);
        $manager->persist($admin);
        $manager->flush();
    }
}
