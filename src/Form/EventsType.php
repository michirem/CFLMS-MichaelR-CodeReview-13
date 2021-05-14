<?php

namespace App\Form;

use App\Entity\Events;
use App\Entity\EventsTypes;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class EventsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px', 'placeholder' => 'Max Mustermann')))
            ->add('datetime', DateTimeType::class, array('attr' => array('style'=>'margin-bottom:15px')))
            ->add('description', TextareaType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px', 'placeholder' => 'max. 1000 letters/symbols')))
            ->add('image', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px', 'placeholder' => 'https://url.com')))
            ->add('capacity', NumberType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
            ->add('contact', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px', 'placeholder' => 'E-Mail or Name')))
            ->add('phone', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px', 'placeholder' => '+xx xxx xxx')))
            ->add('location', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px', 'placeholder' => 'i.e. Event Location Name')))
            ->add('address', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px', 'placeholder' => 'Street Name')))
            ->add('zip', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px', 'placeholder' => 'i.e. 2020')))
            ->add('city', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px', 'placeholder' => 'i.e. Vienna')))
            ->add('url', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px','placeholder' => 'https://url.com')))
            ->add('fkType', EntityType::class,[
                'class' => EventsTypes::class,
                'choice_label' => 'type',
                'label' => 'Type',
                'attr' => ['class' => 'form-select', 'style'=>'margin-bottom:15px']
                ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Events::class,
        ]);
    }
}
