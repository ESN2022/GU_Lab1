# Lab 1: “Let there be light”
# Introduction
Il s'agit d'un TP pour le cours Conception conjointe ESN11 du cadre de formation de Polytech Clermont. Dans ce TP, nous devons tout d'abord implémenter un chaser à LEDs 8 bits sur une carte DE10-Lite, ensuite nous devons l'activer à l'aide d'un bouton et enfin nous devons ajuster la vitesse du chaser à l'aide d'un switch à 4 bits.
Il y a deux façons de réaliser ce but, le polling et l'interruption. Dans un premier temps, nous utilisons le polling et ensuite, nous essayons d'utiliser l'interruption dans ce but.

# Architecture du système
Nous avons dessiné la structure de notre système sur le schéma suivant :

![image](https://github.com/ESN2022/GU_Lab1/blob/main/LAB1.jpg)

Afin de créer le système de base, j'ai ajouté **un module d'horloge**, **un module softcore NIOS II**, **un module de RAM** et **un module JATG UART** pour le débogage, comme le montre la figure.
J'ai ensuite ajouté 3 modules PIO pour gérer les différentes entrées et sorties, un **PIO de 8 bits** pour la LED, un **PIO de 4 bits** pour le SWITCH et un **PIO de 1 bit** pour le PUSH.
