# Lab 1: “Let there be light”
# Introduction
Il s'agit d'un TP pour le cours Conception conjointe ESN11 du cadre de formation de Polytech Clermont. Dans ce TP, nous devons tout d'abord implémenter un chaser à LEDs 8 bits sur une carte DE10-Lite, ensuite nous devons l'activer à l'aide d'un bouton et enfin nous devons ajuster la vitesse du chaser à l'aide d'un switch à 4 bits.
Il y a deux façons de réaliser ce but, le polling et l'interruption. Dans un premier temps, nous utilisons le polling et ensuite, nous essayons d'utiliser l'interruption dans ce but.

# Architecture du système
Nous avons dessiné la structure de notre système sur le schéma suivant :

![image](https://github.com/ESN2022/GU_Lab1/blob/main/LAB1.jpg)

Afin de créer le système de base, j'ai ajouté **un module d'horloge**, **un module softcore NIOS II**, **un module de RAM** et **un module JATG UART** pour le débogage, comme le montre la figure.
J'ai ensuite ajouté 3 modules PIO pour gérer les différentes entrées et sorties, un **PIO de 8 bits** pour la LED, un **PIO de 4 bits** pour le SWITCH et un **PIO de 1 bit** pour le PUSH.
Dans le but de faciliter l'implémentation du chaser en utilisant des interruptions, j'ai activé les interruptions lors de la connexion des composants sur QSYS.

Le schéma suivant montre le système sur **QSYS** :

Après avoir terminé la configuration hardware , j'ai écrit le fichier HDL, assigné les pins et compilé le fichier. Après avoir corrigé tous les erreurs, je suis passé à la partie software.

# Avancement et résultats
J'ai implémenté une fonction de chaser 8 bits à vitesse réglable déclenchée par un bouton en utilisant respectivement le polling et les interruptions, le principe de base est le suivant :
## éclairer le Led
J'allume la Led correspondante en mettant la sortie PIO à 1.
## Principe du chaser
Je fixe la valeur initiale du PIO de la LED à 0x01, et je décale 1 bit vers la gauche chaque fois, lorsque le décalage est le plus à gauche, j'écris à nouveau la valeur initiale dans le PIO, et ainsi de suite pour réaliser la fonction de chaser.
## Bouton de démarrage
Il faut tout d'abord préciser que sur la carte DE-10 Lite, le bouton est toujours en **état haut** lorsqu'il n'est pas activé, et seulement quand le bouton est pressé, il sort un état bas. J'ai donc ajouté une autre boucle avant le code de la boucle du chaser, où la LED est continuellement écrite à la valeur 0xFF lorsque le bouton n'est pas pressé, et le programme ne sort de cette boucle que lorsque le bouton est pressé.
## Switch pour changer la vitesse
Comme le DE10 fonctionne à une fréquence élevée, j'ai utilisé **usleep()** après chaque décalage pour que le programme effectue un retard afin de distinguer clairement les LEDs, ce qui a également créé les conditions pour que je puisse changer la vitesse du chaser. J'ai réglé le temps de retard initial à 50000, mais avant chaque exécution de la fonction de retard, j'ai multiplié le temps de retard initial par la valeur représentée par **l'état de Switch** que j'ai lu, et j'ai ajouté à nouveau la valeur initiale à la fin pour éviter une valeur 0, de sorte que je puisse ajuster la vitesse du chasseur en modifiant le temps de retard du programme.
