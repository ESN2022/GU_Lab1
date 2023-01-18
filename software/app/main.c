#include <stdio.h>
#include "system.h"
#include <sys/alt_irq.h>
#include <io.h>
#include <alt_types.h>
#include "sys/alt_sys_init.h"
#include "altera_avalon_pio_regs.h"
#include "priv/alt_legacy_irq.h"
#include "sys/alt_irq.h"

int start = 1
int delay = 50000;	
int vitesse = 1;

static void IRQ_Push(void* context,alt_u32 2)					//Interruption_Bouton pour Start/Stop
{
	start = !start;													//On lance le système
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PUSH_BASE,0x01); 				//Reset de l'interruption
}

static void IQR_Switch(void* context,alt_u32 1)					//Interruption_Switch pour la vitesse
{
	if(start == 1){													//On vérifie bien qu'on a lancé

		vitesse = vitesse + IORD_ALTERA_AVALON_PIO_DATA(SWITCH_BASE);			//On lit le nombre de switch levé
		delay = delay*vitesse;
		IOWR_ALTERA_AVALON_PIO_EDGE_CAP(SWITCH_BASE,0xFF); 			//Reset de l'interruption
	}
}







int main(){

	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PUSH_BASE, 0x1);		//Init de l'interruption du bouton
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PUSH_IRQ,PUSH_IRQ);
	alt_isr_register(PUSH_IRQ,NULL,(void*) IQR_Switch);

	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(SWITCH_BASE, 0xFF);				//Init de l'interruption de la vitesse
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(SWITCH_IRQ, SWITCH_IRQ);
	alt_isr_register(SWITCH_IRQ,NULL,(void*) IQR_Push);

	alt_printf("\nBienvenue sur mon code de chenillard avec interruption\n");

	int a = 1; 
	
	while(1){
		// Vitesse initiale
		IOWR_ALTERA_AVALON_PIO_DATA(LEDS_BASE,a);		// Ecriture de la valeur du PIO sur LED
		
		if (a > 0x80)									
			a = 0x01;
		else
			a = (a<<1);									// 1 bit a gauche chqaue fois
		
		usleep(vitesse);	
		} 

	return 0;
 }