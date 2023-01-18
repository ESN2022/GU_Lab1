#include <stdio.h>
#include "system.h"
#include <sys/alt_irq.h>
#include <io.h>
#include <alt_types.h>
#include "sys/alt_sys_init.h"
#include "altera_avalon_pio_regs.h"
#include "priv/alt_legacy_irq.h"
#include "sys/alt_irq.h"

int main()
{
	 int a = 0x01; 										// Valeur initiale du PIO pour LEDs
	 
	 //Le premier boucle, lorsque le bouton n'est pas presse, Leds de 7-bit est toujours allumee 
	 //Une fois le bouton presse, le programme sort de cette boucle
	 while(IORD_ALTERA_AVALON_PIO_DATA(PUSH_BASE)){
		 IOWR_ALTERA_AVALON_PIO_DATA(LEDS_BASE,0xFF);
		 }
	
	 //Deuxieme boucle
	 while(1){
		int vitesse = 1;								// Vitesse initiale
		IOWR_ALTERA_AVALON_PIO_DATA(LEDS_BASE,a);		// Ecriture de la valeur du PIO sur LED
		
		if (a > 0x80)									
			a = 0x01;
		else
			a = (a<<1);									// 1 bit a gauche chqaue fois
		
		// Changement de vitesse
		vitesse = vitesse + IORD_ALTERA_AVALON_PIO_DATA(SWITCH_BASE);
		usleep(50000*vitesse);	
		
		} 		 
}
