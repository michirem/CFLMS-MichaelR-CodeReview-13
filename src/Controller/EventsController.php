<?php

namespace App\Controller;

use App\Entity\Events;
use App\Entity\EventsTypes;
use App\Form\EventsType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

/**
 * @Route("/events")
 */
class EventsController extends AbstractController
{
    /**
     * @Route("/", name="events_index", methods={"GET", "POST"})
     */
    public function index(Request $request): Response
    {
        $form = $this->createFormBuilder()
            ->add('fkType', EntityType::class,[
                'class' => EventsTypes::class,
                'choice_label' => 'type',
                'label' => 'Filter by Type',
                'attr' => ['class' => 'form-select', 'style'=>'margin-bottom:15px']
                ])
            ->getForm();
            $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $type = $form['fkType'];
            $filter = $type->getNormData();
            $id = $filter->getId();

            $events = $this->getDoctrine()
            ->getRepository(Events::class)
            ->findBy(
                ['fkType' => ['id' => $id]]
            );

            return $this->render('events/index.html.twig', [
                'events' => $events,
                'form' => $form->createView()]);
        } else {
            $events = $this->getDoctrine()
            ->getRepository(Events::class)
            ->findAll();

            return $this->render('events/index.html.twig', [
                'events' => $events,
                'form' => $form->createView()
        ]);
        }
    }

    /**
     * @Route("/new", name="events_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $event = new Events();
        $form = $this->createForm(EventsType::class, $event);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($event);
            $entityManager->flush();

            return $this->redirectToRoute('events_index');
        }

        return $this->render('events/new.html.twig', [
            'event' => $event,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="events_show", methods={"GET"})
     */
    public function show(Events $event): Response
    {
        return $this->render('events/show.html.twig', [
            'event' => $event,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="events_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Events $event): Response
    {
        $form = $this->createForm(EventsType::class, $event);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('events_index');
        }

        return $this->render('events/edit.html.twig', [
            'event' => $event,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="events_delete", methods={"POST"})
     */
    public function delete(Request $request, Events $event): Response
    {
        if ($this->isCsrfTokenValid('delete'.$event->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($event);
            $entityManager->flush();
        }

        return $this->redirectToRoute('events_index');
    }

     /**
     * @Route("/sure/{id}", name="events_sure")
     */
    public function forsure($id): Response
    {
        $event = $this->getDoctrine()->getRepository(Events::class)->find($id);
       return $this->render('events/sure.html.twig', array('event' => $event));
    }
    
    /**
     * @Route("/filter", name="event_filter")
     */
    public function filter(Request $request): Response
    {

        dd($request);
        // $events = $this->getDoctrine()
        //     ->getRepository(Events::class)
        //     ->find($fkType);
        
        // return $this->render('events/filter.html.twig', [
        //         'event' => $event,
        // ]);
    }
}
